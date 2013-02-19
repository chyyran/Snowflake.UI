package Snowflake.UI.Datastructures
{
	public class Console
	{
		public var imagePath:String;
		public var consoleName:String;
		public var indexPosition:int;
		public var shortName:String;
		public var gameList:Array;
		
		public function Console(imagePath:String,consoleName:String,shortName:String,indexPosition:int, gameList:Array = null){
			this.imagePath=imagePath;
			this.consoleName=consoleName;
			this.indexPosition=indexPosition;
			this.shortName = shortName;
			this.gameList = gameList;
			
		}
		}
	
	
	}

