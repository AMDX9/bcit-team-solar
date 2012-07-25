package 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author joseph
	 */
	public class Energybar extends Entity
	{
		private var value:Number = 0;
		private var content:Image;
		private var background:Image;
		private var maxBurn:int = 0;
		[Embed(source = 'assets/entities/energybarcontent.png')] private const CONTENT:Class;
		[Embed(source = 'assets/entities/energybarback.png')] private const BACKGROUND:Class;
		public function Energybar()
		{
			content = new Image(CONTENT);
			background = new Image(BACKGROUND);
			super(500, 20, content);
			addGraphic(background);
			layer = -999999;
		}
		
		public function setValue(newValue:Number):void {
			value = (newValue < 0)?0:newValue;
			if (value > maxBurn) {
				maxBurn = value;
			}
		}
		
		public function getValue():Number {
			return value;
		}
		
		override public function update():void {
			content.clipRect.width = value*2.79+13;
			content.clear();
			content.updateBuffer();
		}
		
		public function getMaxBurn():int {
			return maxBurn;
		}
	}
	
}