package monkey.module 
{	
	import monkey.as3.Updateable;
	/**
	 * ...
	 * @author matix
	 */
	public interface IPluginModule extends IModule, Updateable
	{
		function set active(value:Boolean):void;
		function get active():Boolean;
		
		function get updatePriority():int;
		
		/*HOOKS*/
		function afterModelUpdate():void;
		function beforeInput(inputQueue:Array):void;
		function beforeRender():void;
		function afterRender():void;
		function beforeBinding():void;
		function afterBinding():void;
	}
	
}