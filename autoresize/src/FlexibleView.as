package
{	
	import flash.display.*;
	import flash.utils.*;
//	import com.demonsters.debugger.MonsterDebugger;
	
	public class FlexibleView extends Sprite
	{
		static public const FlexibleViewAutoresizingNone:int=0x0;
		static public const FlexibleViewAutoresizingFlexibleLeftMargin:int=0x1;
		static public const FlexibleViewAutoresizingFlexibleRightMargin:int=0x2;
		static public const FlexibleViewAutoresizingFlexibleWidth:int=0x4;
		static public const FlexibleViewAutoresizingFlexibleTopMargin:int=0x8;
		static public const FlexibleViewAutoresizingFlexibleBottomMargin:int=0x10;
		static public const FlexibleViewAutoresizingFlexibleHeight:int=0x20;
		
		
		private var _list:Vector.<DisplayObject>;
		private var _margin:Dictionary;
		private var _mask:Dictionary;

		public function FlexibleView()
		{
			super();
			_list=new Vector.<DisplayObject>();
			_margin=new Dictionary();
			_mask=new Dictionary();
			
		//	MonsterDebugger.initialize(this);
		}
		
		override public function set width(value:Number):void
		{
			super.width = value;
			_resize();
			
		}
		
		override public function set height(value:Number):void
		{
			super.height = value;
			_resize();
		}
		
		override public function addChild(t:DisplayObject):DisplayObject
		{
			var o:DisplayObject=super.addChild(t);
			_list[_list.length]=o;
			_margin[o]={left:t.x, right:super.width-t.width-t.x, top:t.y, bottom:super.height-t.height-t.y};
			autoResizingMask(o, FlexibleViewAutoresizingNone);
			return o;
			
		}
		
		override public function addChildAt(t:DisplayObject, index:int):DisplayObject
		{
			var o:DisplayObject=super.addChildAt(t, index);
			_list[_list.length]=o;
			_margin[o]={left:t.x, right:super.width-t.width-t.x, top:t.y, bottom:super.height-t.height-t.y};
			autoResizingMask(o, FlexibleViewAutoresizingNone);
			return o;
			
		}
		
		override public function removeChild(t:DisplayObject):DisplayObject
		{
			var o:DisplayObject=super.removeChild(t);
			_margin[o]=null;
			_mask[o]=null;
			return o;
			
		}
		
		public function refreshMargin(t:DisplayObject):void
		{
			if(!_margin[t])
			{
				return;
			}
			_margin[t]={left:t.x, right:super.width-t.width-t.x, top:t.y, bottom:super.height-t.height-t.y};
		}
		
		public function autoResizingMask(o:DisplayObject, mask:int):Boolean
		{

			if(o)
			{
				_mask[o]=mask;
				return true;
			}
			return false;
		}
		
		private function _resize():void
		{
			var len:uint=_list.length;
			for (var i:int = 0; i < len; i++)
			{
				var o:DisplayObject=_list[i];
				if(o)
				{
					var mask:int=_mask[o];
				}


				
				__resizeWithMask(
				o,
				Boolean(mask & FlexibleViewAutoresizingFlexibleLeftMargin), 
				Boolean(mask & FlexibleViewAutoresizingFlexibleRightMargin), 
				Boolean(mask & FlexibleViewAutoresizingFlexibleWidth),
				Boolean(mask & FlexibleViewAutoresizingFlexibleTopMargin),
				Boolean(mask & FlexibleViewAutoresizingFlexibleBottomMargin),
				Boolean(mask & FlexibleViewAutoresizingFlexibleHeight)
				);
				
			}
			
			
		}
		
		private function __resizeWithMask(
			
			b:DisplayObject,
			autoresizingFlexibleLeftMargin:Boolean,
			autoresizingFlexibleRightMargin:Boolean,
			autoresizingFlexibleWidth:Boolean,
			autoresizingFlexibleTopMargin:Boolean,
			autoresizingFlexibleBottomMargin:Boolean,
			autoresizingFlexibleHeight:Boolean
			
			
		):void
		{
		
			
			var _p:FlexibleView=this;
			
			var tm:Number=_margin[b].top;
			var bm:Number=_margin[b].bottom;
			var lm:Number=_margin[b].left;
			var rm:Number=_margin[b].right;
			var t:Number;
			var t1:Number;
			
			t=this.width*1/this.scaleX;
			t1=this.height*1/this.scaleY;

			
			if(!autoresizingFlexibleWidth)b.scaleX=1/_p.scaleX;
			if(!autoresizingFlexibleHeight)b.scaleY=1/_p.scaleY;

			if(!autoresizingFlexibleRightMargin)
			{
				if(autoresizingFlexibleWidth)
				{
				var r:Number=t/b.width;

					if(!autoresizingFlexibleLeftMargin)
					{

						b.width=b.width*r-(lm+rm)/_p.scaleX;
					}
					else
					{


						b.width=(t-lm)-rm/_p.scaleX;
					}

				}


			}


			if(!autoresizingFlexibleBottomMargin)
			{
				if(autoresizingFlexibleHeight)
				{
					var 	r1:Number=t1/b.height;

					if(!autoresizingFlexibleTopMargin)
					{

						b.height=b.height*r1-(tm+bm)/_p.scaleY;
					}
					else
					{


						b.height=(t1-tm)-bm/_p.scaleY;
					}

				}


			}



			if(!autoresizingFlexibleLeftMargin)
			{
				
					b.x=lm/_p.scaleX;
				
				
			}
			else
			{
				if(!autoresizingFlexibleRightMargin)
				{

					b.x=t-b.width-rm/_p.scaleX;

				}
				else
				{
					var a:Number=lm/_p.scaleX;
					var bb:Number;
					if(autoresizingFlexibleWidth)
					{
						bb=b.width/_p.scaleX;
					}
					else
					{
						bb=b.width;
					}
					var c:Number=rm/_p.scaleX;
					var n:Number=this.width/t;
					var m:Number=(n*(a+bb+c)-b.width)/(a+c);
					
					b.x=a*m;
					
				}

			}




			if(!autoresizingFlexibleTopMargin)
			{
				
					b.y=tm/_p.scaleY;
				
				
			}
			else
			{
				if(!autoresizingFlexibleBottomMargin)
				{

					b.y=t1-b.height-bm/_p.scaleY;

				}
				else
				{
					var ay:Number=tm/_p.scaleY;
					var bby:Number;
					
					if(autoresizingFlexibleHeight)
					{
						bby=b.height/_p.scaleY;
					}
					else
					{
						bby=b.height;
					}
					
					
					var cy:Number=bm/_p.scaleY;
					var ny:Number=this.height/t1;
					var my:Number=(ny*(ay+bby+cy)-b.height)/(ay+cy);
					
					b.y=ay*my;
				}

			}

		}
		
		

	}
}