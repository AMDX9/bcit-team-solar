package
{
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Spritemap;
 
    public class Button extends Entity
    {
        protected var _map:Spritemap;
 
        public function Button(x:Number = 0, y:Number = 0)
        {
            super(x, y);
        }
 
        public function setSpritemap(asset:*, frameW:uint, frameH:uint):void
        {
            _map = new Spritemap(asset, frameW, frameH);
 
            _map.add("Up", [0]);
            _map.add("Over", [1]);
            _map.add("Down", [2]);
 
            graphic = _map;
 
            setHitbox(frameW, frameH);
        }
 
        override public function render():void
        {
            super.render();
        }
 
    }
 
}