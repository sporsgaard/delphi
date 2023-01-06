unit cs_texts_composite_panel_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cs_texts_composite_text_control,
  cs_texts_composite_panel;

type
  TForm3 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
{$R *.dfm}


procedure TForm3.FormCreate(Sender: TObject);
begin
  var P := Tcs_texts_composite_panel.Create(self, self);
  P.Align := alClient;
end;

end.
