unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainFormImageViewer = class(TForm)
    bShowFromUrls: TButton;
    Memo1: TMemo;
    procedure bShowFromUrlsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFormImageViewer: TMainFormImageViewer;

implementation
{$R *.dfm}

uses LoadFromUrls;

procedure TMainFormImageViewer.bShowFromUrlsClick(Sender: TObject);
begin
  TViewFromUrls.Execute(memo1.Lines);
end;

end.
