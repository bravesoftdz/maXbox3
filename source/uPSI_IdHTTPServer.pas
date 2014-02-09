unit uPSI_IdHTTPServer;
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
  TPSImport_IdHTTPServer = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdHTTPServer(CL: TPSPascalCompiler);
procedure SIRegister_IdHTTPServer(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdHTTPServer(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdHTTPServer(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdCustomHTTPServer
  ,IdHTTPServer
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdHTTPServer]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdHTTPServer(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdCustomHTTPServer', 'TIdHTTPServer') do
  with CL.AddClassN(CL.FindClass('TIdCustomHTTPServer'),'TIdHTTPServer') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdHTTPServer(CL: TPSPascalCompiler);
begin
  SIRegister_TIdHTTPServer(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdHTTPServer(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdHTTPServer) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdHTTPServer(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdHTTPServer(CL);
end;

 
 
{ TPSImport_IdHTTPServer }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHTTPServer.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdHTTPServer(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHTTPServer.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdHTTPServer(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
