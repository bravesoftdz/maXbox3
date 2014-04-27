unit uPSI_UIntList;
{
   the int list
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
  TPSImport_UIntList = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIntList(CL: TPSPascalCompiler);
procedure SIRegister_UIntList(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIntList(CL: TPSRuntimeClassImporter);
procedure RIRegister_UIntList(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   sysconst
  ,UIntList
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_UIntList]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIntList(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPersistent', 'TIntList') do
  with CL.AddClassN(CL.FindClass('TPersistent'),'TIntList') do begin
    RegisterMethod('Function GetCount : Integer');
     RegisterMethod('Procedure Free');
      RegisterMethod('Function Add( const S : int64) : Integer');
    RegisterMethod('Function AddObject( const S : int64; AObject : TObject) : Integer');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure Delete( Index : Integer)');
    RegisterMethod('Procedure Exchange( Index1, Index2 : Integer)');
    RegisterMethod('Function Find( const S : int64; var Index : Integer) : Boolean');
    RegisterMethod('Function  IndexOf( const S : int64) : Integer');
    RegisterMethod('Procedure Insert( Index : Integer; const S : int64)');
    RegisterMethod('Procedure Sort');
    RegisterMethod('Procedure CustomSort( Compare : TIntListSortCompare)');
    RegisterMethod('Procedure LoadFromFile( const FileName : string)');
    RegisterMethod('Procedure LoadFromStream( Stream : TStream)');
    RegisterMethod('Procedure SaveToFile( const FileName : string)');
    RegisterMethod('Procedure SaveToStream( Stream : TStream)');
    RegisterProperty('Duplicates', 'TDuplicates', iptrw);
    RegisterProperty('Sorted', 'Boolean', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnChanging', 'TNotifyEvent', iptrw);
    RegisterProperty('Integers', 'int64 Integer', iptrw);
    SetDefaultPropery('Integers');
    RegisterProperty('Count', 'Integer', iptr);
    RegisterProperty('Objects', 'TObject Integer', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_UIntList(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('dffmaxlistsize','LongInt').SetInt( maxint div 32);
  CL.AddClassN(CL.FindClass('TOBJECT'),'TIntList');
  //CL.AddTypeS('PIntItem', '^TIntItem // will not work');
  CL.AddTypeS('TIntItem', 'record FInt : int64; FObject : TObject; end');
  //CL.AddTypeS('PIntItemList', '^TIntItemList // will not work');
  SIRegister_TIntList(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIntListObjects_W(Self: TIntList; const T: TObject; const t1: Integer);
begin Self.Objects[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TIntListObjects_R(Self: TIntList; var T: TObject; const t1: Integer);
begin T := Self.Objects[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIntListCount_R(Self: TIntList; var T: Integer);
begin T := Self.Count; end;

(*----------------------------------------------------------------------------*)
procedure TIntListIntegers_W(Self: TIntList; const T: int64; const t1: Integer);
begin Self.Integers[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TIntListIntegers_R(Self: TIntList; var T: int64; const t1: Integer);
begin T := Self.Integers[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIntListOnChanging_W(Self: TIntList; const T: TNotifyEvent);
begin Self.OnChanging := T; end;

(*----------------------------------------------------------------------------*)
procedure TIntListOnChanging_R(Self: TIntList; var T: TNotifyEvent);
begin T := Self.OnChanging; end;

(*----------------------------------------------------------------------------*)
procedure TIntListOnChange_W(Self: TIntList; const T: TNotifyEvent);
begin Self.OnChange := T; end;

(*----------------------------------------------------------------------------*)
procedure TIntListOnChange_R(Self: TIntList; var T: TNotifyEvent);
begin T := Self.OnChange; end;

(*----------------------------------------------------------------------------*)
procedure TIntListSorted_W(Self: TIntList; const T: Boolean);
begin Self.Sorted := T; end;

(*----------------------------------------------------------------------------*)
procedure TIntListSorted_R(Self: TIntList; var T: Boolean);
begin T := Self.Sorted; end;

(*----------------------------------------------------------------------------*)
procedure TIntListDuplicates_W(Self: TIntList; const T: TDuplicates);
begin Self.Duplicates := T; end;

(*----------------------------------------------------------------------------*)
procedure TIntListDuplicates_R(Self: TIntList; var T: TDuplicates);
begin T := Self.Duplicates; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIntList(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIntList) do begin
    RegisterMethod(@TIntList.GetCount, 'GetCount');
    RegisterMethod(@TIntList.Add, 'Add');
    RegisterMethod(@TIntList.Destroy, 'Free');
    RegisterVirtualMethod(@TIntList.AddObject, 'AddObject');
    RegisterMethod(@TIntList.Clear, 'Clear');
    RegisterMethod(@TIntList.Delete, 'Delete');
    RegisterMethod(@TIntList.Exchange, 'Exchange');
    RegisterVirtualMethod(@TIntList.Find, 'Find');
    RegisterMethod(@TIntList.IndexOf, 'IndexOf');
    RegisterMethod(@TIntList.Insert, 'Insert');
    RegisterVirtualMethod(@TIntList.Sort, 'Sort');
    RegisterVirtualMethod(@TIntList.CustomSort, 'CustomSort');
    RegisterVirtualMethod(@TIntList.LoadFromFile, 'LoadFromFile');
    RegisterVirtualMethod(@TIntList.LoadFromStream, 'LoadFromStream');
    RegisterVirtualMethod(@TIntList.SaveToFile, 'SaveToFile');
    RegisterMethod(@TIntList.SaveToStream, 'SaveToStream');
    RegisterPropertyHelper(@TIntListDuplicates_R,@TIntListDuplicates_W,'Duplicates');
    RegisterPropertyHelper(@TIntListSorted_R,@TIntListSorted_W,'Sorted');
    RegisterPropertyHelper(@TIntListOnChange_R,@TIntListOnChange_W,'OnChange');
    RegisterPropertyHelper(@TIntListOnChanging_R,@TIntListOnChanging_W,'OnChanging');
    RegisterPropertyHelper(@TIntListIntegers_R,@TIntListIntegers_W,'Integers');
    RegisterPropertyHelper(@TIntListCount_R,nil,'Count');
    RegisterPropertyHelper(@TIntListObjects_R,@TIntListObjects_W,'Objects');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_UIntList(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIntList) do
  RIRegister_TIntList(CL);
end;

 
 
{ TPSImport_UIntList }
(*----------------------------------------------------------------------------*)
procedure TPSImport_UIntList.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_UIntList(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_UIntList.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_UIntList(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
