namespace _104d1;
using System;
class Task
{
	public bool IsDone {get; set;} = false; //Wether the task has been done
	public uint16 TaskWeight {get; set;} = 1; //How much time/Calculations it takes compared to others
	public String TaskName {get; set;}; //Name of the task being odne
	public TimeSpan TimeTaken {get; set;} //How long the task will tkae
}