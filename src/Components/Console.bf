namespace System;
extension Console
{
	public static uint16[2] GetConsoleCursorPosition()
	{
		let handle = GetStdHandle(STD_OUTPUT_HANDLE);
		CONSOLE_SCREEN_BUFFER_INFO consoleInfo = .();
		if (GetConsoleScreenBufferInfo(handle, out consoleInfo) != 0)
		{
			return consoleInfo.mCursorPosition;
		}
		return uint16[2](0,0);
	}

	public static void SetConsoleCursorPosition(uint16[2] pos)
	{
		let handle = GetStdHandle(STD_OUTPUT_HANDLE);
		SetConsoleCursorPosition(handle,COORD((.)pos[0], (.)pos[1]));
	}
}