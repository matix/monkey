package monkey.as3.util
{
	/**
	 * ...
	 * @author 
	 */
	public class ColorUtil
	{
		
		public static function splitRGB(color:uint):Object {
			var rgb:Object = new Object();
			rgb.r = color >> 16;
			rgb.g = color >> 8 & 0xFF;
			rgb.b = color & 0xFF;
			
			return rgb;
		}
		
		public static function invert(color:uint):uint {
			return 0xFFFFFF - color;
		}
		
	}

}