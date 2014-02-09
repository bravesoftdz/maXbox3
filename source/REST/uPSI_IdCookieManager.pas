unit uPSI_IdCookieManager;
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
  TPSImport_IdCookieManager = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdCookieManager(CL: TPSPascalCompiler);
procedure SIRegister_IdCookieManager(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdCookieManager(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdCookieManager(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdBaseComponent
  ,IdCookie
  ,IdGlobal
  ,IdURI
  ,IdCookieManager
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdCookieManager]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdCookieManager(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdBaseComponent', 'TIdCookieManager') do
  with CL.AddClassN(CL.FindClass('TIdBaseComponent'),'TIdCookieManager') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure AddCookie( ACookie, AHost : String)');
    RegisterMethod('Procedure AddCookie2( ACookie, AHost : String)');
    RegisterMethod('Function GenerateCookieList( URL : TIdURI; SecureConnection : Boolean) : String');
    RegisterProperty('CookieCollection', 'TIdCookies', iptr);
    RegisterMethod('Procedure DestroyCookieList');
    RegisterProperty('OnCreate', 'TOnCreateEvent', iptrw);
    RegisterProperty('OnDestroy', 'TOnDestroyEvent', iptrw);
    RegisterProperty('OnNewCookie', 'TOnNewCookieEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdCookieManager(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TOnNewCookieEvent', 'Procedure ( ASender : TObject; ACookie : TI'
   +'dCookieRFC2109; var VAccept : Boolean)');
  CL.AddTypeS('TOnManagerEvent', 'Procedure ( ASender : TObject; ACookieCollect'
   +'ion : TIdCookies)');
  CL.AddTypeS('TOnCreateEvent', 'TOnManagerEvent');
  CL.AddTypeS('TOnDestroyEvent', 'TOnManagerEvent');
  SIRegister_TIdCookieManager(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdCookieManagerOnNewCookie_W(Self: TIdCookieManager; const T: TOnNewCookieEvent);
begin Self.OnNewCookie := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdCookieManagerOnNewCookie_R(Self: TIdCookieManager; var T: TOnNewCookieEvent);
begin T := Self.OnNewCookie; end;

(*----------------------------------------------------------------------------*)
procedure TIdCookieManagerOnDestroy_W(Self: TIdCookieManager; const T: TOnDestroyEvent);
begin Self.OnDestroy := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdCookieManagerOnDestroy_R(Self: TIdCookieManager; var T: TOnDestroyEvent);
begin T := Self.OnDestroy; end;

(*----------------------------------------------------------------------------*)
procedure TIdCookieManagerOnCreate_W(Self: TIdCookieManager; const T: TOnCreateEvent);
begin Self.OnCreate := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdCookieManagerOnCreate_R(Self: TIdCookieManager; var T: TOnCreateEvent);
begin T := Self.OnCreate; end;

(*----------------------------------------------------------------------------*)
procedure TIdCookieManagerCookieCollection_R(Self: TIdCookieManager; var T: TIdCookies);
begin T := Self.CookieCollection; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdCookieManager(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdCookieManager) do
  begin
    RegisterConstructor(@TIdCookieManager.Create, 'Create');
    RegisterMethod(@TIdCookieManager.AddCookie, 'AddCookie');
    RegisterMethod(@TIdCookieManager.AddCookie2, 'AddCookie2');
    RegisterMethod(@TIdCookieManager.GenerateCookieList, 'GenerateCookieList');
    RegisterPropertyHelper(@TIdCookieManagerCookieCollection_R,nil,'CookieCollection');
    RegisterMethod(@TIdCookieManager.DestroyCookieList, 'DestroyCookieList');
    RegisterPropertyHelper(@TIdCookieManagerOnCreate_R,@TIdCookieManagerOnCreate_W,'OnCreate');
    RegisterPropertyHelper(@TIdCookieManagerOnDestroy_R,@TIdCookieManagerOnDestroy_W,'OnDestroy');
    RegisterPropertyHelper(@TIdCookieManagerOnNewCookie_R,@TIdCookieManagerOnNewCookie_W,'OnNewCookie');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdCookieManager(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdCookieManager(CL);
end;

 
 
{ TPSImport_IdCookieManager }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdCookieManager.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdCookieManager(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdCookieManager.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdCookieManager(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
