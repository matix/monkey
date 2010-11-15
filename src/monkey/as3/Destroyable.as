package monkey.as3 {
	/**
	 * Represents an object that needs to do some cleanup operations before being disposed by the garbage collector.
	 */	
	public interface Destroyable {
		/**
		 * Performs some clean up operations before being disposed by the gc.
		 */
		function dispose():void;
	}
}