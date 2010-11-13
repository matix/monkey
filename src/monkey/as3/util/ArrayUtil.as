package monkey.as3.util
{
	import com.sismogames.framework.math.SMath;
	/**
	 * ...
	 * @author MatiX
	 */
	public class ArrayUtil
	{
		public static function clone(source:Array):Array {
			return source.slice();
		}
		
		public static function randomize(source:Array,factor:int=-1):Array
		{
			if (factor < 0) {
				factor = source.length;
			}
			var result:Array = clone(source);
			for (var i:int = 0; i < factor; i++) 
			{
				var popped:* = result.pop();
				var to:int = SMath.random(0, result.length, 0);
				result.splice(to, 0, popped);
			}
			return result;
		}
	}

}