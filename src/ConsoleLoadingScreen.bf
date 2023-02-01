namespace _104d1;
using System;
using _104d1.Components;
//Wrapper for the loading system that writes directly to the standard console
class ConsoleLoadingScreen
{
	private Loading _Loading = new Loading() ~ delete _;
	public _Settings Settings = _Settings.Default;
	public bool DrawOnUpdate = false; //Forces a redraw on every update call

	///Work has been done
	public void Update(uint16 x = 0, uint16 y = 0)
	{
		_Loading.Update();
		if(DrawOnUpdate)
			Draw(x,y);
	}

	public void AddTask(Task pTask)
	{
		_Loading.AddTask(pTask);
	}

	public bool FinishTask()
	{
		return _Loading.Finished();
	}

	public float FillPercent {get {return _Loading.FillPercent;} set {_Loading.FillPercent = value;} }
	public String CurrentTaskName {get {return _Loading.CurrentTaskName;} set {_Loading.CurrentTaskName = value;} }
	public TimeSpan ProjectedFinish {get {return _Loading.ProjectedFinish;} set {_Loading.ProjectedFinish = value;} }
	public uitn16 TasksLeft {get {return _Loading.TasksLeft;} set {_Loading.TasksLeft = value;} }


	///Draws the current state to the console
	public void Draw(uint16 x = 0, uint16 y = 0)
	{
		ApplySettings();

		//Store current cursor positions
		var xPos = Console.CursorLeft;
		var yPos = Console.CursorTop;
		//Set the cursor to the point where it should draw
		Console.CursorLeft  = x;
		Console.CursorTop = y;

		//Generate the string and draw it
		String toDraw = Generator.GenerateString(.. new .(),_Loading);
		Console.Write(toDraw);

		//Reset their positioning
		Console.CursorLeft = xPos;
		Console.CursorTop = yPos;

		delete toDraw; //Cleanup
	}

	///Applys any changed settings, is called automatically every draw
	public void ApplySettings()
	{
		//Set every value to false
		_Loading.DoTaskName = false;
		_Loading.DoSpinner = false;
		_Loading.DoPercent = false;
		_Loading.DoTimeLeft = false;
		_Loading.DoTasksLeft = false;
		_Loading.DoAutomaticNaming = false;
		_Loading.DoAutomaticPercentage = false;
		_Loading.DoAutomaticTiming = false;
		_Loading.DoAutomaticTasksLeft = false;

		//Enable all settings that are on
		if(Settings.DoNaming)
			_Loading.DoTaskName = true;
		if(Settings.DoPercent)
			_Loading.DoPercent = true;
		if(Settings.DoSpinner)
			_Loading.DoSpinner = true;
		if(Settings.DoTimeLeft)
			_Loading.DoTimeLeft = true;
		if(Settings.DoTasksLeft)
			_Loading.DoTasksLeft = true;
		if(Settings.DoAutomaticNaming)
			_Loading.DoAutomaticNaming = true;
		if(Settings.DoAutomaticTiming)
			_Loading.DoAutomaticTiming = true;
		if(Settings.DoAutomaticTasksLeft)
			_Loading.DoAutomaticTasksLeft = true;
		if(Settings.DoAutomaticPercentage)
			_Loading.DoAutomaticPercentage = true;
	}
}