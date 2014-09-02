unit uPSI_uColorFunctions;
{
   from oscilloscope
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
  TPSImport_uColorFunctions = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_uColorFunctions(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_uColorFunctions_Routines(S: TPSExec);

procedure Register;

implementation


uses
   Graphics
  ,uColorFunctions
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_uColorFunctions]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_uColorFunctions(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TRGBType', 'record RedHex : string; GreenHex : string; BlueHex :'
   +' string; Red : integer; Green : integer; Blue : integer; end');
 CL.AddDelphiFunction('Function FadeColor( aColor : Longint; aFade : integer) : Tcolor');
 CL.AddDelphiFunction('Function CountColor( aColor : Tcolor; CompareColor : Tcolor; AdjustVale : integer) : Tcolor');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_uColorFunctions_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@FadeColor, 'FadeColor', cdRegister);
 S.RegisterDelphiFunction(@CountColor, 'CountColor', cdRegister);
end;

 
 
{ TPSImport_uColorFunctions }
(*----------------------------------------------------------------------------*)
procedure TPSImport_uColorFunctions.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_uColorFunctions(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_uColorFunctions.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_uColorFunctions(ri);
  RIRegister_uColorFunctions_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
