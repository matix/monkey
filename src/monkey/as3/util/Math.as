package monkey.as3.util
{
	/**
	 * Populates some methods to ease working with numbers and mathematical operations.
	 * @author matix
	 */
	public class Math
	{
		/**
		 * Rounds a number to a certain presition.
		 * @param	number the number to round.
		 * @param	presition the number of digits after de decimal separator wanted as presition.
		 * @return  rounded number to the given presition.
		 */
		public static function round(number:Number, presition:uint = 2):Number {
			return parseFloat(number.toFixed(presition));
		}
		
		/**
		 * Generates a random number.
		 * @param	from a starting number representing the minor number to expect.
		 * @param	to a top number representing the major number to expect.
		 * @param	presition the number of digits after de decimal separator wanted as presition.
		 * @return  a random number between the limits given and with the desried presition.
		 */
		public static function random(from:Number, to:Number,presition:uint=2):Number {
			var dx:Number = to - from;
			var result:Number = from + Math.random() * dx;
			result = round(result, presition);
			return result;
		}
		
	}

}