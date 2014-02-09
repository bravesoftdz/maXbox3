unit uPSI_ALFcnSkin;
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
  TPSImport_ALFcnSkin = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_ALFcnSkin(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_ALFcnSkin_Routines(S: TPSExec);

procedure Register;

implementation


uses
   AlScrollBar
  ,ALFcnSkin
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_ALFcnSkin]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_ALFcnSkin(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TAlPaintEvent', 'Procedure ( Sender : TObject; var continue : bo'
   +'olean)');
 CL.AddDelphiFunction('Procedure PaintALButtonBlueSkin( Sender : Tobject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALGraphicButtonBlueSkin( Sender : Tobject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALRadioButtonBlueSkin( Sender : Tobject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALCheckBoxBlueSkin( Sender : Tobject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALComboBoxBlueSkin( Sender : Tobject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALEditBlueSkin( Sender : Tobject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALMaskEditBlueSkin( Sender : Tobject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALStaticTextBlueSkin( Sender : Tobject; var continue : boolean)');
 CL.AddDelphiFunction('Procedure PaintALListBoxBlueSkin( Sender : TObject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALListBoxScrollBarBlueSkin( Sender : TObject; var continue : Boolean; Area : TALScrollbarArea)');
 CL.AddDelphiFunction('Procedure PaintALMemoBlueSkin( Sender : TObject; var continue : boolean; const UpdateFontColor : Boolean)');
 CL.AddDelphiFunction('Procedure PaintALMemoScrollBarBlueSkin( Sender : TObject; var continue : Boolean; Area : TALScrollbarArea)');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_ALFcnSkin_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@PaintALButtonBlueSkin, 'PaintALButtonBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALGraphicButtonBlueSkin, 'PaintALGraphicButtonBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALRadioButtonBlueSkin, 'PaintALRadioButtonBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALCheckBoxBlueSkin, 'PaintALCheckBoxBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALComboBoxBlueSkin, 'PaintALComboBoxBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALEditBlueSkin, 'PaintALEditBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALMaskEditBlueSkin, 'PaintALMaskEditBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALStaticTextBlueSkin, 'PaintALStaticTextBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALListBoxBlueSkin, 'PaintALListBoxBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALListBoxScrollBarBlueSkin, 'PaintALListBoxScrollBarBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALMemoBlueSkin, 'PaintALMemoBlueSkin', cdRegister);
 S.RegisterDelphiFunction(@PaintALMemoScrollBarBlueSkin, 'PaintALMemoScrollBarBlueSkin', cdRegister);
end;

 
 
{ TPSImport_ALFcnSkin }
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALFcnSkin.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_ALFcnSkin(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALFcnSkin.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_ALFcnSkin(ri);
  RIRegister_ALFcnSkin_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
