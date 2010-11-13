package monkey.as3.util {
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author MatiX @ sismogames
	 */
	public class GeomUtil {
		
		public static function getRectangleCenter(rectangle:Rectangle):Point {
			return new Point(rectangle.x + rectangle.width / 2, rectangle.y + rectangle.height / 2);
		}
		
		public static function getPosition(displayobj:DisplayObject, global:Boolean = true):Point {
			var p:Point =  new Point(displayobj.x, displayobj.y);
			if (global && displayobj.parent) {
				p = displayobj.parent.localToGlobal(p);
			}
			
			return p;
		}
		
		public static function getRotation360(rotation:Number):Number {
			return (rotation>= 0)? rotation: 360 + rotation;
		}
		
	}
	
}