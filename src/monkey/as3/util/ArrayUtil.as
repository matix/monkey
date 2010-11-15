package monkey.as3.util
{
	import monkey.as3.util.Math;
	
	/**
	 * Populates some utility methods to work with arrays, such as cloning and randomizing.
	 * @author matix
	 */
	public class ArrayUtil
	{
		/**
		 * Clones an array and returns an copy with the same object references in each position.
		 * @param	source the source array to clone
		 * @return  a copy of the source array.
		 */
		public static function clone(source:Array):Array {
			return source.slice();
		}
		
		/**
		 * Mixes the contents of an array putting its contained objects in random postions. Returns a new array. Keeps the length of the array.
		 * @param	source the array to randomize
		 * @param	factor the number of objects to be moved in the array, if the value is -1 it will take the array's length minus the value as factor.
		 * @return  a new array with the contents of the source array randomized.
		 */
		public static function randomize(source:Array,factor:int=-1):Array
		{
			if (factor < 0) {
				factor = source.length + factor + 1;
			}
			var result:Array = clone(source);
			for (var i:int = 0; i < factor; i++) 
			{
				var popped:* = result.pop();
				var to:int = Math.random(0, result.length, 0);
				result.splice(to, 0, popped);
			}
			return result;
		}
	}

}