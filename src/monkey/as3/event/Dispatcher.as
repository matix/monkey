package monkey.as3.event 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	/**
	 * Lightweight EventDispatcher replacement, uses the central EventManager for dispatching events.
	 * @author matix
	 */
	public class Dispatcher implements IEventDispatcher
	{
		private var p_eventManager:EventManager;
		
		public function Dispatcher() 
		{
			p_eventManager = EventManager.manager;
		}
		
		/* INTERFACE flash.events.IEventDispatcher */
		
		public function dispatchEvent(event:Event):Boolean 
		{
			p_eventManager.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean 
		{
			p_eventManager.targetHasEventListener(this, type);
		}
		
		public function willTrigger(type:String):Boolean 
		{
			p_eventManager.targetWillTrigger(this, type);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			p_eventManager.removeTargetEventListener(this, type, listener, useCapture);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			p_eventManager.addTargetEventListener(this,type, listener, useCapture, priority, useWeakReference);
		}
		
	}

}