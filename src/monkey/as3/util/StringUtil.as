package monkey.as3.util {
	
	/**
	 * Populates some utility methods to work with strings.
	 * @author matix
	 */
	public class StringUtil {
		
		/**
		 * Adds prefixing zeros to a given integer number, turning it into a string.
		 * @param	number the number to append zeros to.
		 * @param	digitCount the resulting number of digits returned, including the appended zeros and the original number.
		 * @return a string of the number given and the zeros appended.
		 */
		public static function addPrefixZeros(number:uint, digitCount:int = 2):String {
			var str:String = number.toString();
			while(str.length < digitCount) {
				str = "0" + str;
			}
			return str;
		}
		
		/**
		 * Removes empty spaces at the start and end of a given string.
		 * @param	src the string form witch to remove trailing spaces.
		 * @return a string without the trailing spaces.
		 */
		public static function removeTrailingSpaces(src:String):String {
			var char:String = src.charAt(0);
			while (char == " ") {
				src  = src.substring(1, src.length - 1);
				char = src.charAt(0);
			}
			char = src.charAt(src.length - 1);
			while (char == " ") {
				src  = src.substring(0, src.length - 2);
				char = src.charAt(src.length - 1);
			}
			return src;
		}
		
		/**
		 * Removes every space in a given string.
		 * @param	src the string from witch to remove all spaces.
		 * @return a string without any space.
		 */
		public static function removeAllSpaces(src:String):String {
			return src.replace(" ", "");
		}
		
	}
	
}