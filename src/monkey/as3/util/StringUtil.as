package monkey.as3.util {
	
	/**
	 * ...
	 * @author MatiX @ sismogames
	 */
	public class StringUtil {
		
		public static function addPrefixZeros(number:uint, digitCount:int = 2):String {
			var str:String = number.toString();
			while(str.length < digitCount) {
				str = "0" + str;
			}
			return str;
		}
		
		public static function roundToNDecimals(number:Number, n:uint = 2):String {
			return number.toPrecision(n);
		}
		
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
		
		public static function removeAllSpaces(src:String):String {
			return src.replace(" ", "");
		}
		
	}
	
}