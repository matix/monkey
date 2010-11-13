package monkey.as3.util {
	import com.sismogames.framework.core.SSprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.geom.Rectangle;

	/**
	 * ...
	 * @author MatiX @ sismogames
	 */
	public class SnapshotUtil {
		
		public static function takeSnapshot(source:DisplayObject):Bitmap {
			var bitmapData:BitmapData = new BitmapData(source.width, source.height, true);
			bitmapData.draw(source);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			return bitmap;
		}
		
	}

}

