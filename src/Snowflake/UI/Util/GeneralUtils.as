package Snowflake.UI.Util
{
	public class GeneralUtils
	{
		import flash.filesystem.*;
		public function GeneralUtils()
		{
		}
		
		
		public static function getArrayLength(array:Array):int{
			//We start counting at -1 because Array is zero relative
			var count:int = -1;
			
			for each (var object:Object in array){
				count++
			}
			
			return count;
		}
		
		/**
		 * Appends "[Snowflake.UI.Skin]" to a string to log
		 * @param log String to log
		 */
		public static function skinLog(log:String):void{
			trace("[Snowflake.UI] " + log);
		}
		
		/**
		 * Loads string from file relative to UI start directory
		 * @param log String to log
		 */
		
		public static function loadFile(path:String):String
		{
			var dataStream:FileStream = new FileStream();
			var textfile:File = File.applicationDirectory.resolvePath(path);
			var content:String;
			dataStream.open(textfile,FileMode.READ);
			content = dataStream.readUTFBytes(dataStream.bytesAvailable);
			dataStream.close();
			return content;
		}

		
	}
}