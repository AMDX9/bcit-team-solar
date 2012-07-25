package  
{
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class MenuWorld extends CustomWorld
	{
		[Embed(source = 'assets/background/ground.png')] private const GROUND:Class;
		[Embed(source = 'assets/background/cloud2.png')] private const CLOUD2:Class;
		[Embed(source = 'assets/background/cloud1.png')] private const CLOUD1:Class;
		[Embed(source = 'assets/background/sky.png')] private const SKY:Class;
		private var cloud1:Cloud;
		private var cloud2:Cloud;
		private var sky:Entity;
		private var sun:Sun = new Sun();
		private var trees:TreeManager = new TreeManager();
		public function MenuWorld() 
		{
			sky = new Entity(0, 0, new Image(SKY));
			cloud1 = new Cloud(-125, 129, new Image(CLOUD1));
			cloud2 = new Cloud( -125, 129, new Image(CLOUD2));
			sky.layer = 0;
			cloud1.layer = -2;
			cloud2.layer = -3;
			add(sky);
			add(cloud1);
			add(cloud2);
			add(new ShiftableEntity(0, 258, new Image(GROUND),-254));
			add(sun);
			add(trees.getFirst());
			add(trees.getLast());
			add(new ShiftableEntity(0, 0, Image.createRect(FP.width, FP.height, 0xFFFFFF, 0.5),99999));
		}
		
		override public function update():void 
		{
			if (Input.check(Key.SPACE)) {
				done = true;
			}
			sun.setX(FP.width / 180 * FP.elapsed + sun.getX());
			super.update();
		}
	}

}