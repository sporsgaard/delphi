unit custom_designer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DynCheckBox,
  DynTimePicker, DynDatePicker, DynLabel, IBSCommon, DynEdit, Vcl.ExtCtrls,
  DynMemo;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    DynEdit1: TDynEdit;
    DynLabel1: TDynLabel;
    DynLabel2: TDynLabel;
    DynEdit2: TDynEdit;
    DynDatePicker1: TDynDatePicker;
    DynLabel3: TDynLabel;
    DynTimePicker1: TDynTimePicker;
    DynCheckBox1: TDynCheckBox;
    DynLabel4: TDynLabel;
    DynLabel5: TDynLabel;
    DynDatePicker2: TDynDatePicker;
    DynTimePicker2: TDynTimePicker;
    DynEdit3: TDynEdit;
    DynLabel6: TDynLabel;
    DynEdit4: TDynEdit;
    DynLabel7: TDynLabel;
    DynLabel8: TDynLabel;
    DynMemo1: TDynMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

end.
