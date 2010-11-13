package com.sismogames.framework.utils {
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author MatiX @ sismogames
	 */
	public class HitTestUtil {
		
		public function HitTestUtil() {
			
		}
		
		public static function hitTest(obj1:DisplayObject, obj2:DisplayObject, useShapes:Boolean = true):Boolean {
			var rect1:Rectangle = obj1.getRect(obj1.stage);
			var rect2:Rectangle = obj2.getRect(obj2.stage);
				
			if (rect1.intersects(rect2)) {
				if (!useShapes) {
					return true;
				}
				
				var hitRect:Rectangle = rect1.intersection(rect2);
				var hitX:Number = hitRect.x;
				var hitY:Number = hitRect.y;
				var maxHitX:Number = hitRect.x + hitRect.width;
				var maxHitY:Number = hitRect.y + hitRect.height;
				while (hitY < maxHitY) {
					while (hitX < maxHitX) {
						if (obj1.hitTestPoint(hitX, hitY, true)) {
							if (obj2.hitTestPoint(hitX, hitY, true)) {
								return true;
							}
						}
						hitX++;
					}
					hitX = hitRect.x;
					hitY++;
				}
				return false
			}
			else {
				return false;
			}
		}
		
		public function radialHitTest(obj1:DisplayObject, obj2:DisplayObject, radius:Object = null):Boolean {
			var p1:Point = obj1.parent.localToGlobal(new Point(obj1.x, obj1.y));
			var p2:Point = obj2.parent.localToGlobal(new Point(obj2.x, obj2.y));
			var hitRadius:Number;
			if (!radius) hitRadius = obj1.width / 2 + obj2.width / 2;
			else hitRadius = Number(radius);
			
			return Point.distance(p1, p2) <= hitRadius;
		}
	}
	
}