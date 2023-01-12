namespace _104d1;
using System;
///The raw loading bar settings
class Loading
{
	public bool DoSpinner {get; set;} = true; //Spinnner to show activity
	public bool DoPercent {get; set;} = true; //Show Percentage aas number
	public bool DoTaskName {get; set;} = true; //Displays the name of the current task
	public bool DoTimeLeft {get; set;} = false; //Displays a time left counter
	public bool DoTasksLeft {get; set;} = false; //How many tasks still need to be done

	public bool DoWeightedTasks {get; set;} = false; //Uses a list of weighted tasks to more accurately display percentage
	//Requires weighted tasks to work better
	public bool DoAutomaticPercentage {get; set;} = false; //Automatically calculates the percentage based on the weighted tasks
	public bool DoAutomaticTiming {get; set;} = false; //Calculates the timing automatically

	public float FillPercent {get; set;} = 0; //TODO: Clamp(0-100)
	public uint8 SpinnerState {get; set;} = 0; //What state the spinner is in rn
	public String CurrentTaskName {get; set;}; //What the current task is called
}