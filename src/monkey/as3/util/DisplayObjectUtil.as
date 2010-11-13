package monkey.as3.util {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * Utility Class: provides several methods to ease the manipulation of Display Objects and Display Object Containers
	 * @author MatiX
	 */
	public class DisplayObjectUtil {

        /**
         * Gets a child from the display list of a given <code>target</code> display object container, by specifying the
         * exact location of the child with a path of the form: <code>path/to/child</code> where each entry of the path
         * is the instance name of a target's descendants.
         * @param target the target display object container where the child should be looked for.
         * @param path the path to the wanted child, with the form <code>path/to/file</code>
         * @return a DisplayObject found in the given path, or <code>null</code> if none was found.
         */
        public static function getChildByPath(target:DisplayObjectContainer ,path:String):DisplayObject {
			var childList:Array = path.split("/");
			var targetChild:DisplayObject = target;
			var childListLength:int = childList.length;
			var childName:String = "";
			for (var i:int = 0; i < childListLength; i++ ) {
				if (targetChild) {
					if (targetChild is DisplayObjectContainer) {
						childName = childList[i];
						targetChild = (targetChild as DisplayObjectContainer).getChildByName(childName);
					}
					else if (i < childListLength - 1) {
						targetChild = null;
						break;
					}
				}
				else {
					break;
				}
			}
			return targetChild;
		}
		
		public static function getDescendantsByName(target:DisplayObjectContainer, name:String):Array {
			getDescendantsByName_results = [];
            var results:Array = getDescendantsByName_proxy(target, name);
			getDescendantsByName_results = null;
			return results;
		}
		
		private static var getDescendantsByName_results:Array
		
		private static function getDescendantsByName_proxy(target:DisplayObjectContainer, name:String):Array {
			if (!getDescendantsByName_results) getDescendantsByName_results = new Array();
			var child:DisplayObject;
            for (var i:int = 0; i < target.numChildren; i++)
			{
				child = target.getChildAt(i);
				if (child.name == name) getDescendantsByName_results.push(child);
				if (child is DisplayObjectContainer) getDescendantsByName_results.concat(getDescendantsByName_proxy(child as DisplayObjectContainer, name));
			}
			return getDescendantsByName_results;
		}
		
		public static function bringToFront(target:DisplayObject):void {
			if (!target && !target.parent) return
			target.parent.addChild(target);
			//target.parent.swapChildren(target, target.parent.getChildAt(target.parent.numChildren - 1));
		}
		
		public static function sendToBack(target:DisplayObject):void {
			if (!target && !target.parent) return
			target.parent.addChildAt(target, 0);
		}

	}
	
}