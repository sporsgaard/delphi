program SBN559TextCustomControlProject;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  SBN559TextCustomControl in 'SBN559TextCustomControl.pas',
  custom_designer in 'custom_designer.pas' {Form4},
  Composite_tabcontrol in 'Composite_tabcontrol.pas' {Form2},
  cs_texts_composite_text_control in 'C:\Src\SBN\SBN_GUI\SBN\Service_DataEntry\cs_texts_composite_text_control.pas',
  cs_texts_composite_panel_form in 'cs_texts_composite_panel_form.pas' {Form3},
  cs_texts_composite_panel in 'C:\Src\SBN\SBN_GUI\Units\cs_texts_composite_panel.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
