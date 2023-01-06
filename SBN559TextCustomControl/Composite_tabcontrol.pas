unit Composite_tabcontrol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  SBN559TextCustomControl, Vcl.ComCtrls,
  cs_texts_composite_text_control;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    bAdd: TButton;
    bClear: TButton;
    bSet2: TButton;
    bDel2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure bSet2Click(Sender: TObject);
    procedure bDel2Click(Sender: TObject);
  private
    { Private declarations }
    tt: Tcs_texts_composite_tabcontrol;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.bAddClick(Sender: TObject);
begin
  tt.Add;
end;

procedure TForm2.bClearClick(Sender: TObject);
begin
  tt.Clear;
end;

procedure TForm2.bDel2Click(Sender: TObject);
begin
  tt.Remove(2);
end;

procedure TForm2.bSet2Click(Sender: TObject);
begin
  tt.SetTab(2);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  tt := Tcs_texts_composite_tabcontrol.Create(self, self);
  tt.Parent := self;
  tt.Align := alClient;
end;

end.
