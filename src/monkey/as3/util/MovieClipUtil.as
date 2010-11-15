package monkey.as3.util
{
	import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * Populates utility methods to work with multi-frame movieclips.
	 * @author matix
	 */
    public class MovieClipUtil
    {
        /**
         * Defines aspects of the animation cycle desired for an multi-frame movieclip instance given
         * @param mc is the multi-frame moveclip to setup, or an DisplayObjectContainer whose children wants to setup using the "recursive" param
         * @param animationParams are the aspects to setup, such as:
         * - stopOnLastFrame: true|false
         * - stopOnFrame: uint > 0;
         * - startStopped: true|false
         * - recursive: true|false (applies setup to children movieclips in the object given by the mc param) WARNING!: CPU-Intensive if many degrees of children
         */
        public static function setupAnimationCycle(mc:Object, animationParams:Object):void
        {
            if (mc is MovieClip)
            {
                if (animationParams.stopOnLastFrame)
                {
                    var stopOnLast:Function = function(e:Event):void
                       {
                       var target:MovieClip = (e.target as MovieClip);
                       if (target.currentFrame == target.totalFrames)
                       {
                       target.removeEventListener(Event.ENTER_FRAME, stopOnLast);
                       target.stop();
                       }
                       }
                     mc.addEventListener(Event.ENTER_FRAME, stopOnLast);
                    //DEPRECATED:
					// WARNING: UNDOCUMENTED! might stop working on further versions of flash player
                    // works width cero-based frames, so for last frame should use totalFrames-1
                    //mc.addFrameScript(mc.totalFrames-1,mc.stop);
                }

                if(animationParams.stopOnFrame > 0){
                    // WARNING: UNDOCUMENTED! might stop working on further versions of flash player
                    // works width cero-based frames, so for frame n should use n-1
                    mc.addFrameScript(animationParams.stopOnFrame-1,mc.stop);
                }

                if (animationParams.startStopped)
                {
                    mc.gotoAndStop(1);
                }
            }

            if (animationParams.recursive)
            {
                if (mc is DisplayObjectContainer)
                {
                    for (var i:int = 0; i < mc.numChildren; i++)
                    {
                        setupAnimationCycle(mc.getChildAt(i), animationParams);
                    }
                }
            }
        }
		
		/**
		 * Dispatches a given event object when the mc instance given reaches the specified frame
		 * @param	mc:MovieClip, the target movieclip
		 * @param	frame:uint, the frame where the event will be dispatched
		 * @param	event:Event, the event object to be dispatched
		 * @param   onlyOnce:Boolean, if true the events is dispatched only once an then removed
		 */
		public static function dispatchEventOnFrame (mc:MovieClip, frame:Object, event:Event, onlyOnce:Boolean = true):void {
			//DEPRECATED: overrides the preexisting code in the frame
			/*mc.addFrameScript(frame-1, function ():void {
				mc.dispatchEvent(event);
				if (onlyOnce) {
					mc.addFrameScript(frame-1, null);
				}
			});*/
			var dispatchOnFrame:Function = function(e:Event):void
		   {
			   var target:MovieClip = (e.target as MovieClip);
			   var frameReached:Boolean = false;
			   if (frame is int) {
				   frameReached = target.currentFrame == frame;
			   }
			   else if (frame is String) {
				   frameReached = target.currentLabel == frame;
			   }
			   else throw new ArgumentError("Unsupported frame type!!");
			   if (frameReached)
			   {
					if(onlyOnce){
						target.removeEventListener(Event.ENTER_FRAME, dispatchOnFrame);
					}
					try{
						mc.dispatchEvent(event);
					}
					catch (e:Error) {
						mc.removeEventListener(Event.ENTER_FRAME, dispatchOnFrame);
					}
			   }
		   }
		   mc.addEventListener(Event.ENTER_FRAME, dispatchOnFrame);
		}
		
		/**
		 * Calls a given function when the movie clip reaches a certain frame.
		 * @param	mc the movie clip to check.
		 * @param	frame the frame to be reached as condition to invoke the callback function.
		 * @param	callback the callback function.
		 * @param	onlyOnce a flag that determines if the cllaback function should be called once or every time the movie clip reaches the frame.
		 */
		public static function callbackOnFrame(mc:MovieClip, frame:Object, callback:Function, onlyOnce:Boolean = true):void {
			var checkCallback:Function = function(e:Event):void
		   {
			   var target:MovieClip = (e.target as MovieClip);
			   var frameReached:Boolean = false;
			   if (frame is int) {
				   frameReached = target.currentFrame == frame;
			   }
			   else if (frame is String) {
				   frameReached = target.currentLabel == frame;
			   }
			   else throw new ArgumentError("Unsupported frame type!!");
			   if (frameReached)
			   {
					if(onlyOnce){
						target.removeEventListener(Event.ENTER_FRAME, checkCallback);
					}
					try{
						callback.call();
					}
					catch (e:Error) {
						//trace( "e : " + e );
						mc.removeEventListener(Event.ENTER_FRAME, checkCallback);
					}
			   }
		   }
		   mc.addEventListener(Event.ENTER_FRAME, checkCallback);
		}
		
		/**
		 * Plays a movie clip from the last to the first frame.
		 * @param	mc the movie clip to play.
		 * @param	fps the frame-per-second value in witch the mc should be played.
		 * @param	fromLastFrame a flag determinig if the playhead of the mc should be moved to the last frame before beginnig to play it.
		 */
		public static function playBackwards(mc:MovieClip, fps:int = 30, fromLastFrame:Boolean = false ):void  {
			if (fromLastFrame) mc.gotoAndStop(mc.totalFrames);
			var timer:Timer = new Timer(1000/fps, mc.currentFrame);
			var onTick:Function = function (e:TimerEvent):void {
				mc.gotoAndStop(mc.currentFrame-1);
			};
			timer.addEventListener(TimerEvent.TIMER, onTick);
			timer.start();
		}
		
		/**
		 * Plays a subset of frames in a given movie clip.
		 * @param	mc the movie clip to play.
		 * @param	fromFrame the starting frame.
		 * @param	untilFrame the final frame to play to.
		 */
		public static function playUntil(mc:MovieClip, fromFrame:Object, untilFrame:Object):void {
			mc.gotoAndStop(fromFrame);
			var checkFrame:Function = function(e:Event):void {
				if (mc.currentFrame == untilFrame || mc.currentLabel == untilFrame) {
					mc.removeEventListener(Event.ENTER_FRAME, checkFrame);
					mc.stop();
					mc.dispatchEvent(new Event("untilFrameReached", untilFrame));
				}
			}
			mc.addEventListener(Event.ENTER_FRAME, checkFrame);
			mc.play();
		}
		
		/**
		 * Stops a full tree of nested movie clips.
		 * @param	target the root of the movie clips tree.
		 * @param	recursive a flag determining wheter to stop only the root of the tree (false) or the whole tree (true)
		 * @param	onlyChildren a flag determining if the root of the tree will be stopped or only its children.
		 */
		public static function stop(target:DisplayObjectContainer, recursive:Boolean = true, onlyChildren:Boolean = false):void {
			if (target is MovieClip && !onlyChildren) MovieClip(target).stop();
			if(recursive){
				for (var i:int = 0; i < target.numChildren; i++) 
				{
					var child:DisplayObject = target.getChildAt(i);
					if (child is MovieClip) {
						stop(child as MovieClip);
					}
				}
			}
		}
		
		/**
		 * Plays a full tree of nested movie clips.
		 * @param	target the root of the movie clips tree.
		 * @param	recursive a flag determining wheter to play only the root of the tree (false) or the whole tree (true)
		 * @param	onlyChildren a flag determining if the root of the tree will be played or only its children.
		 */
		 public static function play(target:DisplayObjectContainer, recursive:Boolean = true, onlyChildren:Boolean = false):void {
			if (target is MovieClip && !onlyChildren) MovieClip(target).play();
			if(recursive){
				for (var i:int = 0; i < target.numChildren; i++) 
				{
					var child:DisplayObject = target.getChildAt(i);
					if (child is MovieClip) {
						play(child as MovieClip);
					}
				}
			}
		}
    }
}

