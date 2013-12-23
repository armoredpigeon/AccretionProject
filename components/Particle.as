package components {
	import flash.display.Shape;
	import flash.display.Graphics;
	
	public class Particle extends Shape {
		
/*//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*

						  constructor
		
*///////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*		
		
		public function Particle(radius:int, lifespan:int, pColor:uint, pAlpha:Number) {
			_age = 0;
			_lifespan = lifespan;
			_radius = radius;
			_color = pColor;
			_alpha = _validateAlpha(pAlpha);
			
			_xAcceleration = 0.0;
			_yAcceleration = 0.0;
			
			_xVelocity = 0.0;
			_yVelocity = 0.0;
			
			_xForcesList = new Vector.<Number>();
			_yForcesList = new Vector.<Number>();
			
			_netXForce = 0.0;
			_netYForce = 0.0;
			
			createParticleShape();
		}
		
/*//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*

						  private vars
		
*///////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
		
		private var _age:int;
		private var _lifespan:int;
		private var _radius:int;
		private var _color:uint;
		private var _alpha:Number;
		
		private var _xAcceleration:Number;
		private var _yAcceleration:Number;
		
		private var _xVelocity:Number;
		private var _yVelocity:Number;
		
		private var _xForcesList:Vector.<Number>;
		private var _yForcesList:Vector.<Number>;
		
		private var _netXForce:Number;
		private var _netYForce:Number;
		
/*//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*

						getters/setters
		
*///////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
		
		public function get color():uint {
			return _color;
		}
		public function set color(newColor:uint):void {
			_color = newColor;
		}
		
		public function get particleAlpha():Number {
			return _alpha;
		}
		public function set particleAlpha(newAlpha:Number):void {
			_alpha = _validateAlpha(newAlpha);
		}
		
		public function get xVelocity():Number {
			return _xVelocity;
		}
		public function get yVelocity():Number {
			return _yVelocity;
		}
		
		public function get xForcesList():Vector.<Number> {
			return _xForcesList;
		}
		public function set xForcesList(newXForceList:Vector.<Number>):void {
			_xForcesList = null;
			_xForcesList = newXForceList;
		}
		
		public function get yForcesList():Vector.<Number> {
			return _yForcesList;
		}
		public function set yForcesList(newYForceList:Vector.<Number>):void {
			_yForcesList = null;
			_yForcesList = newYForceList;
		}
		
/*//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*

						public functions
		
*///////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
		
		
		public function addXForce(newXForce:Number):void {
			_xForcesList.push(newXForce);
			_xAcceleration += newXForce;
		}
		
		public function addYForce(newYForce:Number):void {
			_yForcesList.push(newYForce);
			_yAcceleration += newYForce;
		}
		
		
/*//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*

						private functions
		
*///////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
		
		private function createParticleShape():void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, 0x000000, 1.0, true);
			g.beginFill(_color, 1.0);
			g.drawCircle(0, 0, 5);
			g.endFill();
		}
		
		private function _validateAlpha(newAlpha:Number):Number {
			var retAlpha:Number = newAlpha;
			
			if(retAlpha > 1.0) {
				retAlpha = 1.0;
			}
			else if(retAlpha < 0.0) {
				retAlpha = 0.0;
			}
			
			return retAlpha;
		}
	}
}