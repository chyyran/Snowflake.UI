package Snowflake.UI.Util
{
	
	public class RomMenuUtils
	{
		import Snowflake.UI.Datastructures.*;
		
		import spark.components.*;
		import mx.collections.*;
		public function RomMenuUtils()
		{
		}
		
		public static function refreshRomMenu(index:int,listArray:ArrayCollection,gameCover:Image,descriptionBox:TextArea):void{
			trace(Game(listArray[index]).gameName);
			gameCover.source=Game(listArray[index]).coverPath;
			descriptionBox.text=Game(listArray[index]).gameDescription;
		}
		
	}
}