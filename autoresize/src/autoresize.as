package {

import flash.display.*;
import flash.text.*;
import flash.events.*;
/**
 *	autoresize Application. 
 *
 *	@langversion ActionScript 3.0
 *	@playerversion Flash 9.0
 *
 *	@author 柳 大介
 *	@since 24.09.2011
 */
public class autoresize extends Sprite {
	
	private var speed:int=10;
	private var _p:*;
	private var b:*;
	
	
	[Embed (source="button.png")]
	private var button:Class;
	
	[Embed (source="grid.png")]
	private var panel:Class;
	/**
	 *	@constructor
	 */
	public function autoresize()
	{
		super();
		
		
		_p=new FlexibleView();
		addChild(_p);
		
		var p:*=new panel();
		_p.addChild(p);
	
		b=new button();
		b.x=80;
		b.y=139;
		var o:DisplayObject=_p.addChild(b);
		
		
		_p.autoResizingMask(p, 
		FlexibleView.FlexibleViewAutoresizingFlexibleLeftMargin|
		FlexibleView.FlexibleViewAutoresizingFlexibleWidth|
		FlexibleView.FlexibleViewAutoresizingFlexibleRightMargin|
		FlexibleView.FlexibleViewAutoresizingFlexibleTopMargin|
		FlexibleView.FlexibleViewAutoresizingFlexibleHeight|
		FlexibleView.FlexibleViewAutoresizingFlexibleBottomMargin
		);
		
		_p.autoResizingMask(b, 
		FlexibleView.FlexibleViewAutoresizingFlexibleLeftMargin|
		//FlexibleView.FlexibleViewAutoresizingFlexibleWidth|
	//	FlexibleView.FlexibleViewAutoresizingFlexibleRightMargin|
		FlexibleView.FlexibleViewAutoresizingFlexibleTopMargin
	//	FlexibleView.FlexibleViewAutoresizingFlexibleHeight|
	//	FlexibleView.FlexibleViewAutoresizingFlexibleBottomMargin
		);
		
		
		b=new button();
	//	b.width=b.height=50;
		
		
		
		b.x=50;//(179-b.width)/2;
		b.y=(179-b.height)/2;
		
		_p.addChild(b);
		
		
//		_p.refreshMargin(b);
		_p.autoResizingMask(b, 
		//FlexibleView.FlexibleViewAutoresizingFlexibleLeftMargin|
	//	FlexibleView.FlexibleViewAutoresizingFlexibleWidth|
		//FlexibleView.FlexibleViewAutoresizingFlexibleRightMargin|
		FlexibleView.FlexibleViewAutoresizingFlexibleTopMargin|
		FlexibleView.FlexibleViewAutoresizingFlexibleHeight|
		FlexibleView.FlexibleViewAutoresizingFlexibleBottomMargin
		);
		
		this.addEventListener(Event.ENTER_FRAME,onTick);
	}

	private function onTick(e:Event):void
	{
		
		/*
		_p.width+=speed;
		//_p.height+=speed;
		
		
		if(_p.width>400||_p.width<179)
		{
			speed*=-1;
		}*/
		
		_p.width=this.mouseX;
		_p.height=this.mouseY;

		
	}
}

}
