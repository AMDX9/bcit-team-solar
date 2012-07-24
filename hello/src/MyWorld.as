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
		private var burn:Energybar = new Energybar();
		private var bottlemeter:bottlebar = new bottlebar();
		private var ground:ShiftableEntity;
		private var sun:Sun = new Sun();
		private var done:Boolean = false;
		private var amountOfBottles:int = 0;
		private var lost:Boolean = false;
		public function MyWorld()
		{
			sky = new Entity(0, 0, new Image(SKY));
			cloud1 = new Cloud(-125, 129, new Image(CLOUD1));
			cloud2 = new Cloud( -125, 129, new Image(CLOUD2));
			movement.add(trees);
			movement.add(lotion);
			sky.layer = 0;
			cloud1.layer = -2;
			cloud2.layer = -3;
			add(sky);
			add(cloud1);
			add(cloud2);
			add(new ShiftableEntity(0, 258, new Image(GROUND),-254));
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
			gameLogic();
			super.update();
		}
		
		private function gameLogic():void {
			if (burn.getValue() == 100) {
				lost = true;
				done = true;
				return;
			}
			
			if (sun.getX() == FP.width) {
				done = true;
				return;
			}
			var bottle:Lotion = player.collideWith(lotion, player.x, player.y) as Lotion;
			sun.setX(FP.width / 180 * FP.elapsed + sun.getX());
			if (bottle) {
				bottle.movefar();
				burn.setValue(burn.getValue() - 10);
				bottlemeter.increment();
			}
			burn.setValue(burn.getValue() + (5 * FP.elapsed));
		}
		
		public function isDone():Boolean {
			return done;
		}
		
		public function hasLost():Boolean {
			return lost;
		}
	}
	
}