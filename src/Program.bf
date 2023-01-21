namespace _104d1;
using System;
using System.Threading;
class Program
{
	public static void Main()
	{
		var t = new Loading();
		t.DoTimeLeft = true;
		t.DoTasksLeft = true;
		t.DoTaskName = true;
		t.ProjectedFinish = DateTime.Now.AddMinutes(3);
		for(int i = 0; i < 101; i++)
		{
			Console.Clear();
			t.FillPercent = i;
			t.SpinnerState++;
		
			Console.WriteLine(Generator.GenerateString(.. scope .(), t));

			if(t.SpinnerState == uint8.MaxValue)
				t.SpinnerState = 1;
			Thread.Sleep(100);
		}
		delete t;
		Console.ReadLine(scope .());
	}
}