package myCodeBits
{
	//import particle;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	
	public class Ball extends particle
	{
		private var scaleIncrement:Number;
		private var currentScale:Number;
		
		private var xForceArray:Array;
		private var yForceArray:Array;
		
		private var totalXForce:Number;
		private var totalYForce:Number;
		
		public function Ball($position:Point, $vector:Point, $gravity:Number, $lifespan:int, $velocity:Point, $mass:Number)
		{
			super($position, $vector, $gravity, $lifespan, $velocity, $mass);
			
			this.x = position.x;
			this.y = position.y;
			
			scaleIncrement = 0.05;
			currentScale = $mass/3;
			Object(this).scaleX = Object(this).scaleY = currentScale;
			
			xForceArray = [];
			yForceArray = [];
			
			totalXForce = 0;
			totalYForce = 0;
		}
		
		public function setPosition(e:TimerEvent):void
		{
			currentScale += 0.05;
			Object(this).scaleX = Object(this).scaleY = currentScale;
			x = position.x;
			y = position.y;
		}
		
		public function clearForces():void
		{
			xForceArray = [];
			yForceArray = [];
		}
		
		public function addXForce(newForce:Number):void
		{
			xForceArray.push(newForce);
			//combineXForces();
		}
		
		public function addYForce(newForce:Number):void
		{
			yForceArray.push(newForce);
			//combineYForces();
		}
		
		private function combineXForces():void
		{
			totalXForce = 0;
			
			var i:int = 0;
			var len:int = xForceArray.length;
			for (i; i<len; i++)
			{
				if(xForceArray[i] is Number)
				{
					totalXForce += xForceArray[i] as Number;
				}
				else
				{
					trace("Error. Non-number found in xForceArray at item ", i, ": ", xForceArray[i]);
				}
			}
			totalXForce = NumberUtil.roundTo(totalXForce, 2);
		}
		
		private function combineYForces():void
		{
			totalYForce = 0;
			
			var i:int = 0;
			var len:int = yForceArray.length;
			for (i; i<len; i++)
			{
				if(yForceArray[i] is Number)
				{
					totalYForce += yForceArray[i] as Number;
				}
				else
				{
					trace("Error. Non-number found in yForceArray at item ", i, ": ", yForceArray[i]);
				}
			}
			totalYForce = NumberUtil.roundTo(totalYForce, 2);
		}
		
		public function get xForce():Number
		{
			return totalXForce;
		}
		
		public function get yForce():Number
		{
			return totalYForce;
		}
	}
}
