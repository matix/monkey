package monkey.as3.util
{
	/**
	 * Populates some utility methods to work with color values
	 * @author 
	 */
	public class ColorUtil
	{
		/**
		 * Splits a given color to its corresponding RGB values.
		 * @param	color the color identifying number.
		 * @return An object with 3 attributes r,g and b, each representing the splitted chanels of the given color.
		 */
		public static function splitRGB(color:uint):Object {
			var rgb:Object = new Object();
			rgb.r = color >> 16;
			rgb.g = color >> 8 & 0xFF;
			rgb.b = color & 0xFF;
			
			return rgb;
		}
		
		/**
		 * Returns the opposite of a given color.
		 * @param	color the identifiying number.
		 * @return the opposite of the given color.
		 */
		public static function invert(color:uint):uint {
			return 0xFFFFFF - color;
		}
		
	}

}