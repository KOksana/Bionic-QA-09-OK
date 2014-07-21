function Main()
{
  try
  {
    app();
    del();
    
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}

function app()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\test.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.Edit.Click(83, 15);
  Aliases.notepad.wndNotepad.Edit.Keys("world");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "helloworld", false);
  
  Aliases.notepad.wndNotepad.Close();
}
function del()
{
  TestedApps.cmd.Run();
  Aliases.cmd.wndConsoleWindowClass.Keys("cd\\[Enter]del test.txt[Enter]");
  Aliases.cmd.wndConsoleWindowClass.Click(656, 11);
}
