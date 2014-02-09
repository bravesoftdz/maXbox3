unit uPSI_IdDayTimeUDP;
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
  TPSImport_IdDayTimeUDP = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdDayTimeUDP(CL: TPSPascalCompiler);
procedure SIRegister_IdDayTimeUDP(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdDayTimeUDP(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdDayTimeUDP(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdAssignedNumbers
  ,IdUDPBase
  ,IdUDPClient
  ,IdDayTimeUDP
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdDayTimeUDP]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdDayTimeUDP(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdUDPClient', 'TIdDayTimeUDP') do
  with CL.AddClassN(CL.FindClass('TIdUDPClient'),'TIdDayTimeUDP') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterProperty('DayTimeStr', 'String', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdDayTimeUDP(CL: TPSPascalCompiler);
begin
  SIRegister_TIdDayTimeUDP(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdDayTimeUDPDayTimeStr_R(Self: TIdDayTimeUDP; var T: String);
begin T := Self.DayTimeStr; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdDayTimeUDP(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdDayTimeUDP) do
  begin
    RegisterConstructor(@TIdDayTimeUDP.Create, 'Create');
    RegisterPropertyHelper(@TIdDayTimeUDPDayTimeStr_R,nil,'DayTimeStr');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdDayTimeUDP(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdDayTimeUDP(CL);
end;

 
 
{ TPSImport_IdDayTimeUDP }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdDayTimeUDP.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdDayTimeUDP(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdDayTimeUDP.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdDayTimeUDP(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
