namespace _104d1.Components;
using System;
class Task
{
	public bool IsDone {get; set;} = false; //Wether the task has been done
	public uint16 TaskWeight {get; set;} = 1; //How much time/Calculations it takes compared to others
	public String TaskName {get; set;}; //Name of the task being odne
	public TimeSpan TimeTaken {get; set;} = TimeSpan(0,0,1); //How long the task will tkae

	public this()
	{
		TaskName = new String("Doing something");
	}

	public this(uint16 pWeight, String pName)
	{
		TaskWeight = pWeight;
		TaskName = new String(pName);
	}

	public this(uint16 pWeight, String pName, TimeSpan pTime)
	{
		TaskWeight = pWeight;
		TaskName = new String(pName);
		TimeTaken = pTime;
	}

	public ~this()
	{
		delete TaskName;
	}
}