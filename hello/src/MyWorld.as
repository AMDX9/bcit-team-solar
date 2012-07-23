package 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author joseph
	 */
	public class MyWorld extends World
	{
		[Embed(source = 'assets/background/ground.png')] private const GROUND:Class;
		[Embed(source = 'assets/background/cloud2.png')] private const CLOUD2:Class;
		[Embed(source = 'assets/background/cloud1.png')] private const CLOUD1:Class;
		[Embed(source = 'assets/background/sky.png')] private const SKY:Class;
		private var cloud1:Cloud;
		private var cloud2:Cloud;
		private var sky:Entity;
		private var trees:TreeManager = new TreeManager();
		public static var lotion:Lotion = new Lotion();
		public static var movement:MovementManger = new MovementManger();
		private var player:MyBoy = new MyBoy();
		private var burn:energybar = new energybar();
		private var bottlemeter:bottlebar = new bottlebar();
		private var ground:ShiftableEntity;
		private var sun:Sun = new Sun();
		public function MyWorld()
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
			movement.add(trees);
			movement.add(lotion);
			add(sun);
			add(lotion);
			add(burn);
			add(bottlemeter);
			add(player);
			add(trees.getFirst());
		}
		
		override public function update():void {
			movement.update();
			if (trees.hasGenerated()) {
				add(trees.getLast());
			}
			cloud1.update();
			cloud2.update();
			sun.update();
			super.update();
		}
		
		override public function render():void {
			super.render();
			//movement.render();
		}
		
	}
	
}