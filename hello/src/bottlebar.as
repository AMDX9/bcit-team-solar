package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author joseph
	 */
	public class bottlebar extends Entity
	{
		[Embed(source = 'assets/entities/bottlebar.png')] private const PLAYER:Class;
		private var text:Text = new Text("x0", 50, 0, { size:50, color: 0x000000 } );
		private var amount:int = 0;
		public function bottlebar()
		{
			super(300, 10, new Image(PLAYER));
			layer = -9999999;
			addGraphic(text);
		}
		
		override public function update():void 
		{
			text.text = "x" + amount;
			super.update();
		}
		
		public function increment():void {
			++amount;
		}
	}
	
}