package monkey.as3.util {
	
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author MatiX @ sismogames
	 */
	public class IntrospectionUtil {
		
		public static function getObjectClass(obj:Object):Class {
			return getDefinitionByName(getQualifiedClassName(obj)) as Class;
		}
		
		public static function extendsClass(classOrObject:Object, extendedClassObjectOrString:Object):Boolean {
			var checkedClass:Class;
			
			if (classOrObject is Class) checkedClass = classOrObject as Class
			else checkedClass = getObjectClass(extendedClassObjectOrString);
			
			var extendedClassString:String;
			
			if (extendedClassObjectOrString is String) extendedClassString = extendedClassObjectOrString as String
			else extendedClassString = getQualifiedClassName(extendedClassObjectOrString);
			
			var extendsClass:Boolean = describeType(checkedClass).factory.extendsClass.(@type == extendedClassString).length() > 0;
			
			return extendsClass;
		}
		
		public static function implementsInterface(classOrObject:Object, implementedInterfaceObjectOrString:Object):Boolean {
			var checkedClass:Class;
			
			if (classOrObject is Class) checkedClass = classOrObject as Class
			else checkedClass = getObjectClass(classOrObject);
			
			var implementedInterfaceString:String;
			
			if (implementedInterfaceObjectOrString is String) implementedInterfaceString = implementedInterfaceObjectOrString as String
			else implementedInterfaceString = getQualifiedClassName(implementedInterfaceObjectOrString);
			
			var implementsInterface:Boolean = describeType(checkedClass).factory.implementsInterface.(@type == implementedInterfaceString).length() > 0;
			
			return implementsInterface;
		}
		
		public static function getConstants(c:Class):XMLList {
			return  describeType(c).constant
		}
		
	}
	
}