namespace _104d1;
using System;
using _104d1.Components;
//Wrapper for the loading system that writes directly to the standart console
class ConsoleLoadingScreen
{
	private Loading _Loading = new Loading() ~ delete _;
	public _Settings Settings = _Settings.Default;


	///Draws the current state to the console
	public void Draw(uint16 x = 0, uint16 y = 0)
	{
		uint16[2] cPos = Console.GetConsoleCursorPosition();
		Console.SetConsoleCursorPosition(.(x,y));
		String toDraw = Generator.GenerateString(.. new .(),_Loading);
		Console.Write(toDraw);

		delete toDraw;
	}
}