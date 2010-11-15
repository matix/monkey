package monkey.as3.util {
	import com.sismogames.framework.core.SSprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.geom.Rectangle;

	/**
	 * Provides a way to convert a given display object into a bitmap.
	 * @author matix
	 */
	public class SnapshotUtil {
		/**
		 * Converts a given display object into a static bitmsap image.
		 * @param	source the display object to rasterize.
		 * @return a static bitmap image taken from the display object.
		 */
		public static function takeSnapshot(source:DisplayObject):Bitmap {
			var bitmapData:BitmapData = new BitmapData(source.width, source.height, true);
			bitmapData.draw(source);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			return bitmap;
		}
		
	}

}

