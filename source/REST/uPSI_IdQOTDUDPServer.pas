unit uPSI_IdQOTDUDPServer;
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
  TPSImport_IdQOTDUDPServer = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdQotdUDPServer(CL: TPSPascalCompiler);
procedure SIRegister_IdQOTDUDPServer(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdQotdUDPServer(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdQOTDUDPServer(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdAssignedNumbers
  ,IdSocketHandle
  ,IdUDPBase
  ,IdUDPServer
  ,IdQOTDUDPServer
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdQOTDUDPServer]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdQotdUDPServer(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdUDPServer', 'TIdQotdUDPServer') do
  with CL.AddClassN(CL.FindClass('TIdUDPServer'),'TIdQotdUDPServer') do
  begin
    RegisterMethod('Constructor Create( axOwner : TComponent)');
    RegisterProperty('OnCommandQOTD', 'TIdQotdUDPGetEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdQOTDUDPServer(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TIdQotdUDPGetEvent', 'Procedure ( ABinding : TIdSocketHandle; va'
   +'r AQuote : String)');
  SIRegister_TIdQotdUDPServer(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdQotdUDPServerOnCommandQOTD_W(Self: TIdQotdUDPServer; const T: TIdQotdUDPGetEvent);
begin Self.OnCommandQOTD := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdQotdUDPServerOnCommandQOTD_R(Self: TIdQotdUDPServer; var T: TIdQotdUDPGetEvent);
begin T := Self.OnCommandQOTD; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdQotdUDPServer(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdQotdUDPServer) do
  begin
    RegisterConstructor(@TIdQotdUDPServer.Create, 'Create');
    RegisterPropertyHelper(@TIdQotdUDPServerOnCommandQOTD_R,@TIdQotdUDPServerOnCommandQOTD_W,'OnCommandQOTD');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdQOTDUDPServer(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdQotdUDPServer(CL);
end;

 
 
{ TPSImport_IdQOTDUDPServer }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdQOTDUDPServer.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdQOTDUDPServer(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdQOTDUDPServer.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdQOTDUDPServer(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
