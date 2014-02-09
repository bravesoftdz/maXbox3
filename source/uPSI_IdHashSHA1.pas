unit uPSI_IdHashSHA1;
{
This file has been generated by UnitParser v0.7, written by M. Knight
from indy 10   , inbuilt function
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
  TPSImport_IdHashSHA1 = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdHashSHA1(CL: TPSPascalCompiler);
procedure SIRegister_IdHashSHA1(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdHashSHA1(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdHashSHA1(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdHashSHA1Utils_Routines(S: TPSExec);


procedure Register;

implementation


uses
   //IdObjs
  IdHash
  ,IdHashSHA1
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdHashSHA1]);
end;


function IdSHA1Hash(apath: string): string;
var
  idsha1: TIdHashSHA1;  //shaback: T5x4LongWordRecord;
  shaStream: TMemoryStream;
begin
   idsha1:= TIDHashsha1.Create;
   shaStream:= TMemoryStream.Create;
   try
     shaStream.Position:= 0;
     shaStream.LoadFromFile(apath);
     //writeln('Indy SHA1 Proof: '+idsha1.asHEX(shaback)); debug
     result:= idsha1.AsHEX(idsha1.HashValue(shaStream));
   finally  
     idsha1.free;
     shaStream.Free;
   end;
end;   


(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdHashSHA1(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdHash160', 'TIdHashSHA1') do
  with CL.AddClassN(CL.FindClass('TIdHash160'),'TIdHashSHA1') do begin
   RegisterMethod('Constructor Create;');
   RegisterMethod('Procedure Free;');
    RegisterMethod('Function AsHex( const AValue : T5x4LongWordRecord) : string');
   RegisterMethod('Function HashValue( AStream : TStream) : T5x4LongWordRecord;');
    RegisterMethod('Function HashValue1( AStream : TStream; const ABeginPos, AEndPos : Int64) : T5x4LongWordRecord;');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdHashSHA1(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('BufferSize','LongInt').SetInt( 64);
  SIRegister_TIdHashSHA1(CL);
  CL.AddDelphiFunction('function IdSHA1Hash(apath: string): string;');
  CL.AddDelphiFunction('function IdHashSHA1(apath: string): string;');

end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
Function TIdHashSHA1HashValue1_P(Self: TIdHashSHA1;  AStream : TStream; const ABeginPos, AEndPos : Int64) : T5x4LongWordRecord;
Begin Result := Self.HashValue(AStream, ABeginPos, AEndPos); END;

(*----------------------------------------------------------------------------*)
Function TIdHashSHA1HashValue_P(Self: TIdHashSHA1;  AStream : TStream) : T5x4LongWordRecord;
Begin Result := Self.HashValue(AStream); END;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdHashSHA1(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdHashSHA1) do begin
    RegisterConstructor(@TIdHashSHA1.Create, 'Create');
    RegisterMethod(@TIdHashSHA1.Destroy, 'Free');

    RegisterMethod(@TIdHashSHA1.AsHex, 'AsHex');
    RegisterMethod(@TIdHashSHA1HashValue_P, 'HashValue');
    RegisterMethod(@TIdHashSHA1HashValue1_P, 'HashValue1');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdHashSHA1(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdHashSHA1(CL);
end;

procedure RIRegister_IdHashSHA1Utils_Routines(S: TPSExec);
begin
  S.RegisterDelphiFunction(@IdSHA1Hash, 'IdSHA1Hash', cdRegister);
  S.RegisterDelphiFunction(@IdSHA1Hash, 'IdHashSHA1', cdRegister);

end;
//TIdHash16



{ TPSImport_IdHashSHA1 }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHashSHA1.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdHashSHA1(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHashSHA1.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdHashSHA1(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
