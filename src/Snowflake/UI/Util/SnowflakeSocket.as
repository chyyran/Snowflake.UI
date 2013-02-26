package Snowflake.UI.Util
{
	public class SnowflakeSocket
	{
		public function SnowflakeSocket()
		{
			
		}
		import flash.events.*;
		import flash.net.*;
		
		
		
		var socket:Socket = new Socket();
		
		public function socketListen():void
		{
			
			this.socket.addEventListener(Event.CONNECT, onConnect);
			this.socket.addEventListener(Event.CLOSE, onClose);
			this.socket.addEventListener(IOErrorEvent.IO_ERROR, onError);
			this.socket.addEventListener(ProgressEvent.SOCKET_DATA, onResponse);
			this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecError);
			
			this.socket.connect("localhost",6993);
			
			
			
		}
		
		function onConnect(e:Event):void {
			
			
			this.socket.writeUTFBytes("TestCommand");
			this.socket.writeUTFBytes("This is a second string");
		}
		
		function onClose(e:Event):void {
			// Security error is thrown if this line is excluded
			this.socket.close();
		}
		
		function onError(e:IOErrorEvent):void {
			trace("IO Error: "+e);
		}
		
		function onSecError(e:SecurityErrorEvent):void {
			trace("Security Error: "+e);
		}
		
		function onResponse(e:ProgressEvent):void {
			if (this.socket.bytesAvailable>0) {
				trace(this.socket.readUTFBytes(this.socket.bytesAvailable));
			}
			
		}
	}
}