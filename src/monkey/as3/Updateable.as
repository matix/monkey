package monkey.as3 
{
	/**
	 * Represents an object that needs to be updated at a certain period of time.
	 * @author matix
	 */
	public interface Updateable 
	{
		/**
		 * Performs some update operations on the object.
		 * @param	delta the time passed since the last time object was updated.
		 */
		function update(delta:Number):void;
	}
	
}