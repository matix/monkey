package monkey.as3.util {
	
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	
	/**
	 * Populates some utility methods to work with instrospection of the as3 language and object oriented paradigm.
	 * @author matix
	 */
	public class IntrospectionUtil {
		
		/**
		 * Returns the class object of a given instance.
		 * @param	obj the object from witch to get its class.
		 * @return a class object of the given object.
		 */
		public static function getObjectClass(obj:Object):Class {
			return getDefinitionByName(getQualifiedClassName(obj)) as Class;
		}
		
		/**
		 * Checks in runtime an inheritance relation between two objects.
		 * @param	extended an object or class to check if extends from antoher class
		 * @param	extendee a class or object to check if has been extended by another class
		 * @return true if extended extends from extendee, false otherwise.
		 */
		public static function extendsClass(extended:Object, extendee:Object):Boolean {
			var checkedClass:Class;
			
			if (extended is Class) checkedClass = extended as Class
			else checkedClass = getObjectClass(extendee);
			
			var extendedClassString:String;
			
			if (extendee is String) extendedClassString = extendee as String
			else extendedClassString = getQualifiedClassName(extendee);
			
			var extendsClass:Boolean = describeType(checkedClass).factory.extendsClass.(@type == extendedClassString).length() > 0;
			
			return extendsClass;
		}
		
		/**
		 * Checks in runtime if a given object o class implements an interface.
		 * @param	implementor the object or class to check if implements an interface.
		 * @param	implementee the class or string representing the interface to check if is implemented by the given object.
		 * @return true if implementor implements implementee, false otherwise.
		 */
		public static function implementsInterface(implementor:Object, implementee:Object):Boolean {
			var checkedClass:Class;
			
			if (implementor is Class) checkedClass = implementor as Class
			else checkedClass = getObjectClass(implementor);
			
			var implementedInterfaceString:String;
			
			if (implementee is String) implementedInterfaceString = implementee as String
			else implementedInterfaceString = getQualifiedClassName(implementee);
			
			var implementsInterface:Boolean = describeType(checkedClass).factory.implementsInterface.(@type == implementedInterfaceString).length() > 0;
			
			return implementsInterface;
		}
		
		/**
		 * Returns a xml list of all the constants present in a class.
		 * @param	c the class from where to inspect the constants.
		 * @return a xml list of the constants present in the given class.
		 */
		public static function getConstants(c:Class):XMLList {
			return  describeType(c).constant
		}
		
	}
	
}