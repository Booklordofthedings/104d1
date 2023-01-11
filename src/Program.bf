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
		*/
		String[4] Counting = String[4]("""
			|=====================-----| | |
			|--Doing Testing-----------| | |
			|______________________5/10| | |
			""",

			"""
			|=====================-----|  /|
			|--Doing Testing-----------| / |
			|______________________5/10|/  |
			""",
			"""
			|=====================-----|   |
			|--Doing Testing-----------|---|
			|______________________5/10|   |
			""",
			"""
			|=====================-----|\\  |
			|--Doing Testing-----------| \\ |
			|______________________5/10|  \\|
			"""
			);
		int counter = 0;
		while(true)
		{
			Console.Clear();
			Console.WriteLine(Counting[counter]);
			counter++;
			if(counter == 4)
				counter = 0;
			Thread.Sleep(200);
		}
		Console.ReadLine(scope .());
	}
}