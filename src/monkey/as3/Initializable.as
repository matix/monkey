package monkey.as3 {
	/**
	 * Represents an object that needs to do some setup operations before being ready to interact with other objects.
	 */	
	public interface Initializable {
		/**
		 * Performs some setup operations before being ready to interact with other objects.
		 */
		function initialize():void
	}
}