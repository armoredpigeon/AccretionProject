package components {
	import flash.display.Shape;
	import flash.display.Graphics;
	
	public class Particle extends Shape {
		
		public function Particle() {
			createParticleShape();
		}
		
		private function createParticleShape():void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, 0x000000, 1.0, true);
			g.beginFill(0xFFFF00, 1.0);
			g.drawCircle(0, 0, 5);
			g.endFill();
		}
	}
}