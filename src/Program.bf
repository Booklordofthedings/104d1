namespace _104d1;
using System;
using System.Threading;
class Program
{
	public static void Main()
	{
		/*
|=====================-----|
		| | |
		| | |
		| | |

		|  /|
		| / |
		|/  |

		|   |
		|---|
		|   |

		|\\  |
		| \\ |
		|  \\|

		|=====================-----|
		|--Doing Testing-----------|
		|__________________________|

		Do Spinner //Wether the spinner should be displayed
		Do Tasks //Wether the task counter should be displayed
		Do Status //Wether the Task name should be displayed
		Do AutoProgress //The progress bar percentage will be set automatically
		String CurrentStatus
		uint32 CurrentTask
		uint32 MaxTask
		float ProgressBar
		Update();

		|=====>                                      | 20%|\ |
		| Name of the Task                    - 65350 left| \|
		*/
		var t = new LoadingCustom();
		t.FillPercentage = 9;
		t.TasksLeft = 10;
		t.CurrentTask = "Do something";
		var i = t._CreateLoadingString();
		Console.WriteLine(i);
		delete i;
		Console.ReadLine(scope .());
	}
}