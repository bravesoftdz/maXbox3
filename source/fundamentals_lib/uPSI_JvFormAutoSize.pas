unit uPSI_JvFormAutoSize;
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
  TPSImport_JvFormAutoSize = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvFormAutoSize(CL: TPSPascalCompiler);
procedure SIRegister_JvFormAutoSize(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJvFormAutoSize(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvFormAutoSize(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
  // JclUnitVersioning
  //,Windows
  //,Messages
  //,Graphics
  //,Controls
  //,Forms
  StdCtrls
  ,JvComponentBase
  ,JvFormAutoSize
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvFormAutoSize]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvFormAutoSize(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvComponent', 'TJvFormAutoSize') do
  with CL.AddClassN(CL.FindClass('TJvComponent'),'TJvFormAutoSize') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure Free');
     RegisterProperty('Active', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvFormAutoSize(CL: TPSPascalCompiler);
begin
  SIRegister_TJvFormAutoSize(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvFormAutoSizeActive_W(Self: TJvFormAutoSize; const T: Boolean);
begin Self.Active := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvFormAutoSizeActive_R(Self: TJvFormAutoSize; var T: Boolean);
begin T := Self.Active; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvFormAutoSize(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvFormAutoSize) do begin
    RegisterConstructor(@TJvFormAutoSize.Create, 'Create');
    RegisterMethod(@TJvFormAutoSize.Destroy, 'Free');
    RegisterPropertyHelper(@TJvFormAutoSizeActive_R,@TJvFormAutoSizeActive_W,'Active');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvFormAutoSize(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TJvFormAutoSize(CL);
end;

 
 
{ TPSImport_JvFormAutoSize }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvFormAutoSize.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvFormAutoSize(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvFormAutoSize.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvFormAutoSize(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
