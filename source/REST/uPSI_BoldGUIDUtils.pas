unit uPSI_BoldGUIDUtils;
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
  TPSImport_BoldGUIDUtils = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_BoldGUIDUtils(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_BoldGUIDUtils_Routines(S: TPSExec);

procedure Register;

implementation


uses
   BoldGUIDUtils
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_BoldGUIDUtils]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_BoldGUIDUtils(CL: TPSPascalCompiler);
begin
 CL.AddDelphiFunction('Function BoldCreateGUIDAsString( StripBrackets : Boolean) : string');
 CL.AddDelphiFunction('Function BoldCreateGUIDWithBracketsAsString : string');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_BoldGUIDUtils_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@BoldCreateGUIDAsString, 'BoldCreateGUIDAsString', cdRegister);
 S.RegisterDelphiFunction(@BoldCreateGUIDWithBracketsAsString, 'BoldCreateGUIDWithBracketsAsString', cdRegister);
end;

 
 
{ TPSImport_BoldGUIDUtils }
(*----------------------------------------------------------------------------*)
procedure TPSImport_BoldGUIDUtils.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_BoldGUIDUtils(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_BoldGUIDUtils.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_BoldGUIDUtils(ri);
  RIRegister_BoldGUIDUtils_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
