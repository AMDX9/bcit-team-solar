package  
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class ShiftableEntity extends Entity implements Shiftable
	{
		private var show:Boolean = true;
		private var offset:int;
		
		public function ShiftableEntity(x:Number, y:Number, graphic:Image, adjustment:int) 
		{
			super(x, y, graphic);
			offset = adjustment;
			setHitbox(graphic.width, graphic.height, x, y);
		}
		
		override public function update():void {
			layer = -(y + offset);
			if (x < -width || x > FP.width || y < -height || y > FP.height) {
				show = false;
			}else {
				show = true;
			}
			super.update();
		}
		
		override public function render():void {
			if(show){
				super.render();
			}
		}
		
		public function shown():Boolean {
			return show;
		}
		
		public function shift(amount:int):void {
			moveBy(amount, 0);
		}
	}

}