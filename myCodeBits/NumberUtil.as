package myCodeBits
{
	public class NumberUtil
	{
		public static function roundTo(numToRound:Number, numDigits:int):Number
		{
			var roundedNumber:Number;
			var multiplier:int = Math.pow(10, numDigits);
			var multipliedNumber:Number = numToRound * multiplier;
			roundedNumber = Math.round(multipliedNumber);
			
			roundedNumber = roundedNumber / multiplier;
			
			return roundedNumber;
		}
	}
}