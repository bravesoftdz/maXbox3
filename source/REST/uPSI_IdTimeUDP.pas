unit uPSI_IdTimeUDP;
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
  TPSImport_IdTimeUDP = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdTimeUDP(CL: TPSPascalCompiler);
procedure SIRegister_IdTimeUDP(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdTimeUDP(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdTimeUDP(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdAssignedNumbers
  ,IdUDPBase
  ,IdUDPClient
  ,IdTimeUDP
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdTimeUDP]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdTimeUDP(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdUDPClient', 'TIdTimeUDP') do
  with CL.AddClassN(CL.FindClass('TIdUDPClient'),'TIdTimeUDP') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Function SyncTime : Boolean');
    RegisterProperty('DateTimeCard', 'Cardinal', iptr);
    RegisterProperty('DateTime', 'TDateTime', iptr);
    RegisterProperty('RoundTripDelay', 'Cardinal', iptr);
    RegisterProperty('BaseDate', 'TDateTime', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdTimeUDP(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('TIMEUDP_BASEDATE','LongInt').SetInt( 2);
  SIRegister_TIdTimeUDP(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdTimeUDPBaseDate_W(Self: TIdTimeUDP; const T: TDateTime);
begin Self.BaseDate := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdTimeUDPBaseDate_R(Self: TIdTimeUDP; var T: TDateTime);
begin T := Self.BaseDate; end;

(*----------------------------------------------------------------------------*)
procedure TIdTimeUDPRoundTripDelay_R(Self: TIdTimeUDP; var T: Cardinal);
begin T := Self.RoundTripDelay; end;

(*----------------------------------------------------------------------------*)
procedure TIdTimeUDPDateTime_R(Self: TIdTimeUDP; var T: TDateTime);
begin T := Self.DateTime; end;

(*----------------------------------------------------------------------------*)
procedure TIdTimeUDPDateTimeCard_R(Self: TIdTimeUDP; var T: Cardinal);
begin T := Self.DateTimeCard; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdTimeUDP(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdTimeUDP) do
  begin
    RegisterConstructor(@TIdTimeUDP.Create, 'Create');
    RegisterMethod(@TIdTimeUDP.SyncTime, 'SyncTime');
    RegisterPropertyHelper(@TIdTimeUDPDateTimeCard_R,nil,'DateTimeCard');
    RegisterPropertyHelper(@TIdTimeUDPDateTime_R,nil,'DateTime');
    RegisterPropertyHelper(@TIdTimeUDPRoundTripDelay_R,nil,'RoundTripDelay');
    RegisterPropertyHelper(@TIdTimeUDPBaseDate_R,@TIdTimeUDPBaseDate_W,'BaseDate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdTimeUDP(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdTimeUDP(CL);
end;

 
 
{ TPSImport_IdTimeUDP }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdTimeUDP.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdTimeUDP(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdTimeUDP.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdTimeUDP(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
