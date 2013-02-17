
import Snowflake.UI.Datastructures.Console;
import Snowflake.UI.Datastructures.SnowflakeSettings;
import Snowflake.UI.Util.*;

import com.greensock.events.LoaderEvent;
import com.greensock.loading.*;
import com.greensock.loading.display.FlexContentDisplay;
import com.rational.serialization.json.JSON;

import flash.display.*;
import flash.events.*;
import flash.filesystem.*;
import flash.net.*;
import flash.ui.Keyboard;

import mx.events.EffectEvent;

import spark.components.Group;

[Bindable("fadeInDuration")]
private var fadeInDuration:Number = 500;
[Bindable("fadeOutDuration")]
private var fadeOutDuration:Number = 250;

public var skinName:String="Snowflake_Default";
private var jsonConsoles:String;
private var arrayLength:int;
public var selectedIndex:int = 0;
public var consoleArray:Array = new Array();
public var todayDate:Date = new Date();
public var dateCode:String = todayDate.month+"."+todayDate.date+"."+todayDate.fullYear+" "+todayDate.hours+":"+todayDate.minutes+":"+todayDate.seconds+"_"+todayDate.timezoneOffset;
private var inTransition:Boolean = false;





/**
 * Gets the zero-relative length of a given array
 * @param array Any array
 * @return The length of the array
 */


private function init(stage:Stage):void{
	
	GeneralUtils.skinLog("SnowflakeUI Loaded at "+ dateCode);
	GeneralUtils.skinLog("Skin name is "+skinName);
	stage.nativeWindow.maximize();
	GeneralUtils.skinLog("Display State = Maximized Window");
	
	//stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
	//GeneralUtils.skinLog("Display State = Fullscreen");
	
	stage.addChild(new FPSCounter(10,10,0x000000,false,0x000000));
	
	//load background
	//loadSWF(backgroundArea,"assets/snowflakebg.swf");
	
	GeneralUtils.skinLog("FPS Counter initialized");
	stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
	GeneralUtils.skinLog("Keyboard event listener hooked");
	//trace(loadJson());
	ConsoleUtils.insertConsole(new Console("assets/SNES.png","Super Nintendo Entertainment System","SNES",0),consoleArray);
	ConsoleUtils.insertConsole(new Console("assets/NES.png","Nintendo Entertainment System","NES",1),consoleArray);
	ConsoleUtils.insertConsole(new Console("assets/genesis.png","Sega Genesis","Genesis",2),consoleArray);
	ConsoleUtils.insertConsole(new Console("assets/MasterSystem.png","Sega Master System","SMS",3),consoleArray);
	ConsoleUtils.insertConsole(new Console("assets/n64.png","Nintendo 64","N64",4),consoleArray);
	arrayLength = consoleArray.length - 1
	GeneralUtils.skinLog("Inserted "+String(arrayLength+1)+" consoles");
	GeneralUtils.skinLog("Final ArrayLength is "+String(arrayLength));
	
	updateConsole();
}

protected function FadeBtn_clickHandler(event:MouseEvent):void
{
	
	fadeOut.play();
}

/**
 * Updates the console on the screen depending on selectedIndex
 */
private function updateConsole():void{
	
	
	if(selectedIndex>arrayLength){
		selectedIndex = 0;
		
	}
	if(selectedIndex<0){
		selectedIndex = arrayLength;
	}
	var rightIndex:int = selectedIndex + 1
	var leftIndex:int = selectedIndex - 1
	
	if(rightIndex>arrayLength){
		rightIndex=0;
	}
	if(leftIndex<0){
		leftIndex = arrayLength
	}
	
	GeneralUtils.skinLog("===================Console Switched===================");
	var currentConsole:Console = Console(consoleArray[selectedIndex]);
	var debugText:String="SelectedIndex= "+String(selectedIndex)+" ImagePath= "+currentConsole.imagePath+" ConsoleName= "+currentConsole.consoleName+" ShortName= "+currentConsole.shortName;
	GeneralUtils.skinLog(debugText);
	GeneralUtils.skinLog("RightIndex= "+String(rightIndex)+" RightConsole= "+Console(consoleArray[rightIndex]).consoleName);
	GeneralUtils.skinLog("LeftIndex= "+String(leftIndex)+" LeftConsole= "+Console(consoleArray[leftIndex]).consoleName);
	
	consoleLeft.text=Console(consoleArray[leftIndex]).shortName;
	consoleCenter.text=Console(consoleArray[selectedIndex]).shortName;
	consoleRight.text=Console(consoleArray[rightIndex]).shortName;
	label.text=debugText;
	image.source=Console(consoleArray[selectedIndex]).imagePath;
}

protected function fadeOut_effectEndHandler(event:EffectEvent):void
{
	
	updateConsole();
	fadeIn.play();
}

protected function fadeOut_effectStartHandler(event:EffectEvent):void
{
	
	inTransition = true;
}

protected function fadeIn_effectEndHandler(event:EffectEvent):void
{
	inTransition = false;
}

private function keyDown(event:KeyboardEvent):void
{
	if(!inTransition){
		if(event.keyCode == 37){
			selectedIndex--
				fadeOut.play();
		}
		if(event.keyCode == 39){
			selectedIndex++
				fadeOut.play();
		}
	}
	if( event.keyCode == Keyboard.ESCAPE )
	{
		event .preventDefault();
	}
}


private function loadSWF(displayArea:Group,path:String):void{
	var swfLoader:SWFLoader;
	LoaderMax.contentDisplayClass = FlexContentDisplay;
	LoaderMax.activate([SWFLoader]);
	var url:String = path;
	swfLoader = new SWFLoader(url,{x:50, y:50, container:displayArea, noCache:true });
	swfLoader.load(); 
}

