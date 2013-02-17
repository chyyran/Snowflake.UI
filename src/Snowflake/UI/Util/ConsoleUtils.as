package Snowflake.UI.Util
{
	public class ConsoleUtils
	{
		import Snowflake.UI.Datastructures.Console;
		public function ConsoleUtils()
		{
		}
		
		/**
		 * Inserts a console to the consoleArray
		 * @param console Console to insert
		 */
		public static function insertConsole(console:Console,consoleArray:Array):void{
			consoleArray[console.indexPosition] = console;
			trace("Inserted "+console.consoleName+" ("+console.shortName+")"+" with path "+console.imagePath+" to index "+String(console.indexPosition));
		}

	}
	
}