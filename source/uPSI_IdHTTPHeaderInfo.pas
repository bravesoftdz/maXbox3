unit uPSI_IdHTTPHeaderInfo;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
maybe for proxyparams
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
  TPSImport_IdHTTPHeaderInfo = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdResponseHeaderInfo(CL: TPSPascalCompiler);
procedure SIRegister_TIdRequestHeaderInfo(CL: TPSPascalCompiler);
procedure SIRegister_TIdProxyConnectionInfo(CL: TPSPascalCompiler);
procedure SIRegister_TIdEntityHeaderInfo(CL: TPSPascalCompiler);
procedure SIRegister_IdHTTPHeaderInfo(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdResponseHeaderInfo(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdRequestHeaderInfo(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdProxyConnectionInfo(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdEntityHeaderInfo(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdHTTPHeaderInfo(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdAuthentication
  ,IdGlobal
  ,IdHeaderList
  ,IdHTTPHeaderInfo
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdHTTPHeaderInfo]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdResponseHeaderInfo(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdEntityHeaderInfo', 'TIdResponseHeaderInfo') do
  with CL.AddClassN(CL.FindClass('TIdEntityHeaderInfo'),'TIdResponseHeaderInfo') do
  begin
    RegisterProperty('Location', 'string', iptrw);
    RegisterProperty('ProxyConnection', 'string', iptrw);
    RegisterProperty('ProxyAuthenticate', 'TIdHeaderList', iptrw);
    RegisterProperty('Server', 'string', iptrw);
    RegisterProperty('WWWAuthenticate', 'TIdHeaderList', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdRequestHeaderInfo(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdEntityHeaderInfo', 'TIdRequestHeaderInfo') do
  with CL.AddClassN(CL.FindClass('TIdEntityHeaderInfo'),'TIdRequestHeaderInfo') do begin
    RegisterProperty('Authentication', 'TIdAuthentication', iptrw);
    RegisterProperty('Accept', 'string', iptrw);
    RegisterProperty('AcceptCharSet', 'string', iptrw);
    RegisterProperty('AcceptEncoding', 'string', iptrw);
    RegisterProperty('AcceptLanguage', 'string', iptrw);
    RegisterProperty('BasicAuthentication', 'boolean', iptrw);
    RegisterProperty('Host', 'string', iptrw);
    RegisterProperty('From', 'string', iptrw);
    RegisterProperty('Password', 'String', iptrw);
    RegisterProperty('Referer', 'string', iptrw);
    RegisterProperty('UserAgent', 'string', iptrw);
    RegisterProperty('Username', 'String', iptrw);
    RegisterProperty('ProxyConnection', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdProxyConnectionInfo(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPersistent', 'TIdProxyConnectionInfo') do
  with CL.AddClassN(CL.FindClass('TPersistent'),'TIdProxyConnectionInfo') do begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure SetHeaders( Headers : TIdHeaderList)');
    RegisterProperty('Authentication', 'TIdAuthentication', iptrw);
    RegisterProperty('BasicAuthentication', 'boolean', iptrw);
    RegisterProperty('ProxyPassword', 'string', iptrw);
    RegisterProperty('ProxyPort', 'Integer', iptrw);
    RegisterProperty('ProxyServer', 'string', iptrw);
    RegisterProperty('ProxyUsername', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdEntityHeaderInfo(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPersistent', 'TIdEntityHeaderInfo') do
  with CL.AddClassN(CL.FindClass('TPersistent'),'TIdEntityHeaderInfo') do begin
    RegisterMethod('Procedure Clear');
    RegisterMethod('Constructor Create');
    RegisterProperty('HasContentLength', 'Boolean', iptr);
    RegisterProperty('RawHeaders', 'TIdHeaderList', iptr);
    RegisterProperty('CacheControl', 'String', iptrw);
    RegisterProperty('Connection', 'string', iptrw);
    RegisterProperty('ContentEncoding', 'string', iptrw);
    RegisterProperty('ContentLanguage', 'string', iptrw);
    RegisterProperty('ContentLength', 'Integer', iptrw);
    RegisterProperty('ContentRangeEnd', 'Cardinal', iptrw);
    RegisterProperty('ContentRangeStart', 'Cardinal', iptrw);
    RegisterProperty('ContentType', 'string', iptrw);
    RegisterProperty('ContentVersion', 'string', iptrw);
    RegisterProperty('CustomHeaders', 'TIdHeaderList', iptrw);
    RegisterProperty('Date', 'TDateTime', iptrw);
    RegisterProperty('Expires', 'TDateTime', iptrw);
    RegisterProperty('LastModified', 'TDateTime', iptrw);
    RegisterProperty('Pragma', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdHTTPHeaderInfo(CL: TPSPascalCompiler);
begin
  SIRegister_TIdEntityHeaderInfo(CL);
  SIRegister_TIdProxyConnectionInfo(CL);
  SIRegister_TIdRequestHeaderInfo(CL);
  SIRegister_TIdResponseHeaderInfo(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoWWWAuthenticate_W(Self: TIdResponseHeaderInfo; const T: TIdHeaderList);
begin Self.WWWAuthenticate := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoWWWAuthenticate_R(Self: TIdResponseHeaderInfo; var T: TIdHeaderList);
begin T := Self.WWWAuthenticate; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoServer_W(Self: TIdResponseHeaderInfo; const T: string);
begin Self.Server := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoServer_R(Self: TIdResponseHeaderInfo; var T: string);
begin T := Self.Server; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoProxyAuthenticate_W(Self: TIdResponseHeaderInfo; const T: TIdHeaderList);
begin Self.ProxyAuthenticate := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoProxyAuthenticate_R(Self: TIdResponseHeaderInfo; var T: TIdHeaderList);
begin T := Self.ProxyAuthenticate; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoProxyConnection_W(Self: TIdResponseHeaderInfo; const T: string);
begin Self.ProxyConnection := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoProxyConnection_R(Self: TIdResponseHeaderInfo; var T: string);
begin T := Self.ProxyConnection; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoLocation_W(Self: TIdResponseHeaderInfo; const T: string);
begin Self.Location := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdResponseHeaderInfoLocation_R(Self: TIdResponseHeaderInfo; var T: string);
begin T := Self.Location; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoProxyConnection_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.ProxyConnection := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoProxyConnection_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.ProxyConnection; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoUsername_W(Self: TIdRequestHeaderInfo; const T: String);
begin Self.Username := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoUsername_R(Self: TIdRequestHeaderInfo; var T: String);
begin T := Self.Username; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoUserAgent_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.UserAgent := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoUserAgent_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.UserAgent; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoReferer_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.Referer := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoReferer_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.Referer; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoPassword_W(Self: TIdRequestHeaderInfo; const T: String);
begin Self.Password := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoPassword_R(Self: TIdRequestHeaderInfo; var T: String);
begin T := Self.Password; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoFrom_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.From := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoFrom_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.From; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoHost_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.Host := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoHost_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.Host; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoBasicAuthentication_W(Self: TIdRequestHeaderInfo; const T: boolean);
begin Self.BasicAuthentication := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoBasicAuthentication_R(Self: TIdRequestHeaderInfo; var T: boolean);
begin T := Self.BasicAuthentication; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAcceptLanguage_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.AcceptLanguage := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAcceptLanguage_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.AcceptLanguage; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAcceptEncoding_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.AcceptEncoding := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAcceptEncoding_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.AcceptEncoding; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAcceptCharSet_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.AcceptCharSet := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAcceptCharSet_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.AcceptCharSet; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAccept_W(Self: TIdRequestHeaderInfo; const T: string);
begin Self.Accept := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAccept_R(Self: TIdRequestHeaderInfo; var T: string);
begin T := Self.Accept; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAuthentication_W(Self: TIdRequestHeaderInfo; const T: TIdAuthentication);
begin Self.Authentication := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdRequestHeaderInfoAuthentication_R(Self: TIdRequestHeaderInfo; var T: TIdAuthentication);
begin T := Self.Authentication; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyUsername_W(Self: TIdProxyConnectionInfo; const T: string);
begin Self.ProxyUsername := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyUsername_R(Self: TIdProxyConnectionInfo; var T: string);
begin T := Self.ProxyUsername; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyServer_W(Self: TIdProxyConnectionInfo; const T: string);
begin Self.ProxyServer := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyServer_R(Self: TIdProxyConnectionInfo; var T: string);
begin T := Self.ProxyServer; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyPort_W(Self: TIdProxyConnectionInfo; const T: Integer);
begin Self.ProxyPort := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyPort_R(Self: TIdProxyConnectionInfo; var T: Integer);
begin T := Self.ProxyPort; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyPassword_W(Self: TIdProxyConnectionInfo; const T: string);
begin Self.ProxyPassword := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoProxyPassword_R(Self: TIdProxyConnectionInfo; var T: string);
begin T := Self.ProxyPassword; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoBasicAuthentication_W(Self: TIdProxyConnectionInfo; const T: boolean);
begin Self.BasicAuthentication := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoBasicAuthentication_R(Self: TIdProxyConnectionInfo; var T: boolean);
begin T := Self.BasicAuthentication; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoAuthentication_W(Self: TIdProxyConnectionInfo; const T: TIdAuthentication);
begin Self.Authentication := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdProxyConnectionInfoAuthentication_R(Self: TIdProxyConnectionInfo; var T: TIdAuthentication);
begin T := Self.Authentication; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoPragma_W(Self: TIdEntityHeaderInfo; const T: string);
begin Self.Pragma := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoPragma_R(Self: TIdEntityHeaderInfo; var T: string);
begin T := Self.Pragma; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoLastModified_W(Self: TIdEntityHeaderInfo; const T: TDateTime);
begin Self.LastModified := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoLastModified_R(Self: TIdEntityHeaderInfo; var T: TDateTime);
begin T := Self.LastModified; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoExpires_W(Self: TIdEntityHeaderInfo; const T: TDateTime);
begin Self.Expires := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoExpires_R(Self: TIdEntityHeaderInfo; var T: TDateTime);
begin T := Self.Expires; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoDate_W(Self: TIdEntityHeaderInfo; const T: TDateTime);
begin Self.Date := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoDate_R(Self: TIdEntityHeaderInfo; var T: TDateTime);
begin T := Self.Date; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoCustomHeaders_W(Self: TIdEntityHeaderInfo; const T: TIdHeaderList);
begin Self.CustomHeaders := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoCustomHeaders_R(Self: TIdEntityHeaderInfo; var T: TIdHeaderList);
begin T := Self.CustomHeaders; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentVersion_W(Self: TIdEntityHeaderInfo; const T: string);
begin Self.ContentVersion := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentVersion_R(Self: TIdEntityHeaderInfo; var T: string);
begin T := Self.ContentVersion; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentType_W(Self: TIdEntityHeaderInfo; const T: string);
begin Self.ContentType := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentType_R(Self: TIdEntityHeaderInfo; var T: string);
begin T := Self.ContentType; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentRangeStart_W(Self: TIdEntityHeaderInfo; const T: Cardinal);
begin Self.ContentRangeStart := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentRangeStart_R(Self: TIdEntityHeaderInfo; var T: Cardinal);
begin T := Self.ContentRangeStart; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentRangeEnd_W(Self: TIdEntityHeaderInfo; const T: Cardinal);
begin Self.ContentRangeEnd := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentRangeEnd_R(Self: TIdEntityHeaderInfo; var T: Cardinal);
begin T := Self.ContentRangeEnd; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentLength_W(Self: TIdEntityHeaderInfo; const T: Integer);
begin Self.ContentLength := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentLength_R(Self: TIdEntityHeaderInfo; var T: Integer);
begin T := Self.ContentLength; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentLanguage_W(Self: TIdEntityHeaderInfo; const T: string);
begin Self.ContentLanguage := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentLanguage_R(Self: TIdEntityHeaderInfo; var T: string);
begin T := Self.ContentLanguage; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentEncoding_W(Self: TIdEntityHeaderInfo; const T: string);
begin Self.ContentEncoding := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoContentEncoding_R(Self: TIdEntityHeaderInfo; var T: string);
begin T := Self.ContentEncoding; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoConnection_W(Self: TIdEntityHeaderInfo; const T: string);
begin Self.Connection := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoConnection_R(Self: TIdEntityHeaderInfo; var T: string);
begin T := Self.Connection; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoCacheControl_W(Self: TIdEntityHeaderInfo; const T: String);
begin Self.CacheControl := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoCacheControl_R(Self: TIdEntityHeaderInfo; var T: String);
begin T := Self.CacheControl; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoRawHeaders_R(Self: TIdEntityHeaderInfo; var T: TIdHeaderList);
begin T := Self.RawHeaders; end;

(*----------------------------------------------------------------------------*)
procedure TIdEntityHeaderInfoHasContentLength_R(Self: TIdEntityHeaderInfo; var T: Boolean);
begin T := Self.HasContentLength; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdResponseHeaderInfo(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdResponseHeaderInfo) do
  begin
    RegisterPropertyHelper(@TIdResponseHeaderInfoLocation_R,@TIdResponseHeaderInfoLocation_W,'Location');
    RegisterPropertyHelper(@TIdResponseHeaderInfoProxyConnection_R,@TIdResponseHeaderInfoProxyConnection_W,'ProxyConnection');
    RegisterPropertyHelper(@TIdResponseHeaderInfoProxyAuthenticate_R,@TIdResponseHeaderInfoProxyAuthenticate_W,'ProxyAuthenticate');
    RegisterPropertyHelper(@TIdResponseHeaderInfoServer_R,@TIdResponseHeaderInfoServer_W,'Server');
    RegisterPropertyHelper(@TIdResponseHeaderInfoWWWAuthenticate_R,@TIdResponseHeaderInfoWWWAuthenticate_W,'WWWAuthenticate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdRequestHeaderInfo(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdRequestHeaderInfo) do
  begin
    RegisterPropertyHelper(@TIdRequestHeaderInfoAuthentication_R,@TIdRequestHeaderInfoAuthentication_W,'Authentication');
    RegisterPropertyHelper(@TIdRequestHeaderInfoAccept_R,@TIdRequestHeaderInfoAccept_W,'Accept');
    RegisterPropertyHelper(@TIdRequestHeaderInfoAcceptCharSet_R,@TIdRequestHeaderInfoAcceptCharSet_W,'AcceptCharSet');
    RegisterPropertyHelper(@TIdRequestHeaderInfoAcceptEncoding_R,@TIdRequestHeaderInfoAcceptEncoding_W,'AcceptEncoding');
    RegisterPropertyHelper(@TIdRequestHeaderInfoAcceptLanguage_R,@TIdRequestHeaderInfoAcceptLanguage_W,'AcceptLanguage');
    RegisterPropertyHelper(@TIdRequestHeaderInfoBasicAuthentication_R,@TIdRequestHeaderInfoBasicAuthentication_W,'BasicAuthentication');
    RegisterPropertyHelper(@TIdRequestHeaderInfoHost_R,@TIdRequestHeaderInfoHost_W,'Host');
    RegisterPropertyHelper(@TIdRequestHeaderInfoFrom_R,@TIdRequestHeaderInfoFrom_W,'From');
    RegisterPropertyHelper(@TIdRequestHeaderInfoPassword_R,@TIdRequestHeaderInfoPassword_W,'Password');
    RegisterPropertyHelper(@TIdRequestHeaderInfoReferer_R,@TIdRequestHeaderInfoReferer_W,'Referer');
    RegisterPropertyHelper(@TIdRequestHeaderInfoUserAgent_R,@TIdRequestHeaderInfoUserAgent_W,'UserAgent');
    RegisterPropertyHelper(@TIdRequestHeaderInfoUsername_R,@TIdRequestHeaderInfoUsername_W,'Username');
    RegisterPropertyHelper(@TIdRequestHeaderInfoProxyConnection_R,@TIdRequestHeaderInfoProxyConnection_W,'ProxyConnection');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdProxyConnectionInfo(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdProxyConnectionInfo) do
  begin
    RegisterConstructor(@TIdProxyConnectionInfo.Create, 'Create');
    RegisterMethod(@TIdProxyConnectionInfo.Clear, 'Clear');
    RegisterMethod(@TIdProxyConnectionInfo.SetHeaders, 'SetHeaders');
    RegisterPropertyHelper(@TIdProxyConnectionInfoAuthentication_R,@TIdProxyConnectionInfoAuthentication_W,'Authentication');
    RegisterPropertyHelper(@TIdProxyConnectionInfoBasicAuthentication_R,@TIdProxyConnectionInfoBasicAuthentication_W,'BasicAuthentication');
    RegisterPropertyHelper(@TIdProxyConnectionInfoProxyPassword_R,@TIdProxyConnectionInfoProxyPassword_W,'ProxyPassword');
    RegisterPropertyHelper(@TIdProxyConnectionInfoProxyPort_R,@TIdProxyConnectionInfoProxyPort_W,'ProxyPort');
    RegisterPropertyHelper(@TIdProxyConnectionInfoProxyServer_R,@TIdProxyConnectionInfoProxyServer_W,'ProxyServer');
    RegisterPropertyHelper(@TIdProxyConnectionInfoProxyUsername_R,@TIdProxyConnectionInfoProxyUsername_W,'ProxyUsername');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdEntityHeaderInfo(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdEntityHeaderInfo) do
  begin
    RegisterVirtualMethod(@TIdEntityHeaderInfo.Clear, 'Clear');
    RegisterVirtualConstructor(@TIdEntityHeaderInfo.Create, 'Create');
    RegisterPropertyHelper(@TIdEntityHeaderInfoHasContentLength_R,nil,'HasContentLength');
    RegisterPropertyHelper(@TIdEntityHeaderInfoRawHeaders_R,nil,'RawHeaders');
    RegisterPropertyHelper(@TIdEntityHeaderInfoCacheControl_R,@TIdEntityHeaderInfoCacheControl_W,'CacheControl');
    RegisterPropertyHelper(@TIdEntityHeaderInfoConnection_R,@TIdEntityHeaderInfoConnection_W,'Connection');
    RegisterPropertyHelper(@TIdEntityHeaderInfoContentEncoding_R,@TIdEntityHeaderInfoContentEncoding_W,'ContentEncoding');
    RegisterPropertyHelper(@TIdEntityHeaderInfoContentLanguage_R,@TIdEntityHeaderInfoContentLanguage_W,'ContentLanguage');
    RegisterPropertyHelper(@TIdEntityHeaderInfoContentLength_R,@TIdEntityHeaderInfoContentLength_W,'ContentLength');
    RegisterPropertyHelper(@TIdEntityHeaderInfoContentRangeEnd_R,@TIdEntityHeaderInfoContentRangeEnd_W,'ContentRangeEnd');
    RegisterPropertyHelper(@TIdEntityHeaderInfoContentRangeStart_R,@TIdEntityHeaderInfoContentRangeStart_W,'ContentRangeStart');
    RegisterPropertyHelper(@TIdEntityHeaderInfoContentType_R,@TIdEntityHeaderInfoContentType_W,'ContentType');
    RegisterPropertyHelper(@TIdEntityHeaderInfoContentVersion_R,@TIdEntityHeaderInfoContentVersion_W,'ContentVersion');
    RegisterPropertyHelper(@TIdEntityHeaderInfoCustomHeaders_R,@TIdEntityHeaderInfoCustomHeaders_W,'CustomHeaders');
    RegisterPropertyHelper(@TIdEntityHeaderInfoDate_R,@TIdEntityHeaderInfoDate_W,'Date');
    RegisterPropertyHelper(@TIdEntityHeaderInfoExpires_R,@TIdEntityHeaderInfoExpires_W,'Expires');
    RegisterPropertyHelper(@TIdEntityHeaderInfoLastModified_R,@TIdEntityHeaderInfoLastModified_W,'LastModified');
    RegisterPropertyHelper(@TIdEntityHeaderInfoPragma_R,@TIdEntityHeaderInfoPragma_W,'Pragma');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdHTTPHeaderInfo(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdEntityHeaderInfo(CL);
  RIRegister_TIdProxyConnectionInfo(CL);
  RIRegister_TIdRequestHeaderInfo(CL);
  RIRegister_TIdResponseHeaderInfo(CL);
end;

 
 
{ TPSImport_IdHTTPHeaderInfo }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHTTPHeaderInfo.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdHTTPHeaderInfo(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHTTPHeaderInfo.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdHTTPHeaderInfo(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
