unit LoadFromUrls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls,
  System.Generics.Collections,
  JPEG;

type
  TViewFromUrls = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    sgImages: TStringGrid;
    Image1: TImage;
    cbActive: TCheckBox;
    ebInterval: TLabeledEdit;
    DBNavigator1: TDBNavigator;
    bClose: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ebIntervalExit(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
    procedure sgImagesClick(Sender: TObject);
  private
    FImages: TObjectList<TStream>;
    FCurrentImage: Integer;

    procedure LoadImage(const AUrl: string);
    procedure ShowNextImage;
  public
    { Public declarations }
    procedure LoadImages(AListOfUrls: TStrings);
  public
    class procedure Execute(AUrls: TStrings);
  end;

var
  ViewFromUrls: TViewFromUrls;

implementation

{$R *.dfm}
uses System.Net.HttpClient;

procedure GetSizeText(const Text:String; Font:TFont; out Width, Height: Double);
var
  LBmp: TBitmap;
begin
  LBmp := TBitmap.Create;
  try
   LBmp.Canvas.Font := Font;
   Width := LBmp.Canvas.TextWidth(Text);
   Height := LBmp.Canvas.TextHeight(Text);
  finally
   LBmp.Free;
  end;
end;

{ TViewFromUrls }

procedure TViewFromUrls.FormCreate(Sender: TObject);
var
  w: Double;
  h: Double;
begin
  FImages := TObjectList<TStream>.Create;
  ebInterval.Text := IntToStr(Timer1.Interval);
  sgImages.Cells[0, 0] := 'Ix';
  sgImages.Cells[1, 0] := 'Valid';
  sgImages.Cells[2, 0] := 'Url';
  GetSizeText('X', sgImages.Font, w, h);
  sgImages.ColWidths[0] := Trunc(4 * w);
  sgImages.ColWidths[1] := Trunc(6 * w);
  sgImages.ColWidths[2] := Trunc(100 * w);
end;

procedure TViewFromUrls.FormDestroy(Sender: TObject);
begin
  FImages.Free;
end;

procedure TViewFromUrls.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TViewFromUrls.LoadImage(const AUrl: string);
var
  HttpClient: THttpClient;
  m: TMemoryStream;
begin
  m := TMemoryStream.Create;
  HttpClient := THttpClient.Create;
  try
    HttpClient.Get(AUrl, m);
    m.Position := 0;
    FImages.Add(m); // FImages will clean up the stream-objects when free'd
    sgImages.Cells[2, FImages.Count] := AUrl;
  finally
    FreeAndNil(HttpClient);
  end;
end;

procedure TViewFromUrls.LoadImages(AListOfUrls: TStrings);
var
  I: Integer;
begin
  Timer1.Enabled := False;
  for I := 0 to AListOfUrls.Count-1 do
  begin
    LoadImage(AListOfUrls[I]);
    sgImages.Cells[0, I+1] := IntToStr(I+1);
  end;
  Timer1.Enabled := True;
end;

procedure TViewFromUrls.ShowNextImage;
var
  strm: TStream;
begin
  strm := FImages[FCurrentImage];
  strm.Position := 0;
  Image1.Picture.LoadFromStream(strm);
  sgImages.Row := FCurrentImage+1;
end;

procedure TViewFromUrls.sgImagesClick(Sender: TObject);
begin
  if sgImages.Enabled then
  begin
    var selRow := sgImages.Row - 1;
    if (selRow>=0) and (selRow<FImages.Count) then
    begin
      FCurrentImage := selRow;
      ShowNextImage;
    end;
  end;
end;

procedure TViewFromUrls.cbActiveClick(Sender: TObject);
begin
  Timer1.Enabled := cbActive.Checked;
  sgImages.Enabled := not cbActive.Checked;
end;

procedure TViewFromUrls.ebIntervalExit(Sender: TObject);
begin
  var val := StrToInt(ebInterval.Text);
  if (val>100) and (val<20000) then
    Timer1.Interval := val
  else
    ebInterval.Text := IntToStr(Timer1.Interval);
end;

procedure TViewFromUrls.Timer1Timer(Sender: TObject);
begin
  if FImages.Count>1 then
  begin
    FCurrentImage := (FCurrentImage + 1) mod FImages.Count;
    ShowNextImage;
  end;
end;

class procedure TViewFromUrls.Execute(AUrls: TStrings);
var
  frm: TViewFromUrls;
begin
  Application.CreateForm(TViewFromUrls, frm);
  frm.sgImages.RowCount := 1 + AUrls.Count;
  frm.LoadImages(AUrls);
  frm.Visible := True;
end;

end.
