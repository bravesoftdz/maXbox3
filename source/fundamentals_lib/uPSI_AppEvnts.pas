unit uPSI_AppEvnts;
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
  TPSImport_AppEvnts = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TApplicationEvents(CL: TPSPascalCompiler);
procedure SIRegister_TCustomApplicationEvents(CL: TPSPascalCompiler);
procedure SIRegister_AppEvnts(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TApplicationEvents(CL: TPSRuntimeClassImporter);
procedure RIRegister_TCustomApplicationEvents(CL: TPSRuntimeClassImporter);
procedure RIRegister_AppEvnts(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Messages
  ,Forms
  ,ActnList
  ,AppEvnts
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_AppEvnts]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TApplicationEvents(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomApplicationEvents', 'TApplicationEvents') do
  with CL.AddClassN(CL.FindClass('TCustomApplicationEvents'),'TApplicationEvents') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TCustomApplicationEvents(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TComponent', 'TCustomApplicationEvents') do
  with CL.AddClassN(CL.FindClass('TComponent'),'TCustomApplicationEvents') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure Activate');
    RegisterMethod('Procedure CancelDispatch');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_AppEvnts(CL: TPSPascalCompiler);
begin
  SIRegister_TCustomApplicationEvents(CL);
  SIRegister_TApplicationEvents(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TApplicationEvents(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TApplicationEvents) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TCustomApplicationEvents(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TCustomApplicationEvents) do
  begin
    RegisterConstructor(@TCustomApplicationEvents.Create, 'Create');
    RegisterMethod(@TCustomApplicationEvents.Activate, 'Activate');
    RegisterMethod(@TCustomApplicationEvents.CancelDispatch, 'CancelDispatch');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_AppEvnts(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TCustomApplicationEvents(CL);
  RIRegister_TApplicationEvents(CL);
end;

 
 
{ TPSImport_AppEvnts }
(*----------------------------------------------------------------------------*)
procedure TPSImport_AppEvnts.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_AppEvnts(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_AppEvnts.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_AppEvnts(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.