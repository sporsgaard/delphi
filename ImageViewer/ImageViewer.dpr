program ImageViewer;

uses
  Vcl.Forms,
  main in 'main.pas' {MainFormImageViewer},
  LoadFromUrls in 'LoadFromUrls.pas' {ViewFromUrls};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFormImageViewer, MainFormImageViewer);
  Application.Run;
end.
