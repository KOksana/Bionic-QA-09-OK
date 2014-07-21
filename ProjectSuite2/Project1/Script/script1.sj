function Main()
{
  try
  {
    create();
    
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}

function create()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.Edit.Keys("hello");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save As...");
  Aliases.notepad.dlgSaveAs.SaveFile("C:\\test.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "hello", false);
  Aliases.notepad.wndNotepad.Close();
}    