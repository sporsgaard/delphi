unit SBN559TextCustomControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  DynCheckBox, DynTimePicker, DynDatePicker, DynLabel, IBSCommon, DynEdit,
  DynMemo;

type
  Tcs_texts_composite_panel_Xx = class(TCustomPanel)
    L_pcid: TDynLabel;
    L_pcidext: TDynLabel;
    L_stdate: TDynLabel;
    L_recurring: TDynLabel;
    L_endate: TDynLabel;
    L_crdate: TDynLabel;
    L_user: TDynLabel;
    L_temp_memo: TDynLabel;
    e_pcid: TDynEdit;
    e_pcidext: TDynEdit;
    e_stdate: TDynDatePicker;
    e_sttime: TDynTimePicker;
    e_recurring: TDynCheckBox;
    e_endate: TDynDatePicker;
    e_entime: TDynTimePicker;
    e_crdate: TDynEdit;
    e_user: TDynEdit;
    e_temp_memo: TDynMemo;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property Align;
  end;

  Tcs_texts_composite_tabsheet = class(TTabSheet)
    FTextPanel: Tcs_texts_composite_panel_Xx;

    constructor Create(AOwner: TComponent); override;
  end;

  Tcs_temp_textXX = class
  public
    Ix: Integer;
    E_pcid: string;
    E_pcidext: string;
    E_stdate: string;
    E_sttime: string;
    E_recurring: Boolean;
    E_endate: string;
    E_entime: string;
    E_crdate: string;
    E_user: string;
    E_temp_memo: string;
  end;

  Tcs_texts_composite_tabcontrolXX = class(TCustomTabControl)
    L_pcid: TDynLabel;
    L_pcidext: TDynLabel;
    L_stdate: TDynLabel;
    L_recurring: TDynLabel;
    L_endate: TDynLabel;
    L_crdate: TDynLabel;
    L_user: TDynLabel;
    L_temp_memo: TDynLabel;
    E_pcid: TDynEdit;
    E_pcidext: TDynEdit;
    E_stdate: TDynDatePicker;
    E_sttime: TDynTimePicker;
    E_recurring: TDynCheckBox;
    E_endate: TDynDatePicker;
    E_entime: TDynTimePicker;
    E_crdate: TDynEdit;
    E_user: TDynEdit;
    E_temp_memo: TDynMemo;
  protected
    FDummy,
    FCurrent: Tcs_temp_textXX;
    FInChange: Boolean;

    procedure Change; override;
    function  CanChange: Boolean; override;

    procedure ShowValues;
    procedure E_pcid_change(Sender: TObject);
    procedure E_pcidext_change(Sender: TObject);
    procedure E_stdate_change(Sender: TObject);
    procedure E_sttime_change(Sender: TObject);
    procedure E_recurring_change(Sender: TObject);
    procedure E_endate_change(Sender: TObject);
    procedure E_entime_change(Sender: TObject);
    procedure E_temp_memo_change(Sender: TObject);
  private
    function GetItem(AIndex: Integer): Tcs_temp_textXX;
    procedure ConstructControls(AOwner: TComponent);
    procedure InternalClear(Disposing: Boolean);
  public
    function TabCount: Integer;
    procedure Clear;
    function Add: Tcs_temp_textXX;
    procedure Remove(AIndex: Integer);
    procedure SetEnabled(Value: Boolean); override;
    procedure SetTab(AIndex: Integer);

    property Item[AIndex: Integer]: Tcs_temp_textXX read GetItem;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AParent: TWinControl); overload;
    destructor  Destroy; override;
  published
    property Align;
  end;




procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IBSUS', [Tcs_texts_composite_panel_Xx]);
end;

{ Tcs_texts_composite_panel }

constructor Tcs_texts_composite_panel_Xx.Create(AOwner: TComponent);
begin
  inherited;
  Width := 1060;
  Height := 154;

  // create controls:
  l_pcidext := TDynLabel.Create(AOwner);
  l_pcidext.Parent := self;
  l_pcidext.Left := 137;
  l_pcidext.Top := 14;
  l_pcidext.Width := 4;
  l_pcidext.Height := 13;
  l_pcidext.Caption := '-';

  L_stdate := TDynLabel.Create(AOwner);
  L_stdate.Parent := self;
  L_stdate.Left := 231;
  L_stdate.Top := 14;
  L_stdate.Width := 24;
  L_stdate.Height := 13;
  L_stdate.Caption := 'Start';

  L_recurring := TDynLabel.Create(AOwner);
  L_recurring.Parent := self;
  L_recurring.Left := 680;
  L_recurring.Top := 14;
  L_recurring.Width := 46;
  L_recurring.Height := 13;
  L_recurring.Caption := 'Recurring';

  L_endate := TDynLabel.Create(AOwner);
  L_endate.Parent := self;
  L_endate.Left := 453;
  L_endate.Top := 14;
  L_endate.Width := 30;
  L_endate.Height := 13;
  L_endate.Caption := 'Expire';

  L_crdate := TDynLabel.Create(AOwner);
  L_crdate.Parent := self;
  L_crdate.Left := 776;
  L_crdate.Top := 14;
  L_crdate.Width := 33;
  L_crdate.Height := 13;
  L_crdate.Caption := 'Create';

  L_user := TDynLabel.Create(AOwner);
  L_user.Parent := self;
  L_user.Left := 927;
  L_user.Top := 14;
  L_user.Width := 22;
  L_user.Height := 13;
  L_user.Caption := 'User';

  L_temp_memo := TDynLabel.Create(AOwner);
  L_temp_memo.Parent := self;
  L_temp_memo.Left := 8;
  L_temp_memo.Top := 38;
  L_temp_memo.Width := 50;
  L_temp_memo.Height := 13;
  L_temp_memo.Caption := 'Text';

  e_pcid := TDynEdit.Create(AOwner);
  e_pcid.Parent := self;
  e_pcid.Left := 64;
  e_pcid.Top := 11;
  e_pcid.Width := 70;
  e_pcid.Height := 21;
  e_pcid.TabOrder := 0;
  e_pcid.LabelDistance := 4;
  e_pcid.Required := False;

  e_pcidext := TDynEdit.Create(AOwner);
  e_pcidext.Parent := self;
  e_pcidext.Left := 145;
  e_pcidext.Top := 11;
  e_pcidext.Width := 70;
  e_pcidext.Height := 21;
  e_pcidext.TabOrder := 1;
  e_pcidext.LabelDistance := 4;
  e_pcidext.Text := 'e_pcidext';

  e_stdate := TDynDatePicker.Create(AOwner);
  e_stdate.Parent := self;
  e_stdate.Left := 261;
  e_stdate.Top := 11;
  e_stdate.Width := 90;
  e_stdate.Height := 21;
  e_stdate.TabOrder := 2;
  e_stdate.LabelDistance := 4;
  e_stdate.Required := False;

  e_sttime := TDynTimePicker.Create(AOwner);
  e_sttime.Parent := self;
  e_sttime.Left := 357;
  e_sttime.Top := 11;
  e_sttime.Width := 70;
  e_sttime.Height := 21;
  e_sttime.TabOrder := 3;
  e_sttime.LabelDistance := 4;
  e_sttime.Required := False;

  e_recurring := TDynCheckBox.Create(AOwner);
  e_recurring.Parent := self;
  e_recurring.Left := 729;
  e_recurring.Top := 15;
  e_recurring.Width := 13;
  e_recurring.Height := 13;
  e_recurring.TabOrder := 4;
  e_recurring.Required := False;
  e_recurring.LabelDistance := 4;
  e_recurring.LabelPosition := lpNone;

  e_endate := TDynDatePicker.Create(AOwner);
  e_endate.Parent := self;
  e_endate.Left := 489;
  e_endate.Top := 11;
  e_endate.Width := 90;
  e_endate.Height := 21;
  e_endate.TabOrder := 5;
  e_endate.LabelDistance := 4;
  e_endate.Required := False;

  e_entime := TDynTimePicker.Create(AOwner);
  e_entime.Parent := self;
  e_entime.Left := 585;
  e_entime.Top := 11;
  e_entime.Width := 70;
  e_entime.Height := 21;
  e_entime.TabOrder := 6;
  e_entime.LabelDistance := 4;
  e_entime.Required := False;

  e_crdate := TDynEdit.Create(AOwner);
  e_crdate.Parent := self;
  e_crdate.Left := 815;
  e_crdate.Top := 11;
  e_crdate.Width := 89;
  e_crdate.Height := 21;
  e_crdate.TabOrder := 7;
  e_crdate.LabelDistance := 4;
  e_crdate.Required := False;

  e_user := TDynEdit.Create(AOwner);
  e_user.Parent := self;
  e_user.Left := 955;
  e_user.Top := 11;
  e_user.Width := 89;
  e_user.Height := 21;
  e_user.TabOrder := 8;
  e_user.LabelDistance := 4;
  e_user.Required := False;
  e_user.Text := 'e_user';

  e_temp_memo := TDynMemo.Create(AOwner);
  e_temp_memo.Parent := self;
  e_temp_memo.Left := 64;
  e_temp_memo.Top := 40;
  e_temp_memo.Width := 980;
  e_temp_memo.Height := 97;
  e_temp_memo.ScrollBars := ssVertical;
  e_temp_memo.TabOrder := 9;
  e_temp_memo.Required := False;
  e_temp_memo.Validation := False;
  e_temp_memo.LineLen := 0;
  e_temp_memo.LabelDistance := 4;
  e_temp_memo.LabelPosition := lpNone;

  l_pcid := TDynLabel.Create(AOwner);
  l_pcid.Parent := self;
  l_pcid.Left := 8;
  l_pcid.Top := 14;
  l_pcid.Width := 50;
  l_pcid.Height := 13;
  l_pcid.Caption := 'Authorizer';
  l_pcid.Visible := True;
end;

destructor Tcs_texts_composite_panel_Xx.Destroy;
begin

  inherited;
end;

{ Tcs_texts_composite_tabsheet }

constructor Tcs_texts_composite_tabsheet.Create(AOwner: TComponent);
begin
  inherited;
  FTextPanel := Tcs_texts_composite_panel_Xx.Create(AOwner);
  FTextPanel.Parent := self;
  FTextPanel.Align := alClient;
end;

{ Tcs_texts_composite_tabcontrol }

procedure Tcs_texts_composite_tabcontrolXX.ConstructControls(AOwner: TComponent);
var
  Y: Integer;
  X: Integer;
  StartReadonly: Boolean;
begin
  Y := 24;
  X := 20;
  StartReadonly := False;

  // create controls:
  L_pcid := TDynLabel.Create(AOwner);
  L_pcid.Parent := self;
  L_pcid.Left := X + 8;
  L_pcid.Top := Y + 14;
  // L_pcid.Width := 50;
  L_pcid.Height := 13;
  L_pcid.Caption := 'Authorizer';
  L_pcid.Visible := True;

  E_pcid := TDynEdit.Create(AOwner);
  E_pcid.Parent := self;
  E_pcid.Left := X + 104;
  E_pcid.Top := Y + 11;
  E_pcid.Width := 70;
  E_pcid.Height := 21;
  E_pcid.TabOrder := 0;
  E_pcid.LabelDistance := 4;
  E_pcid.OnChange := E_pcid_change;

  L_pcidext := TDynLabel.Create(AOwner);
  L_pcidext.Parent := self;
  L_pcidext.Left := X + 180;
  L_pcidext.Top := Y + 14;
  L_pcidext.Width := 4;
  L_pcidext.Height := 13;
  L_pcidext.Caption := '-';

  E_pcidext := TDynEdit.Create(AOwner);
  E_pcidext.Parent := self;
  E_pcidext.Left := X + 190;
  E_pcidext.Top := Y + 11;
  E_pcidext.Width := 70;
  E_pcidext.Height := 21;
  E_pcidext.TabOrder := 1;
  E_pcidext.LabelDistance := 4;
  E_pcidext.Text := '';
  E_pcidext.OnChange := E_pcidext_change;

  L_stdate := TDynLabel.Create(AOwner);
  L_stdate.Parent := self;
  L_stdate.Left := X + 274;
  L_stdate.Top := Y + 14;
  L_stdate.Width := 24;
  L_stdate.Height := 13;
  L_stdate.Caption := 'Start';

  E_stdate := TDynDatePicker.Create(AOwner);
  E_stdate.Parent := self;
  E_stdate.Left := X + 320;
  E_stdate.Top := Y + 11;
  E_stdate.Width := 90;
  E_stdate.Height := 21;
  E_stdate.TabOrder := 2;
  E_stdate.LabelDistance := 4;
  E_stdate.OnChange := E_stdate_change;

  E_sttime := TDynTimePicker.Create(AOwner);
  E_sttime.Parent := self;
  E_sttime.Left := X + 420;
  E_sttime.Top := Y + 11;
  E_sttime.Width := 70;
  E_sttime.Height := 21;
  E_sttime.TabOrder := 3;
  E_sttime.LabelDistance := 4;
  E_sttime.OnChange := E_sttime_change;

  L_endate := TDynLabel.Create(AOwner);
  L_endate.Parent := self;
  L_endate.Left := X + 514;
  L_endate.Top := Y + 14;
  L_endate.Width := 30;
  L_endate.Height := 13;
  L_endate.Caption := 'Expire';

  E_endate := TDynDatePicker.Create(AOwner);
  E_endate.Parent := self;
  E_endate.Left := X + 570;
  E_endate.Top := Y + 11;
  E_endate.Width := 90;
  E_endate.Height := 21;
  E_endate.TabOrder := 4;
  E_endate.LabelDistance := 4;
  E_endate.OnChange := E_endate_change;

  E_entime := TDynTimePicker.Create(AOwner);
  E_entime.Parent := self;
  E_entime.Left := X + 668;
  E_entime.Top := Y + 11;
  E_entime.Width := 70;
  E_entime.Height := 21;
  E_entime.TabOrder := 5;
  E_entime.LabelDistance := 4;
  E_entime.OnChange := E_entime_change;

  L_recurring := TDynLabel.Create(AOwner);
  L_recurring.Parent := self;
  L_recurring.Left := X + 768;
  L_recurring.Top := Y + 14;
  L_recurring.Width := 46;
  L_recurring.Height := 13;
  L_recurring.Caption := 'Recurring';

  E_recurring := TDynCheckBox.Create(AOwner);
  E_recurring.Parent := self;
  E_recurring.Left := X + 850;
  E_recurring.Top := Y + 18;
  E_recurring.Width := 16;
  E_recurring.Height := 18;
  E_recurring.TabOrder := 6;
  E_recurring.OnClick := E_recurring_change;
//  E_recurring.LabelDistance := 4;
//  E_recurring.LabelPosition := lpNone;

  L_crdate := TDynLabel.Create(AOwner);
  L_crdate.Parent := self;
  L_crdate.Left := X + 890;
  L_crdate.Top := Y + 14;
  L_crdate.Width := 33;
  L_crdate.Height := 13;
  L_crdate.Caption := 'Create';

  E_crdate := TDynEdit.Create(AOwner);
  E_crdate.Parent := self;
  E_crdate.Left := X + 950;
  E_crdate.Top := Y + 11;
  E_crdate.Width := 89;
  E_crdate.Height := 21;
  E_crdate.TabOrder := 7;
  // E_crdate.LabelDistance := 4;

  L_user := TDynLabel.Create(AOwner);
  L_user.Parent := self;
  L_user.Left := X + 1050;
  L_user.Top := Y + 14;
  L_user.Width := 22;
  L_user.Height := 13;
  L_user.Caption := 'User';

  E_user := TDynEdit.Create(AOwner);
  E_user.Parent := self;
  E_user.Left := X + 1090;
  E_user.Top := Y + 11;
  E_user.Width := 89;
  E_user.Height := 21;
  E_user.TabOrder := 8;
  E_user.LabelDistance := 4;

  L_temp_memo := TDynLabel.Create(AOwner);
  L_temp_memo.Parent := self;
  L_temp_memo.Left := X + 8;
  L_temp_memo.Top := Y + 58;
  L_temp_memo.Width := 50;
  L_temp_memo.Height := 13;
  L_temp_memo.Caption := 'Text';

  E_temp_memo := TDynMemo.Create(AOwner);
  E_temp_memo.Parent := self;
  E_temp_memo.Left := X + 64;
  E_temp_memo.Top := Y + 60;
  E_temp_memo.Width := self.Width - E_temp_memo.Left - 8;
  E_temp_memo.Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft, TAnchorKind.akRight, TAnchorKind.akBottom];
  E_temp_memo.Height := self.Height - E_temp_memo.Top - 8;
  E_temp_memo.ScrollBars := ssVertical;
  E_temp_memo.Validation := False;
  E_temp_memo.LineLen := 0;
  // E_temp_memo.LabelDistance := 4;
  // E_temp_memo.LabelPosition := lpNone;
  E_temp_memo.Text := '';
  E_temp_memo.LineLen := 4000;
  E_temp_memo.OnChange := E_temp_memo_change;

  self.Enabled := not StartReadonly;
  // linking controls
  L_pcid.FocusControl := E_pcid;
  E_pcid.DynLabel := L_pcid;

  L_pcidext.FocusControl := E_pcidext;
  E_pcidext.DynLabel := L_pcidext;

  L_stdate.FocusControl := E_stdate;
  E_stdate.DynLabel := L_stdate;

  L_endate.FocusControl := E_endate;
  E_endate.DynLabel := L_endate;

  L_recurring.FocusControl := E_recurring;
  E_recurring.DynLabel := L_recurring;

  L_crdate.FocusControl := E_crdate;
  E_crdate.DynLabel := L_crdate;

  L_user.FocusControl := E_user;
  E_user.DynLabel := L_user;

  L_temp_memo.FocusControl := E_temp_memo;
  E_temp_memo.DynLabel := L_temp_memo;

  FDummy := Tcs_temp_textXX.Create;
  FCurrent := FDummy;
  Tabs.Add(''); // TabControl fails with n
end;

constructor Tcs_texts_composite_tabcontrolXX.Create(AOwner: TComponent; AParent: TWinControl);
begin
  inherited Create(AOwner);
  self.Parent := AParent;
  ConstructControls(AOwner); // Create controls
end;

constructor Tcs_texts_composite_tabcontrolXX.Create(AOwner: TComponent);
begin
  inherited;
  if AOwner is TWinControl then
    self.Parent := AOwner as TWinControl;
  ConstructControls(AOwner); // Create controls
end;

destructor Tcs_texts_composite_tabcontrolXX.Destroy;
begin
  Clear;
  FDummy.Free;
  inherited;
end;

function Tcs_texts_composite_tabcontrolXX.Add: Tcs_temp_textXX;
begin
  Result := Tcs_temp_textXX.Create;
  if TabCount=0 then
  begin
    Tabs[0] := '1';
    Tabs.Objects[0] := Result;
    FCurrent := Result;
  end
  else
    Tabs.AddObject(IntToStr(Tabs.Count+1), Result);
end;


function Tcs_texts_composite_tabcontrolXX.GetItem(AIndex: Integer): Tcs_temp_textXX;
begin
  Result := Tabs.Objects[AIndex] as Tcs_temp_textXX;
end;

procedure Tcs_texts_composite_tabcontrolXX.Remove(AIndex: Integer);
begin
  var item := Tabs.Objects[AIndex];
  var onLast := TabIndex = (Tabs.Count-1);
  Tabs.Delete(AIndex);
  item.Free;
  if Tabs.Count = 0 then
    Tabs.Add('');
  if onLast then
    TabIndex := Tabs.Count-1;
  ShowValues;
end;

function Tcs_texts_composite_tabcontrolXX.TabCount: Integer;
begin
  if (Tabs.Count = 1) and (Tabs.Objects[0]=nil) then
    Result := 0
  else
    Result := Tabs.Count;
end;

function Tcs_texts_composite_tabcontrolXX.CanChange: Boolean;
begin
  Result :=
    // CanChange => Empty memo
    //              or start and end dates defined
    (
      (Trim(E_temp_memo.Text) = '') or
      ((E_stdate.Text <> '') and (E_endate.Text <> ''))
    );

  Result := Result and inherited CanChange;
end;

procedure Tcs_texts_composite_tabcontrolXX.Change;
begin
  inherited;
  if TabCount = 0 then
    FCurrent := FDummy
  else
    FCurrent := Tabs.Objects[TabIndex] as Tcs_temp_textXX;
  ShowValues;
end;

procedure Tcs_texts_composite_tabcontrolXX.Clear;
begin
  InternalClear(False);
end;

procedure Tcs_texts_composite_tabcontrolXX.InternalClear(Disposing: Boolean);
var
  I: Integer;
begin
  for I := Tabs.Count-1 downto 0 do
    Tabs.Objects[I].Free;
  Tabs.Clear;
  if not Disposing then
  begin
    Tabs.Add('');
    FCurrent := FDummy;
    E_pcid.Text := '';
    E_pcidext.Text := '';
    E_stdate.Text := '';
    E_sttime.Text := '';
    E_recurring.Checked := False;
    E_endate.Text := '';
    E_entime.Text := '';
    E_crdate.Text := '';
    E_user.Text := '';
    E_temp_memo.Text := '';
  end;
end;



procedure Tcs_texts_composite_tabcontrolXX.SetEnabled(Value: Boolean);
begin
  // inherited;
  E_pcid.Readonly := not Value;
  E_pcidext.Readonly := not Value;
  E_stdate.Readonly := not Value;
  E_sttime.Readonly := not Value;
  E_recurring.Enabled := Value;
  E_endate.Readonly := not Value;
  E_entime.Readonly := not Value;
  E_crdate.Readonly := True;
  E_user.Readonly := True;
  E_temp_memo.Readonly := not Value;
end;

procedure Tcs_texts_composite_tabcontrolXX.SetTab(AIndex: Integer);
begin
  TabIndex := AIndex;
  Change;
end;

procedure Tcs_texts_composite_tabcontrolXX.ShowValues;
begin
  FInChange := True;
    FCurrent := Tabs.Objects[TabIndex] as Tcs_temp_textXX;

    L_pcid.Caption := IntToStr(TabIndex) + '-Authorizer';
    E_pcid.Text := FCurrent.E_pcid;
    E_pcidext.Text := FCurrent.E_pcidext;
    E_stdate.Text := FCurrent.E_stdate;
    E_sttime.Text := FCurrent.E_sttime;
    E_recurring.Checked := FCurrent.E_recurring;
    E_endate.Text := FCurrent.E_endate;
    E_entime.Text := FCurrent.E_entime;
    E_crdate.Text := FCurrent.E_crdate;
    E_user.Text := FCurrent.E_user;
    E_temp_memo.Text := FCurrent.E_temp_memo;
  FInChange := False;
end;


procedure Tcs_texts_composite_tabcontrolXX.E_endate_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_endate := E_endate.Text;
end;

procedure Tcs_texts_composite_tabcontrolXX.E_entime_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_entime:= E_entime.Text;
end;

procedure Tcs_texts_composite_tabcontrolXX.E_pcidext_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_pcidext := E_pcidext.Text;
end;

procedure Tcs_texts_composite_tabcontrolXX.E_pcid_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_pcid := E_pcid.Text;
end;

procedure Tcs_texts_composite_tabcontrolXX.E_recurring_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_recurring := E_recurring.Checked;
end;

procedure Tcs_texts_composite_tabcontrolXX.E_stdate_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_stdate := E_stdate.Text;
end;

procedure Tcs_texts_composite_tabcontrolXX.E_sttime_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_sttime:= E_sttime.Text;
end;

procedure Tcs_texts_composite_tabcontrolXX.E_temp_memo_change(Sender: TObject);
begin
  if not FInChange then
    FCurrent.E_temp_memo := E_temp_memo.Text;

  var rq := E_stdate.Required;
  var ne := Trim(E_temp_memo.Text)<>'';
  if rq <> ne then
  begin
    E_stdate.Required := ne;
    E_endate.Required := ne;
  end;
end;

end.
