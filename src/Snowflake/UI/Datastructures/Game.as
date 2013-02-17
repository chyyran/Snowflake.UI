package Snowflake.UI.Datastructures
{
	public class Game
	{
		public var gameName:String;
		public var console:Console;
		public var gameDescription:String;
		public var releaseYear:int;
		public var coverPath:String;
		public var romPath:String;
		public function Game(gameName:String, console:Console, gameDescription:String, releaseYear:int,coverPath:String,romPath:String)
		{
			this.gameName = gameName;
			this.console = console;
			this.gameDescription = gameDescription;
			this.releaseYear = releaseYear;
			this.coverPath = coverPath;
			this.romPath = romPath;
			
		}
	}
}