package Snowflake.UI.Util
{
	public class GeneralUtils
	{
		import com.greensock.events.LoaderEvent;
		import com.greensock.loading.*;
		import com.greensock.loading.display.FlexContentDisplay;
		
		import flash.filesystem.*;
		
		import spark.components.*;
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

		public static function loadSWF(displayArea:Group,path:String):void{
			var swfLoader:SWFLoader;
			LoaderMax.contentDisplayClass = FlexContentDisplay;
			LoaderMax.activate([SWFLoader]);
			var url:String = path;
			swfLoader = new SWFLoader(url,{x:0, y:0, container:displayArea, noCache:true });
			swfLoader.load(); 
		}
		
		public static function getDateString():String{
			var todayDate:Date = new Date();
			var dateCode:String = todayDate.month+"."+todayDate.date+"."+todayDate.fullYear+" "+todayDate.hours+":"+todayDate.minutes+":"+todayDate.seconds+" (UTC "+getUTCOffset(todayDate.timezoneOffset)+")";
			return dateCode;
		}
		
		private static function getUTCOffset(timezoneOffset:int):String{
			var utcOffset:int = timezoneOffset/60-2*timezoneOffset/60;
			var formattedOffset:String;
			if (utcOffset >=0){
				formattedOffset = "+"+utcOffset+":00";
			}else{
				formattedOffset = utcOffset+":00";
			}
			return formattedOffset
		}
		
	}

}