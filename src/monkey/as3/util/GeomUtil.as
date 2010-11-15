package monkey.as3.util {[
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * Populates some utlility methods to work with geometry operations.
	 * @author matix
	 */
	public class GeomUtil {
		
		/**
		 * Returns the center point of a given rectangle.
		 * @param	rectangle the rectangle from witch to get the center from.
		 * @return a point instance representing the center of the given rectangle.
		 */
		public static function getRectangleCenter(rectangle:Rectangle):Point {
			return new Point(rectangle.x + rectangle.width / 2, rectangle.y + rectangle.height / 2);
		}
		
		/**
		 * Returns the position of a given display object.
		 * @param	displayobj the display object from witch to get the position.
		 * @param	global a flag that determines whteher to get the coordinates relating to the display object's parent or relative to the global coordinate system.
		 * @return a point instance representing the position of the given display object.
		 */
		public static function getPosition(displayobj:DisplayObject, global:Boolean = true):Point {
			var p:Point =  new Point(displayobj.x, displayobj.y);
			if (global && displayobj.parent) {
				p = displayobj.parent.localToGlobal(p);
			}
			
			return p;
		}
		
		/**
		 * Traslates flash's angle values to a 360 degrees based value.
		 * @param	rotation the angle value in flash's [-180..180] scale.
		 * @return an angle in [0..360] scale.
		 */
		public static function getRotation360(rotation:Number):Number {
			return (rotation>= 0)? rotation: 360 + rotation;
		}
		
	}
	
}