package  {
	
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	import components.Particle;
	import flash.display.Sprite;
	
	
	public class Accretion extends Sprite {
		
		
		private var _loadParticlesBtn:Sprite;
		private var _particleVector:Vector.<Particle> = new Vector.<Particle>;
		
		public function Accretion() {
			// This is where the code will begin. :p
			
			//ok, first we need code to make the buttons appear. YAY!
			//then, we need code to make the particles appear. They can be code files whose instances create a graphical object
			//we'll need to have the particle system controlling the locations and managing pull between particles
			createParticlesBtn();
			_loadParticlesBtn.addEventListener(MouseEvent.CLICK, handler_loadParticlesBtn_click);
		}
		
		private function createParticlesBtn():void {
			_loadParticlesBtn = new Sprite();
			var g:Graphics = _loadParticlesBtn.graphics;
			
			g.beginFill(0x00FF00, 1.0);
			g.drawRect(0, 0, 30, 30);
			g.endFill();
			_loadParticlesBtn.x = 840;
			_loadParticlesBtn.y = 530;
			this.addChild(_loadParticlesBtn);
		}
		
		private function handler_loadParticlesBtn_click(event:MouseEvent):void {
			//create several (100) particles.
			/*var temp:int = _particleVector.length;
			_particleVector[temp] = new Particle();
			_particleVector[temp].x = 45;
			_particleVector[temp].y = 45;
			this.addChild(_particleVector[temp]);*/
			generateParticles(100);
		}
		
		private function generateParticles(count:int):void {
			var i:int = 0;
			for (i; i<count; i++) {
				_particleVector[i] = new Particle();
				_particleVector[i].x = Math.random() * stage.width;
				_particleVector[i].y = Math.random() * stage.height;
				this.addChild(_particleVector[i]);
			}
		}
	}
	
}
