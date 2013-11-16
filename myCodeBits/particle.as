﻿package myCodeBits
{
	
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	import flash.geom.Point;
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class particle extends MovieClip
	{
		
		protected var position:Point;
		protected var vector:Point;
		
		private var gravity:Number;
		private var velocity:Point;
		private var lifespan:int;
		private var ageCounter:int;
		
		private var _mass:Number;
		private var dragX:Number;
		private var dragY:Number;
		
		private var checker:Boolean;
		
		protected var update_i:Timer;
		
		private var opacityStep:Number;
		
		public function particle($position:Point, $vector:Point, $gravity:Number, $lifespan:int, $velocity:Point, $mass:Number)
		{
			position = $position;
			
			vector = $vector;
			
			gravity = $gravity;
			
			velocity = $velocity;
			
			lifespan = $lifespan;
			
			_mass = $mass;
			
			ageCounter = 0;
			
			opacityStep = 1/(lifespan*0.75);
			
			//update_i = new Timer(25);
			
			//update_i.addEventListener(TimerEvent.TIMER, update, false, 0, true);
			//update_i.start();
		}
		
		/*
		TODO:
			change this so that it doesn't happen within the particle code
		*/
		
		public function update(e:TimerEvent):void
		{
			ageCounter += 1;
			checkLifespan();
			if(checker)
			{
				velocity.y += (_mass * gravity);
				Object(this).alpha = Object(this).alpha - opacityStep;
				position.x += vector.x;
				position.y += vector.y;
			
				//vector.y += gravity;
				//vector.x += friction;
				vector.x += velocity.x;
				vector.y += velocity.y;
			}else{
				update_i.stop();
				update_i.removeEventListener(TimerEvent.TIMER, update);
				Object(this).visible = false;
				//Object(this).content = null;
			}
			
		}
		
		public function checkLifespan():void
		{
			if(lifespan == -1 || ageCounter <= lifespan)
			{
				checker = true;
			}
			else //if(ageCounter > lifespan)
			{
				checker = false;
			}
			
		}
		
		public function get mass():Number
		{
			return _mass;
		}
	}
	

}