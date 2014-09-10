unit uPSI_kcMapViewerGLGeoNames;
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
  TPSImport_kcMapViewerGLGeoNames = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TMVGLGeoNames(CL: TPSPascalCompiler);
procedure SIRegister_kcMapViewerGLGeoNames(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TMVGLGeoNames(CL: TPSRuntimeClassImporter);
procedure RIRegister_kcMapViewerGLGeoNames(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   kcMapViewer
  ,kcMapViewerGLGeoNames
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_kcMapViewerGLGeoNames]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TMVGLGeoNames(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomGeolocationEngine', 'TMVGLGeoNames') do
  with CL.AddClassN(CL.FindClass('TCustomGeolocationEngine'),'TMVGLGeoNames') do
  begin
    RegisterProperty('LocationName', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_kcMapViewerGLGeoNames(CL: TPSPascalCompiler);
begin
  SIRegister_TMVGLGeoNames(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TMVGLGeoNamesLocationName_W(Self: TMVGLGeoNames; const T: string);
begin Self.LocationName := T; end;

(*----------------------------------------------------------------------------*)
procedure TMVGLGeoNamesLocationName_R(Self: TMVGLGeoNames; var T: string);
begin T := Self.LocationName; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TMVGLGeoNames(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TMVGLGeoNames) do
  begin
    RegisterPropertyHelper(@TMVGLGeoNamesLocationName_R,@TMVGLGeoNamesLocationName_W,'LocationName');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_kcMapViewerGLGeoNames(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TMVGLGeoNames(CL);
end;

 
 
{ TPSImport_kcMapViewerGLGeoNames }
(*----------------------------------------------------------------------------*)
procedure TPSImport_kcMapViewerGLGeoNames.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_kcMapViewerGLGeoNames(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_kcMapViewerGLGeoNames.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_kcMapViewerGLGeoNames(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
