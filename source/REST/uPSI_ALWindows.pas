unit uPSI_ALWindows;
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
  TPSImport_ALWindows = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_ALWindows(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_ALWindows_Routines(S: TPSExec);

procedure Register;

implementation


uses
   Windows
  ,ALWindows
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_ALWindows]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_ALWindows(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('_ALMEMORYSTATUSEX', 'record dwLength : DWORD; dwMemoryLoad : DWO'
   +'RD; ullTotalPhys : Int64; ullAvailPhys : Int64; ullTotalPageFile : Int64; '
   +'ullAvailPageFile : Int64; ullTotalVirtual : Int64; ullAvailVirtual : Int64'
   +'; ullAvailExtendedVirtual : Int64; end');
  CL.AddTypeS('TALMemoryStatusEx', '_ALMEMORYSTATUSEX');
 CL.AddDelphiFunction('Function ALGlobalMemoryStatusEx( var lpBuffer : TALMEMORYSTATUSEX) : BOOL');
 CL.AddDelphiFunction('Function ALInterlockedExchange64( var Target : LONGLONG; Value : LONGLONG) : LONGLONG');
 CL.AddConstantN('INVALID_SET_FILE_POINTER','LongInt').SetInt( DWORD ( - 1 ));
 CL.AddConstantN('QUOTA_LIMITS_HARDWS_MIN_DISABLE','LongWord').SetUInt( $2);
 CL.AddConstantN('QUOTA_LIMITS_HARDWS_MIN_ENABLE','LongWord').SetUInt( $1);
 CL.AddConstantN('QUOTA_LIMITS_HARDWS_MAX_DISABLE','LongWord').SetUInt( $8);
 CL.AddConstantN('QUOTA_LIMITS_HARDWS_MAX_ENABLE','LongWord').SetUInt( $4);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_ALWindows_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@ALGlobalMemoryStatusEx, 'ALGlobalMemoryStatusEx', CdStdCall);
 S.RegisterDelphiFunction(@ALInterlockedExchange64, 'ALInterlockedExchange64', cdRegister);
end;

 
 
{ TPSImport_ALWindows }
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALWindows.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_ALWindows(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALWindows.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_ALWindows(ri);
  RIRegister_ALWindows_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.