unit uPSI_IdMappedPortUDP;
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
  TPSImport_IdMappedPortUDP = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdMappedPortUDP(CL: TPSPascalCompiler);
procedure SIRegister_IdMappedPortUDP(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdMappedPortUDP(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdMappedPortUDP(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdUDPServer
  ,IdSocketHandle
  ,IdGlobal
  ,IdMappedPortUDP
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdMappedPortUDP]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdMappedPortUDP(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdUDPServer', 'TIdMappedPortUDP') do
  with CL.AddClassN(CL.FindClass('TIdUDPServer'),'TIdMappedPortUDP') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure DoUDPRead( AData : TStream; ABinding : TIdSocketHandle)');
    RegisterProperty('MappedHost', 'string', iptrw);
    RegisterProperty('MappedPort', 'Integer', iptrw);
    RegisterProperty('OnRequest', 'TNotifyEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdMappedPortUDP(CL: TPSPascalCompiler);
begin
  SIRegister_TIdMappedPortUDP(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdMappedPortUDPOnRequest_W(Self: TIdMappedPortUDP; const T: TNotifyEvent);
begin Self.OnRequest := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdMappedPortUDPOnRequest_R(Self: TIdMappedPortUDP; var T: TNotifyEvent);
begin T := Self.OnRequest; end;

(*----------------------------------------------------------------------------*)
procedure TIdMappedPortUDPMappedPort_W(Self: TIdMappedPortUDP; const T: Integer);
begin Self.MappedPort := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdMappedPortUDPMappedPort_R(Self: TIdMappedPortUDP; var T: Integer);
begin T := Self.MappedPort; end;

(*----------------------------------------------------------------------------*)
procedure TIdMappedPortUDPMappedHost_W(Self: TIdMappedPortUDP; const T: string);
begin Self.MappedHost := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdMappedPortUDPMappedHost_R(Self: TIdMappedPortUDP; var T: string);
begin T := Self.MappedHost; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdMappedPortUDP(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdMappedPortUDP) do
  begin
    RegisterConstructor(@TIdMappedPortUDP.Create, 'Create');
    RegisterMethod(@TIdMappedPortUDP.DoUDPRead, 'DoUDPRead');
    RegisterPropertyHelper(@TIdMappedPortUDPMappedHost_R,@TIdMappedPortUDPMappedHost_W,'MappedHost');
    RegisterPropertyHelper(@TIdMappedPortUDPMappedPort_R,@TIdMappedPortUDPMappedPort_W,'MappedPort');
    RegisterPropertyHelper(@TIdMappedPortUDPOnRequest_R,@TIdMappedPortUDPOnRequest_W,'OnRequest');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdMappedPortUDP(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdMappedPortUDP(CL);
end;

 
 
{ TPSImport_IdMappedPortUDP }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdMappedPortUDP.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdMappedPortUDP(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdMappedPortUDP.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdMappedPortUDP(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
