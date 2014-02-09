unit uPSI_DbxDataGenerator;
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
  TPSImport_DbxDataGenerator = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TDbxDataGenerator(CL: TPSPascalCompiler);
procedure SIRegister_DbxDataGenerator(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TDbxDataGenerator(CL: TPSRuntimeClassImporter);
procedure RIRegister_DbxDataGenerator(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   DbxCustomDataGenerator
  ,DBXCommon
  ,DBXMetaDataProvider
  ,SqlTimSt
  ,FMTBcd
  ,SQLExpr
  ,DbxDataGenerator
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_DbxDataGenerator]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TDbxDataGenerator(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TDBXCustomDataGenerator', 'TDbxDataGenerator') do
  with CL.AddClassN(CL.FindClass('TDBXCustomDataGenerator'),'TDbxDataGenerator') do
  begin
    RegisterMethod('Procedure ValidateAnsiString( Value1, Value2 : String)');
    RegisterMethod('Procedure ValidateWideString( Value1, Value2 : String)');
    RegisterMethod('Procedure ValidateBoolean( Value1, Value2 : Boolean)');
    RegisterMethod('Procedure ValidateInt64( Value1, Value2 : Int64)');
    RegisterMethod('Procedure ValidateDouble( Value1, Value2 : Double)');
    RegisterMethod('Procedure ValidateBcd( Value1, Value2 : TBcd)');
    RegisterMethod('Procedure ValidateDate( Value1, Value2 : TDBXDate)');
    RegisterMethod('Procedure ValidateTime( Value1, Value2 : TDBXTime)');
    RegisterMethod('Procedure ValidateTimestamp( Value1, Value2 : TSQLTimeStamp)');
    RegisterMethod('Procedure ValidateBytes( Value1, Value2 : TBytes)');
    RegisterMethod('Function BytesEquals( const Value1 : TBytes; const Value2 : TBytes; Count : Integer) : Boolean');
    RegisterMethod('Function ValidateRow( const Reader : TDBXReader; Row : Integer) : Boolean;');
    RegisterMethod('Function ValidateRow1( const SQLQuery : TSQLQuery; Row : Integer) : Boolean;');
    RegisterMethod('Procedure ValidateParameters( const Command : TDBXCommand; Row : Integer)');
    RegisterMethod('Procedure AddParameters( const Command : TDBXCommand);');
    RegisterMethod('Procedure AddParameters1( const SQLQuery : TSQLQuery);');
    RegisterMethod('Procedure SetInsertParameters( const Command : TDBXCommand; Row : Integer);');
    RegisterMethod('Procedure SetInsertParameters1( const SQLQuery : TSQLQuery; Row : Integer);');
    RegisterProperty('IsFractionsSupported', 'Boolean', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_DbxDataGenerator(CL: TPSPascalCompiler);
begin
  SIRegister_TDbxDataGenerator(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TDbxDataGeneratorIsFractionsSupported_R(Self: TDbxDataGenerator; var T: Boolean);
begin T := Self.IsFractionsSupported; end;

(*----------------------------------------------------------------------------*)
Procedure TDbxDataGeneratorSetInsertParameters1_P(Self: TDbxDataGenerator;  const SQLQuery : TSQLQuery; Row : Integer);
Begin Self.SetInsertParameters(SQLQuery, Row); END;

(*----------------------------------------------------------------------------*)
Procedure TDbxDataGeneratorSetInsertParameters_P(Self: TDbxDataGenerator;  const Command : TDBXCommand; Row : Integer);
Begin Self.SetInsertParameters(Command, Row); END;

(*----------------------------------------------------------------------------*)
Procedure TDbxDataGeneratorAddParameters1_P(Self: TDbxDataGenerator;  const SQLQuery : TSQLQuery);
Begin Self.AddParameters(SQLQuery); END;

(*----------------------------------------------------------------------------*)
Procedure TDbxDataGeneratorAddParameters_P(Self: TDbxDataGenerator;  const Command : TDBXCommand);
Begin Self.AddParameters(Command); END;

(*----------------------------------------------------------------------------*)
Function TDbxDataGeneratorValidateRow1_P(Self: TDbxDataGenerator;  const SQLQuery : TSQLQuery; Row : Integer) : Boolean;
Begin Result := Self.ValidateRow(SQLQuery, Row); END;

(*----------------------------------------------------------------------------*)
Function TDbxDataGeneratorValidateRow_P(Self: TDbxDataGenerator;  const Reader : TDBXReader; Row : Integer) : Boolean;
Begin Result := Self.ValidateRow(Reader, Row); END;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TDbxDataGenerator(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDbxDataGenerator) do
  begin
    RegisterMethod(@TDbxDataGenerator.ValidateAnsiString, 'ValidateAnsiString');
    RegisterMethod(@TDbxDataGenerator.ValidateWideString, 'ValidateWideString');
    RegisterMethod(@TDbxDataGenerator.ValidateBoolean, 'ValidateBoolean');
    RegisterMethod(@TDbxDataGenerator.ValidateInt64, 'ValidateInt64');
    RegisterMethod(@TDbxDataGenerator.ValidateDouble, 'ValidateDouble');
    RegisterMethod(@TDbxDataGenerator.ValidateBcd, 'ValidateBcd');
    RegisterMethod(@TDbxDataGenerator.ValidateDate, 'ValidateDate');
    RegisterMethod(@TDbxDataGenerator.ValidateTime, 'ValidateTime');
    RegisterMethod(@TDbxDataGenerator.ValidateTimestamp, 'ValidateTimestamp');
    RegisterMethod(@TDbxDataGenerator.ValidateBytes, 'ValidateBytes');
    RegisterMethod(@TDbxDataGenerator.BytesEquals, 'BytesEquals');
    RegisterMethod(@TDbxDataGeneratorValidateRow_P, 'ValidateRow');
    RegisterMethod(@TDbxDataGeneratorValidateRow1_P, 'ValidateRow1');
    RegisterMethod(@TDbxDataGenerator.ValidateParameters, 'ValidateParameters');
    RegisterMethod(@TDbxDataGeneratorAddParameters_P, 'AddParameters');
    RegisterMethod(@TDbxDataGeneratorAddParameters1_P, 'AddParameters1');
    RegisterMethod(@TDbxDataGeneratorSetInsertParameters_P, 'SetInsertParameters');
    RegisterMethod(@TDbxDataGeneratorSetInsertParameters1_P, 'SetInsertParameters1');
    RegisterPropertyHelper(@TDbxDataGeneratorIsFractionsSupported_R,nil,'IsFractionsSupported');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_DbxDataGenerator(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TDbxDataGenerator(CL);
end;

 
 
{ TPSImport_DbxDataGenerator }
(*----------------------------------------------------------------------------*)
procedure TPSImport_DbxDataGenerator.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_DbxDataGenerator(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_DbxDataGenerator.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_DbxDataGenerator(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.