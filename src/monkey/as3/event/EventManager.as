package monkey.as3.event 
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import monkey.as3.Destroyable;
	import monkey.as3.Initializable;
	
	/**
	 * ...
	 * @author matix
	 */
	public class EventManager implements IEventDispatcher, Initializable, Destroyable
	{
		private var p_centralHub:EventDispatcher;
		private var p_targetMap:Dictionary;
		
		public function EventManager() 
		{
			if (p_instance)
			{
				throw new IllegalOperationError("EventManager is singleton, could not create instance");
			}
		}
		
		private static var p_instance:EventManager;
		
		public static function get manager():EventManager
		{
			if (!p_instance)
			{
				p_instance = new EventManager();
				p_instance.initialize();
			}
			return p_instance;
		}
		
		/* INTERFACE monkey.as3.Destroyable */
		
		public function dispose():void 
		{
			p_centralHub = null;
		}
		
		/* INTERFACE monkey.as3.Initializable */
		
		public function initialize():void 
		{
			p_centralHub = new EventDispatcher(this);
			p_targetMap = new Dictionary(true);
		}
		
		/* INTERFACE flash.events.IEventDispatcher */
		
		public function dispatchEvent(event:Event):Boolean 
		{
			return p_centralHub.dispatchEvent(event);
		}
		
		public function targetHasEventListener(target:IEventDispatcher, type:String):Boolean 
		{
			//TODO: implement this! ASAP!
			return true;
		}
		
		public function hasEventListener(type:String):Boolean 
		{
			return p_centralHub.hasEventListener(type);
		}
		
		public function targetWillTrigger(target:IEventDispatcher, type:String):Boolean 
		{
			//TODO: implement this! ASAP!
			return true;
		}
		
		public function willTrigger(type:String):Boolean 
		{
			return p_centralHub.willTrigger(type);
		}
		
		public function removeTargetEventListener(target:IEventDispatcher, type:String, listener:Function, useCapture:Boolean = false):void
		{
			if (!p_targetMap[target]) return;
			delete p_targetMap[target][type];
			p_centralHub.removeEventListener(type, listener, useCapture);
		}
		
		public function addTargetEventListener(target:IEventDispatcher, type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			if (!p_targetMap[target])
			{
				p_targetMap[target] = new Dictionary();
			}
			p_targetMap[target][type] = listener;
			p_centralHub.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			p_centralHub.removeEventListener(type, listener, useCapture);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			p_centralHub.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
	}

}