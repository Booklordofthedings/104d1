namespace _104d1;
using System;
class Generator
{
	public static Result<void> GenerateString(String pIn, Loading pSettings)
	{
		if(pIn == null || pSettings == null) //Error checking
			return .Err;

		//String to attach to
		String S_LoadingBar = scope .(); //Temp string for the loading bar
		String S_LoadingPercent = scope .(); //How much percent the bar is loaded
		String S_TimeLeft = scope .(); //How much time is left
		String S_TasksLeft = scope .(); //How many tasks are left
		String S_TaskName = scope .(); //The name of the current task
		String S_Spinner = scope .(); //The spinner itself

		
		{ //First Row
			String toFill = scope .();
			int fillLenght = (.)Math.Round((float)MAX_BAR_SIZE / 100 * pSettings.FillPercent);
			for(int i = 0; i < fillLenght; i++) //Calculating and adding to the needed lenght
				toFill.Append('=');

			if(toFill.Length < MAX_BAR_SIZE) //If it isnt max size add the >
				toFill.Append('>');

			while(toFill.Length < MAX_BAR_SIZE)
				toFill.Append(' ');

			//Put the entire thing together
			S_LoadingBar.Append('|');
			S_LoadingBar.Append(toFill);
			S_LoadingBar.Append('|');
			S_LoadingBar.Append('\n');
		}

		if(pSettings.DoPercent) //Display the fill percentage
		{
			String toFill = scope .();

			pSettings.FillPercent.ToString(toFill);
			while(toFill.Length > MAX_BAR_SIZE - 1)
				toFill.TrimEnd();
			toFill.Append('%');
			while(toFill.Length < MAX_BAR_SIZE)
				toFill.Append(' ');
			//Combine everything
			S_LoadingPercent.Append('|');
			S_LoadingPercent.Append(toFill);
			S_LoadingPercent.Append('|');
			S_LoadingPercent.Append('\n');
		}

		if(pSettings.DoTimeLeft) //Display the projected time left
		{
			String toFill = scope .();
			TimeSpan t = pSettings.ProjectedFinish - DateTime.Now;
			t.ToString(toFill);

			while(toFill.Length > MAX_BAR_SIZE - " left".Length)
				toFill.TrimEnd();

			toFill.Append(" left");

			while(toFill.Length < MAX_BAR_SIZE)
				toFill.Append(' ');

			S_TimeLeft.Append('|');
			S_TimeLeft.Append(toFill);
			S_TimeLeft.Append('|');
			S_TimeLeft.Append('\n');
		}

		if(pSettings.DoTasksLeft) //Display how many tasks are left
		{
			String toFill = scope .();

			toFill.Append(pSettings.TasksLeft);
			while(toFill.Length > MAX_BAR_SIZE - " left".Length)
				toFill.TrimEnd();

			toFill.Append(" left");

			while(toFill.Length < MAX_BAR_SIZE)
				toFill.Append(' ');

			S_TimeLeft.Append('|');
			S_TimeLeft.Append(toFill);
			S_TimeLeft.Append('|');
			S_TimeLeft.Append('\n');
		}

		if(pSettings.DoTaskName)
		{
			String toFill = scope .();

			toFill.Append(pSettings.CurrentTaskName);
			while(toFill.Length > MAX_BAR_SIZE)
				toFill.TrimEnd();

			while(toFill.Length < MAX_BAR_SIZE)
				toFill.Append(' ');

			S_TimeLeft.Append('|');
			S_TimeLeft.Append(toFill);
			S_TimeLeft.Append('|');
			S_TimeLeft.Append('\n');
		}

		if(pSettings.DoSpinner)
		{
			String toFill = scope .();

			for(int i = 0; i < (pSettings.SpinnerState % MAX_BAR_SIZE) - 3; i++)
				toFill.Append(' ');
			toFill.Append("<->");

			while(toFill.Length < MAX_BAR_SIZE)
				toFill.Append(" ");


			S_TimeLeft.Append('|');
			S_TimeLeft.Append(toFill);
			S_TimeLeft.Append('|');
			S_TimeLeft.Append('\n');
		}

		//Adding all of the generated Strings to the string
		pIn.Append(S_LoadingBar);
		pIn.Append(S_LoadingPercent);
		pIn.Append(S_TimeLeft);
		pIn.Append(S_TasksLeft);
		pIn.Append(S_TaskName);
		pIn.Append(S_Spinner);

		return .Ok;
	}
}