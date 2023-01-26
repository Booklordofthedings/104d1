namespace _104d1.Components;

struct _Settings{
	//What to actually display on the bar
	public bool DoPercent = false; //Display percentage as a number
	public bool DoNaming = false; //Display the name of the current task
	public bool DoSpinner = false; //Displays a spinner, to show activity
	public bool DoTimeLeft = false; //Displays how much till is likely left
	public bool DoTasksLeft = false; //Displays how many tasks in total are left
	//Automatic generation Options
	public bool DoAutomaticNaming = false; //Automatically calculates the name of the current task
	public bool DoAutomaticPercentage = false; //Automatically sets the percentage bar
	public bool DoAutomaticTiming = false; //Automatically sets the time left
	public bool DoAutomaticTasksLeft = false; //Automatically calculates the amount of tasks left

	//Returns some sensible options that might be needed
	public static _Settings Default
	{
		public get {
			_Settings toReturn = _Settings();
			toReturn.DoPercent = true;
			toReturn.DoNaming = true;
			toReturn.DoSpinner = true;

			return toReturn;
		}
		private set;
	}

	public static _Settings DefaultAutomatic
	{
		public get {
			_Settings toReturn = _Settings();
			toReturn.DoPercent = true;
			toReturn.DoNaming = true;
			toReturn.DoSpinner = true;

			toReturn.DoAutomaticPercentage = true;
			toReturn.DoAutomaticNaming = true;

			return toReturn;
		}
		private set;
	}

	public static _Settings AllTrue
	{
		public get {
			_Settings toReturn = _Settings();
			toReturn.DoPercent = true;
			toReturn.DoNaming = true;
			toReturn.DoSpinner = true;
			toReturn.DoTimeLeft = true;
			toReturn.DoTasksLeft = true;

			toReturn.DoAutomaticNaming = true;
			toReturn.DoAutomaticTasksLeft = true;
			toReturn.DoAutomaticPercentage = true;
			toReturn.DoAutomaticTiming = true;

			return toReturn;
		}
		private set;
	}
}