namespace _104d1;
using System;
class LoadingCustom
{
	//Data
	public float FillPercentage;
	public String CurrentTask;
	public uint16 TasksLeft;
	private uint8 _SpinnerState = 0;
	//Toggles
	public bool DoSpinner;
	public bool DoTasks = true;
	public bool DoStatus = true;

	///Generate the loading string, this needs to be managed by the reciever
	public String _CreateLoadingString()
	{
		String toReturn = new .();
		toReturn.Append('|'); //Starting bar
		float percent = Math.Clamp(FillPercentage, 0, 100);
		int maxBarLenght = 40; //How long the loading bar may be at a max
		double barCharge = (maxBarLenght / 100f) * percent; //How long the loading bar is

		for(int i = 0; i < (.)Math.Floor(barCharge); i++)
			toReturn.Append('='); //Create the bars

		if(toReturn.Length - 1 != maxBarLenght)
			toReturn[toReturn.Length-1] = '>'; //Add the last > if the value isnt the max one

		while(toReturn.Length < 1 + maxBarLenght)
				toReturn.Append(' ');

		toReturn.Append('|');

		String sPercent = Math.Floor(percent).ToString(.. scope .());
		if(sPercent.Length == 2)
			toReturn.Append(" ");
		else if(sPercent.Length == 1)
			toReturn.Append("  ");
		toReturn.Append(sPercent);
		toReturn.Append("%|");
		//TODO: Spinner
		if(DoTasks || DoStatus)
		{
			toReturn.Append('\n');
			toReturn.Append('|');

			if(DoStatus)
			{
				int maxTaskLenght = 25;
				toReturn.Append(' ');
				toReturn.Append(CurrentTask);
			}

			if(DoTasks)
			{
				String sTasksLeft = TasksLeft.ToString(.. scope .());
				sTasksLeft.Append(" Left|");
				toReturn.Append(sTasksLeft);
				while(toReturn.Length / 2 <	 maxBarLenght + 4 + 3)
					toReturn.Insert(toReturn.Length - sTasksLeft.Length,' ');

				toReturn.Insert(toReturn.Length - sTasksLeft.Length,' ');

			}
			


		}
		return toReturn;
	}
}