package Snowflake.UI.Datastructures
{
	public class Game
	{
		public var gameName:String;
		public var gameDescription:String;
		public var releaseYear:String;
		public var coverPath:String;
		public var romPath:String;
		public var publisherName:String;
		public var console:Console;
		public function Game(gameName:String,romPath:String,gameDescription:String="", releaseYear:String="Unknown",coverPath:String="",publisherName:String="Unknown",console:Console=null)
		{
			this.gameName = gameName;
			this.gameDescription = gameDescription;
			this.releaseYear = releaseYear;
			this.coverPath = coverPath;
			this.romPath = romPath;
			this.console = console;
			this.publisherName = publisherName;
		}
		
		public static function getConsoleByShortname(consoleArray:Array,shortName:String):Console{
			for each(var console:Console in consoleArray){
				if(console.shortName == shortName){
					return console;
				}else{
					continue;
				}
			}
			return null;
		}
	}
}