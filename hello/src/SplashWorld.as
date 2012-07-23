{
	/**
	 * ... Main Menu
	 * @author rizwan
	 */
	import mx.core.ButtonAsset;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	public class SplashWorld extends World 
	{
		[Embed(source = 'assets/entities/PlayGameButton.png')] private const PLAYBUTTON:Class;
		
		[Embed(source = 'assets/background/fullcanvas.jpg')] private const BACKGROUND:Class;
		
		private var _playButton:Button;
		
		public function SplashWorld() 
		{
			addGraphic(new Image(BACKGROUND));
			
			_playButton = new Button(250, 395);
			
			_playButton.setSpritemap(PLAYBUTTON, 312, 75);
			
			add(_playButton);
			
		}
 
		public function destroy():void
		{
			removeAll();
			
			_playButton = null;
		}
		
	}

}
}