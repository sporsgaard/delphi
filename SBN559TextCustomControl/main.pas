unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    bCreate: TButton;
    PageControl1: TPageControl;
    bDel1: TButton;
    bDel2: TButton;
    bDel3: TButton;
    bDel4: TButton;
    bTabCtrl: TButton;
    procedure bCreateClick(Sender: TObject);
    procedure bDel1Click(Sender: TObject);
    procedure bDel2Click(Sender: TObject);
    procedure bDel3Click(Sender: TObject);
    procedure bDel4Click(Sender: TObject);
    procedure bTabCtrlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 {$R *.dfm}
uses SBN559TextCustomControl, Composite_tabcontrol, cs_texts_composite_panel;

procedure TForm1.bCreateClick(Sender: TObject);
begin
  var TabSheet := TTabSheet.Create(PageControl1);
  TabSheet.Caption := 'Tab Sheet #' + IntToStr(PageControl1.PageCount+1);
  TabSheet.PageControl := PageControl1;

//  var P := Tcs_texts_composite_panel.Create(self);
//  P.Parent := TabSheet;
//  P.Align := alClient;

  var P := Tcs_texts_composite_panel.Create(self, TabSheet);
  // P.Parent := TabSheet;
  P.Align := alClient;

end;

procedure TForm1.bDel1Click(Sender: TObject);
begin
  if PageControl1.PageCount>=1 then
    PageControl1.Pages[0].Free;
end;

procedure TForm1.bDel2Click(Sender: TObject);
begin
  if PageControl1.PageCount>=2 then
    PageControl1.Pages[1].Free;
end;

procedure TForm1.bDel3Click(Sender: TObject);
begin
  if PageControl1.PageCount>=3 then
    PageControl1.Pages[2].Free;
end;

procedure TForm1.bDel4Click(Sender: TObject);
begin
  if PageControl1.PageCount>=4 then
    PageControl1.Pages[3].Free;
end;

procedure TForm1.bTabCtrlClick(Sender: TObject);
begin
  var frm := TForm2.Create(nil);
end;

end.
