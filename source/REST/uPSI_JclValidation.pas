unit uPSI_JclValidation;
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
  TPSImport_JclValidation = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_JclValidation(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_JclValidation_Routines(S: TPSExec);

procedure Register;

implementation


uses
   JclUnitVersioning
  ,JclValidation
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JclValidation]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_JclValidation(CL: TPSPascalCompiler);
begin
 CL.AddDelphiFunction('Function IsValidISBN( const ISBN : AnsiString) : Boolean');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_JclValidation_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@IsValidISBN, 'IsValidISBN', cdRegister);
end;

 
 
{ TPSImport_JclValidation }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JclValidation.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JclValidation(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JclValidation.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JclValidation(ri);
  RIRegister_JclValidation_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
