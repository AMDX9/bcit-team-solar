package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author joseph
	 */
	public class Main extends Engine 
	{
		[Embed(source = 'assets/mysolar.mp3')] private const MUSIC:Class;
		private var music:Sfx = new Sfx(MUSIC);
		private var menu:CustomWorld;
		private var game:CustomWorld;
		public function Main()
		{
			super(800, 600, 60, false);
			FP.console.enable();
			
			FP.screen.color = 0xffffff;
			
			FP.console.toggleKey = Key.ENTER;
		}
		
		override public function init():void {
			menu = new MenuWorld;
			FP.world = menu;
			trace("FlashPunk has started successfully!");
			music.loop(0.5);
		}
		
		override public function update():void {
			if (menu !=null && menu.isDone()) {
				game = new MyWorld;
				FP.world = game;
				menu = null;
			}
			
			if (game != null && game.isDone()) {
				FP.world = new EndScreen();
			}
			super.update();
		}
		
	
		
	}
	
}