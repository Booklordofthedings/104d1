namespace _104d1;
using System;
using System.Collections;
///The raw loading bar settings
class Loading
{
	public bool DoSpinner {get; set;} = true; //Spinnner to show activity
	public bool DoPercent {get; set;} = true; //Show Percentage aas number
	public bool DoTaskName {get; set;} = true; //Displays the name of the current task
	public bool DoTimeLeft {get; set;} = false; //Displays a time left counter
	public bool DoTasksLeft {get; set;} = false; //How many tasks still need to be done

	public bool DoAutomaticNaming {get; set;} = false; //Automatically outputs the taskname
	public bool DoAutomaticPercentage {get; set;} = false; //x Automatically calculates the percentage based on the weighted tasks
	public bool DoAutomaticTiming {get; set;} = false; //x Calculates the timing automatically
	public bool DoAutomaticTasksLeft {get; set;} = false; //x Calculates the tasks left automatically

	//How much the bar is filled in percent
	private float _FillPercent = 0;
	public float FillPercent {
		public get {
			if(!DoAutomaticPercentage)
				return _FillPercent; //The default set value
			//Calculate
			int weight = 0;
			int doneWeight = 0;
			for(Task t in _Tasks)
			{
				weight += t.TaskWeight;
				if(t.IsDone)
					doneWeight += t.TaskWeight;
			}
			return (float)weight / (float)doneWeight;
		}
		public set {
			_FillPercent = Math.Clamp(value, 0, 100);
		}
	};
	public uint8 SpinnerState {get; set;} = 0; //What state the spinner is in rn
	private String _CurrentTaskName = new String("Do something");
	public String CurrentTaskName {
		public get {
			if(!DoAutomaticNaming)
				return _CurrentTaskName;
			for(Task t in _Tasks)
				if(!t.IsDone)
					return t.TaskName;

			return "No Tasks left";
		}
		set {
			delete CurrentTaskName;
			CurrentTaskName = new String(value);
		}
	}//What the current task is called
	//in what time the loading will be finished
	private DateTime _ProjectedFinish;
	public TimeSpan ProjectedFinish {
		public get {
		 if(!DoAutomaticTiming)
				return _ProjectedFinish - DateTime.Now;

			TimeSpan left = TimeSpan(0);
			for(Task t in _Tasks)
				left += t.TimeTaken;

			return left;
		}
		set {
			_ProjectedFinish = DateTime.Now + value;
		}
	};//How long itl take to finishe
	//How many Tasks are left to be done
	private uint16 _TasksLeft = 0;
	public uint16 TasksLeft {
		get {
			if(!DoAutomaticTasksLeft)
				return _TasksLeft;

			uint16 left = 0;
			for(Task t in _Tasks)
				if(!t.IsDone)
					left++;

			return left;
		}
		set {
				_TasksLeft = value;
		}
	};

	private List<Task> _Tasks;

	public this()
	{
		_Tasks = new .();
	}

	public ~this()
	{
		DeleteContainerAndItems!(_Tasks);
		delete CurrentTaskName;
	}
}