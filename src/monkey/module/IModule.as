package monkey.module 
{
	import monkey.as3.Destroyable;
	import monkey.as3.Initializable;
	
	/**
	 * ...
	 * @author matix
	 */
	public interface IModule extends Initializable, Destroyable
	{
		function get moduleID():String;
	}
	
}