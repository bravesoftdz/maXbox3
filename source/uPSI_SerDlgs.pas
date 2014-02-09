unit uPSI_SerDlgs;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_SerDlgs = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TSerDTRCheckBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerRTSCheckBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerHandshakeComboBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerParityBitComboBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerStopBitsComboBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerDataBitsComboBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerBaudComboBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerPortComboBox(CL: TPSPascalCompiler);
procedure SIRegister_TSerComboBox(CL: TPSPascalCompiler);
procedure SIRegister_SerDlgs(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_SerDlgs_Routines(S: TPSExec);
procedure RIRegister_TSerDTRCheckBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerRTSCheckBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerHandshakeComboBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerParityBitComboBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerStopBitsComboBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerDataBitsComboBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerBaudComboBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerPortComboBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerComboBox(CL: TPSRuntimeClassImporter);
procedure RIRegister_SerDlgs(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Controls
  ,StdCtrls
  ,Serial
  ,SerDlgs
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_SerDlgs]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerDTRCheckBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TSerRTSCheckBox', 'TSerDTRCheckBox') do
  with CL.AddClassN(CL.FindClass('TSerRTSCheckBox'),'TSerDTRCheckBox') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerRTSCheckBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomCheckBox', 'TSerRTSCheckBox') do
  with CL.AddClassN(CL.FindClass('TCustomCheckBox'),'TSerRTSCheckBox') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterProperty('Serial', 'TSerial', iptrw);
    RegisterProperty('Caption', 'TCaption', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerHandshakeComboBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TSerComboBox', 'TSerHandshakeComboBox') do
  with CL.AddClassN(CL.FindClass('TSerComboBox'),'TSerHandshakeComboBox') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure UpdateList');
    RegisterProperty('Serial', 'TSerial', iptrw);
    RegisterProperty('ViewNone', 'boolean', iptrw);
    RegisterProperty('ViewSoft', 'boolean', iptrw);
    RegisterProperty('ViewRTSCTS', 'boolean', iptrw);
    RegisterProperty('ViewDTRDSR', 'boolean', iptrw);
    RegisterProperty('TextNone', 'string', iptrw);
    RegisterProperty('TextSoft', 'string', iptrw);
    RegisterProperty('TextRTSCTS', 'string', iptrw);
    RegisterProperty('TextDTRDSR', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerParityBitComboBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TSerComboBox', 'TSerParityBitComboBox') do
  with CL.AddClassN(CL.FindClass('TSerComboBox'),'TSerParityBitComboBox') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure UpdateList');
    RegisterProperty('Serial', 'TSerial', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerStopBitsComboBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TSerComboBox', 'TSerStopBitsComboBox') do
  with CL.AddClassN(CL.FindClass('TSerComboBox'),'TSerStopBitsComboBox') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure UpdateList');
    RegisterProperty('Serial', 'TSerial', iptrw);
    RegisterProperty('Text', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerDataBitsComboBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TSerComboBox', 'TSerDataBitsComboBox') do
  with CL.AddClassN(CL.FindClass('TSerComboBox'),'TSerDataBitsComboBox') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure UpdateList');
    RegisterProperty('Serial', 'TSerial', iptrw);
    RegisterProperty('Text', 'string', iptrw);
    RegisterProperty('Min', 'TDataBits', iptrw);
    RegisterProperty('Max', 'TDataBits', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerBaudComboBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TSerComboBox', 'TSerBaudComboBox') do
  with CL.AddClassN(CL.FindClass('TSerComboBox'),'TSerBaudComboBox') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure InitList( FromBaud, ToBaud : integer)');
    RegisterMethod('Procedure ClearList');
    RegisterMethod('Procedure AddList( Baud : integer)');
    RegisterMethod('Procedure UpdateList');
    RegisterProperty('Serial', 'TSerial', iptrw);
    RegisterProperty('Text', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerPortComboBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TSerComboBox', 'TSerPortComboBox') do
  with CL.AddClassN(CL.FindClass('TSerComboBox'),'TSerPortComboBox') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure UpdateList');
    RegisterProperty('Serial', 'TCustomSerial', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSerComboBox(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomComboBox', 'TSerComboBox') do
  with CL.AddClassN(CL.FindClass('TCustomComboBox'),'TSerComboBox') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_SerDlgs(CL: TPSPascalCompiler);
begin
  SIRegister_TSerComboBox(CL);
  SIRegister_TSerPortComboBox(CL);
  SIRegister_TSerBaudComboBox(CL);
  SIRegister_TSerDataBitsComboBox(CL);
  SIRegister_TSerStopBitsComboBox(CL);
  SIRegister_TSerParityBitComboBox(CL);
  SIRegister_TSerHandshakeComboBox(CL);
  SIRegister_TSerRTSCheckBox(CL);
  SIRegister_TSerDTRCheckBox(CL);
 CL.AddDelphiFunction('Procedure Register');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TSerRTSCheckBoxCaption_W(Self: TSerRTSCheckBox; const T: TCaption);
begin Self.Caption := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerRTSCheckBoxCaption_R(Self: TSerRTSCheckBox; var T: TCaption);
begin T := Self.Caption; end;

(*----------------------------------------------------------------------------*)
procedure TSerRTSCheckBoxSerial_W(Self: TSerRTSCheckBox; const T: TSerial);
begin Self.Serial := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerRTSCheckBoxSerial_R(Self: TSerRTSCheckBox; var T: TSerial);
begin T := Self.Serial; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextDTRDSR_W(Self: TSerHandshakeComboBox; const T: string);
begin Self.TextDTRDSR := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextDTRDSR_R(Self: TSerHandshakeComboBox; var T: string);
begin T := Self.TextDTRDSR; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextRTSCTS_W(Self: TSerHandshakeComboBox; const T: string);
begin Self.TextRTSCTS := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextRTSCTS_R(Self: TSerHandshakeComboBox; var T: string);
begin T := Self.TextRTSCTS; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextSoft_W(Self: TSerHandshakeComboBox; const T: string);
begin Self.TextSoft := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextSoft_R(Self: TSerHandshakeComboBox; var T: string);
begin T := Self.TextSoft; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextNone_W(Self: TSerHandshakeComboBox; const T: string);
begin Self.TextNone := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxTextNone_R(Self: TSerHandshakeComboBox; var T: string);
begin T := Self.TextNone; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewDTRDSR_W(Self: TSerHandshakeComboBox; const T: boolean);
begin Self.ViewDTRDSR := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewDTRDSR_R(Self: TSerHandshakeComboBox; var T: boolean);
begin T := Self.ViewDTRDSR; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewRTSCTS_W(Self: TSerHandshakeComboBox; const T: boolean);
begin Self.ViewRTSCTS := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewRTSCTS_R(Self: TSerHandshakeComboBox; var T: boolean);
begin T := Self.ViewRTSCTS; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewSoft_W(Self: TSerHandshakeComboBox; const T: boolean);
begin Self.ViewSoft := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewSoft_R(Self: TSerHandshakeComboBox; var T: boolean);
begin T := Self.ViewSoft; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewNone_W(Self: TSerHandshakeComboBox; const T: boolean);
begin Self.ViewNone := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxViewNone_R(Self: TSerHandshakeComboBox; var T: boolean);
begin T := Self.ViewNone; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxSerial_W(Self: TSerHandshakeComboBox; const T: TSerial);
begin Self.Serial := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerHandshakeComboBoxSerial_R(Self: TSerHandshakeComboBox; var T: TSerial);
begin T := Self.Serial; end;

(*----------------------------------------------------------------------------*)
procedure TSerParityBitComboBoxSerial_W(Self: TSerParityBitComboBox; const T: TSerial);
begin Self.Serial := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerParityBitComboBoxSerial_R(Self: TSerParityBitComboBox; var T: TSerial);
begin T := Self.Serial; end;

(*----------------------------------------------------------------------------*)
procedure TSerStopBitsComboBoxText_W(Self: TSerStopBitsComboBox; const T: string);
begin Self.Text := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerStopBitsComboBoxText_R(Self: TSerStopBitsComboBox; var T: string);
begin T := Self.Text; end;

(*----------------------------------------------------------------------------*)
procedure TSerStopBitsComboBoxSerial_W(Self: TSerStopBitsComboBox; const T: TSerial);
begin Self.Serial := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerStopBitsComboBoxSerial_R(Self: TSerStopBitsComboBox; var T: TSerial);
begin T := Self.Serial; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxMax_W(Self: TSerDataBitsComboBox; const T: TDataBits);
begin Self.Max := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxMax_R(Self: TSerDataBitsComboBox; var T: TDataBits);
begin T := Self.Max; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxMin_W(Self: TSerDataBitsComboBox; const T: TDataBits);
begin Self.Min := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxMin_R(Self: TSerDataBitsComboBox; var T: TDataBits);
begin T := Self.Min; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxText_W(Self: TSerDataBitsComboBox; const T: string);
begin Self.Text := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxText_R(Self: TSerDataBitsComboBox; var T: string);
begin T := Self.Text; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxSerial_W(Self: TSerDataBitsComboBox; const T: TSerial);
begin Self.Serial := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerDataBitsComboBoxSerial_R(Self: TSerDataBitsComboBox; var T: TSerial);
begin T := Self.Serial; end;

(*----------------------------------------------------------------------------*)
procedure TSerBaudComboBoxText_W(Self: TSerBaudComboBox; const T: string);
begin Self.Text := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerBaudComboBoxText_R(Self: TSerBaudComboBox; var T: string);
begin T := Self.Text; end;

(*----------------------------------------------------------------------------*)
procedure TSerBaudComboBoxSerial_W(Self: TSerBaudComboBox; const T: TSerial);
begin Self.Serial := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerBaudComboBoxSerial_R(Self: TSerBaudComboBox; var T: TSerial);
begin T := Self.Serial; end;

(*----------------------------------------------------------------------------*)
procedure TSerPortComboBoxSerial_W(Self: TSerPortComboBox; const T: TCustomSerial);
begin Self.Serial := T; end;

(*----------------------------------------------------------------------------*)
procedure TSerPortComboBoxSerial_R(Self: TSerPortComboBox; var T: TCustomSerial);
begin T := Self.Serial; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_SerDlgs_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@Register, 'Register', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerDTRCheckBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerDTRCheckBox) do
  begin
    RegisterConstructor(@TSerDTRCheckBox.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerRTSCheckBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerRTSCheckBox) do
  begin
    RegisterConstructor(@TSerRTSCheckBox.Create, 'Create');
    RegisterPropertyHelper(@TSerRTSCheckBoxSerial_R,@TSerRTSCheckBoxSerial_W,'Serial');
    RegisterPropertyHelper(@TSerRTSCheckBoxCaption_R,@TSerRTSCheckBoxCaption_W,'Caption');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerHandshakeComboBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerHandshakeComboBox) do
  begin
    RegisterConstructor(@TSerHandshakeComboBox.Create, 'Create');
    RegisterMethod(@TSerHandshakeComboBox.UpdateList, 'UpdateList');
    RegisterPropertyHelper(@TSerHandshakeComboBoxSerial_R,@TSerHandshakeComboBoxSerial_W,'Serial');
    RegisterPropertyHelper(@TSerHandshakeComboBoxViewNone_R,@TSerHandshakeComboBoxViewNone_W,'ViewNone');
    RegisterPropertyHelper(@TSerHandshakeComboBoxViewSoft_R,@TSerHandshakeComboBoxViewSoft_W,'ViewSoft');
    RegisterPropertyHelper(@TSerHandshakeComboBoxViewRTSCTS_R,@TSerHandshakeComboBoxViewRTSCTS_W,'ViewRTSCTS');
    RegisterPropertyHelper(@TSerHandshakeComboBoxViewDTRDSR_R,@TSerHandshakeComboBoxViewDTRDSR_W,'ViewDTRDSR');
    RegisterPropertyHelper(@TSerHandshakeComboBoxTextNone_R,@TSerHandshakeComboBoxTextNone_W,'TextNone');
    RegisterPropertyHelper(@TSerHandshakeComboBoxTextSoft_R,@TSerHandshakeComboBoxTextSoft_W,'TextSoft');
    RegisterPropertyHelper(@TSerHandshakeComboBoxTextRTSCTS_R,@TSerHandshakeComboBoxTextRTSCTS_W,'TextRTSCTS');
    RegisterPropertyHelper(@TSerHandshakeComboBoxTextDTRDSR_R,@TSerHandshakeComboBoxTextDTRDSR_W,'TextDTRDSR');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerParityBitComboBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerParityBitComboBox) do
  begin
    RegisterConstructor(@TSerParityBitComboBox.Create, 'Create');
    RegisterMethod(@TSerParityBitComboBox.UpdateList, 'UpdateList');
    RegisterPropertyHelper(@TSerParityBitComboBoxSerial_R,@TSerParityBitComboBoxSerial_W,'Serial');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerStopBitsComboBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerStopBitsComboBox) do
  begin
    RegisterConstructor(@TSerStopBitsComboBox.Create, 'Create');
    RegisterMethod(@TSerStopBitsComboBox.UpdateList, 'UpdateList');
    RegisterPropertyHelper(@TSerStopBitsComboBoxSerial_R,@TSerStopBitsComboBoxSerial_W,'Serial');
    RegisterPropertyHelper(@TSerStopBitsComboBoxText_R,@TSerStopBitsComboBoxText_W,'Text');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerDataBitsComboBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerDataBitsComboBox) do
  begin
    RegisterConstructor(@TSerDataBitsComboBox.Create, 'Create');
    RegisterMethod(@TSerDataBitsComboBox.UpdateList, 'UpdateList');
    RegisterPropertyHelper(@TSerDataBitsComboBoxSerial_R,@TSerDataBitsComboBoxSerial_W,'Serial');
    RegisterPropertyHelper(@TSerDataBitsComboBoxText_R,@TSerDataBitsComboBoxText_W,'Text');
    RegisterPropertyHelper(@TSerDataBitsComboBoxMin_R,@TSerDataBitsComboBoxMin_W,'Min');
    RegisterPropertyHelper(@TSerDataBitsComboBoxMax_R,@TSerDataBitsComboBoxMax_W,'Max');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerBaudComboBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerBaudComboBox) do
  begin
    RegisterConstructor(@TSerBaudComboBox.Create, 'Create');
    RegisterMethod(@TSerBaudComboBox.InitList, 'InitList');
    RegisterMethod(@TSerBaudComboBox.ClearList, 'ClearList');
    RegisterMethod(@TSerBaudComboBox.AddList, 'AddList');
    RegisterMethod(@TSerBaudComboBox.UpdateList, 'UpdateList');
    RegisterPropertyHelper(@TSerBaudComboBoxSerial_R,@TSerBaudComboBoxSerial_W,'Serial');
    RegisterPropertyHelper(@TSerBaudComboBoxText_R,@TSerBaudComboBoxText_W,'Text');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerPortComboBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerPortComboBox) do
  begin
    RegisterConstructor(@TSerPortComboBox.Create, 'Create');
    RegisterMethod(@TSerPortComboBox.UpdateList, 'UpdateList');
    RegisterPropertyHelper(@TSerPortComboBoxSerial_R,@TSerPortComboBoxSerial_W,'Serial');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSerComboBox(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerComboBox) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_SerDlgs(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TSerComboBox(CL);
  RIRegister_TSerPortComboBox(CL);
  RIRegister_TSerBaudComboBox(CL);
  RIRegister_TSerDataBitsComboBox(CL);
  RIRegister_TSerStopBitsComboBox(CL);
  RIRegister_TSerParityBitComboBox(CL);
  RIRegister_TSerHandshakeComboBox(CL);
  RIRegister_TSerRTSCheckBox(CL);
  RIRegister_TSerDTRCheckBox(CL);
end;

 
 
{ TPSImport_SerDlgs }
(*----------------------------------------------------------------------------*)
procedure TPSImport_SerDlgs.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_SerDlgs(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_SerDlgs.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_SerDlgs(ri);
  RIRegister_SerDlgs_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
