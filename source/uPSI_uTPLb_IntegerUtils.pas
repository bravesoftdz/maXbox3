unit uPSI_uTPLb_IntegerUtils;
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
  TPSImport_uTPLb_IntegerUtils = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_uTPLb_IntegerUtils(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_uTPLb_IntegerUtils_Routines(S: TPSExec);

procedure Register;

implementation


uses
   uTPLb_IntegerUtils
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_uTPLb_IntegerUtils]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_uTPLb_IntegerUtils(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('uint64', 'int64');
  CL.AddTypeS('uint32', 'cardinal');
  CL.AddTypeS('uint16', 'word');
 CL.AddDelphiFunction('Function Add_uint64_WithCarry( x, y : uint64; var Carry : Boolean) : uint64');
 CL.AddDelphiFunction('Function Add_uint32_WithCarry( x, y : uint32; var Carry : Boolean) : uint32');
 CL.AddDelphiFunction('Function Subtract_uint64_WithBorrow( x, y : uint64; var Borrow : Boolean) : uint64');
 CL.AddDelphiFunction('Function Subtract_uint32_WithBorrow( x, y : uint32; var Borrow : Boolean) : uint32');
 CL.AddDelphiFunction('Function BitCount_8( Value : byte) : integer');
 CL.AddDelphiFunction('Function BitCount_16( Value : uint16) : integer');
 CL.AddDelphiFunction('Function BitCount_32( Value : uint32) : integer');
 CL.AddDelphiFunction('Function BitCount_64( Value : uint64) : integer');
 CL.AddDelphiFunction('Function CountSetBits_64( Value : uint64) : integer');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_uTPLb_IntegerUtils_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@Add_uint64_WithCarry, 'Add_uint64_WithCarry', cdRegister);
 S.RegisterDelphiFunction(@Add_uint32_WithCarry, 'Add_uint32_WithCarry', cdRegister);
 S.RegisterDelphiFunction(@Subtract_uint64_WithBorrow, 'Subtract_uint64_WithBorrow', cdRegister);
 S.RegisterDelphiFunction(@Subtract_uint32_WithBorrow, 'Subtract_uint32_WithBorrow', cdRegister);
 S.RegisterDelphiFunction(@BitCount_8, 'BitCount_8', cdRegister);
 S.RegisterDelphiFunction(@BitCount_16, 'BitCount_16', cdRegister);
 S.RegisterDelphiFunction(@BitCount_32, 'BitCount_32', cdRegister);
 S.RegisterDelphiFunction(@BitCount_64, 'BitCount_64', cdRegister);
 S.RegisterDelphiFunction(@CountSetBits_64, 'CountSetBits_64', cdRegister);
end;

 
 
{ TPSImport_uTPLb_IntegerUtils }
(*----------------------------------------------------------------------------*)
procedure TPSImport_uTPLb_IntegerUtils.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_uTPLb_IntegerUtils(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_uTPLb_IntegerUtils.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  //RIRegister_uTPLb_IntegerUtils(ri);
  RIRegister_uTPLb_IntegerUtils_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.