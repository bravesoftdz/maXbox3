unit uPSI_DBXMetaDataUtil;
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
  TPSImport_DBXMetaDataUtil = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TDBXMetaDataUtil(CL: TPSPascalCompiler);
procedure SIRegister_DBXMetaDataUtil(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TDBXMetaDataUtil(CL: TPSRuntimeClassImporter);
procedure RIRegister_DBXMetaDataUtil(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   DBXMetaDataUtil
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_DBXMetaDataUtil]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TDBXMetaDataUtil(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TDBXMetaDataUtil') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TDBXMetaDataUtil') do
  begin
    RegisterMethod('Function QuoteIdentifier( const UnquotedIdentifier : WideString; const QuoteChar : WideString; const QuotePrefix : WideString; const QuoteSuffix : WideString) : WideString');
    RegisterMethod('Function UnquotedIdentifier( const QuotedIdentifier : WideString; const QuoteChar : WideString; const QuotePrefix : WideString; const QuoteSuffix : WideString) : WideString');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_DBXMetaDataUtil(CL: TPSPascalCompiler);
begin
  SIRegister_TDBXMetaDataUtil(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TDBXMetaDataUtil(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDBXMetaDataUtil) do
  begin
    RegisterMethod(@TDBXMetaDataUtil.QuoteIdentifier, 'QuoteIdentifier');
    RegisterMethod(@TDBXMetaDataUtil.UnquotedIdentifier, 'UnquotedIdentifier');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_DBXMetaDataUtil(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TDBXMetaDataUtil(CL);
end;

 
 
{ TPSImport_DBXMetaDataUtil }
(*----------------------------------------------------------------------------*)
procedure TPSImport_DBXMetaDataUtil.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_DBXMetaDataUtil(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_DBXMetaDataUtil.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_DBXMetaDataUtil(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
