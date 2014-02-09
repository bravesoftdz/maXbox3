unit uPSI_SockApp;
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
  TPSImport_SockApp = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TWebAppSockObjectFactory(CL: TPSPascalCompiler);
procedure SIRegister_SockApp(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TWebAppSockObjectFactory(CL: TPSRuntimeClassImporter);
procedure RIRegister_SockApp(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   SockHTTP
  ,IdTCPConnection
  ,IdTCPServer
  ,SockApp
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_SockApp]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TWebAppSockObjectFactory(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TWebAppSockObjectFactory') do
  with CL.AddClassN(CL.FindClass('TObject'),'TWebAppSockObjectFactory') do begin
    RegisterMethod('Procedure UpdateRegistry( Register : Boolean)');
    RegisterMethod('Constructor Create( const ClassName : string)');
    RegisterProperty('ProgID', 'string', iptr);
    RegisterProperty('StartMode', 'TStartMode2', iptr);
    RegisterProperty('FileName', 'string', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_SockApp(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TStartMode2', '( smNormal, smRegServer, smUnregServer )');
  SIRegister_TWebAppSockObjectFactory(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TWebAppSockObjectFactoryFileName_R(Self: TWebAppSockObjectFactory; var T: string);
begin T := Self.FileName; end;

(*----------------------------------------------------------------------------*)
procedure TWebAppSockObjectFactoryStartMode_R(Self: TWebAppSockObjectFactory; var T: TStartMode);
begin T := Self.StartMode; end;

(*----------------------------------------------------------------------------*)
procedure TWebAppSockObjectFactoryProgID_R(Self: TWebAppSockObjectFactory; var T: string);
begin T := Self.ProgID; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TWebAppSockObjectFactory(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TWebAppSockObjectFactory) do begin
    RegisterMethod(@TWebAppSockObjectFactory.UpdateRegistry, 'UpdateRegistry');
    RegisterConstructor(@TWebAppSockObjectFactory.Create, 'Create');
    RegisterPropertyHelper(@TWebAppSockObjectFactoryProgID_R,nil,'ProgID');
    RegisterPropertyHelper(@TWebAppSockObjectFactoryStartMode_R,nil,'StartMode');
    RegisterPropertyHelper(@TWebAppSockObjectFactoryFileName_R,nil,'FileName');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_SockApp(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TWebAppSockObjectFactory(CL);
end;

 
 
{ TPSImport_SockApp }
(*----------------------------------------------------------------------------*)
procedure TPSImport_SockApp.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_SockApp(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_SockApp.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_SockApp(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.