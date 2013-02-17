package Snowflake.UI.Util
{
	public class GeneralUtils
	{
		import flash.filesystem.*;
		public function GeneralUtils()
		{
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