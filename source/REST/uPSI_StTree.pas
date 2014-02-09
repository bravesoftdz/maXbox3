unit uPSI_StTree;
{
  just tree
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
  TPSImport_StTree = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TStTree(CL: TPSPascalCompiler);
procedure SIRegister_TStTreeNode(CL: TPSPascalCompiler);
procedure SIRegister_StTree(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TStTree(CL: TPSRuntimeClassImporter);
procedure RIRegister_TStTreeNode(CL: TPSRuntimeClassImporter);
procedure RIRegister_StTree(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,StConst
  ,StBase
  ,StTree
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_StTree]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TStTree(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStContainer', 'TStTree') do
  with CL.AddClassN(CL.FindClass('TStContainer'),'TStTree') do begin
    RegisterMethod('Constructor Create( NodeClass : TStNodeClass)');
    RegisterMethod('Procedure Free');
    RegisterMethod('Function Insert( Data : Pointer) : TStTreeNode');
    RegisterMethod('Procedure Delete( Data : Pointer)');
    RegisterMethod('Function Find( Data : ___Pointer) : TStTreeNode');
    RegisterMethod('Procedure Join( T : TStTree; IgnoreDups : Boolean)');
    RegisterMethod('Function Split( Data : ___Pointer) : TStTree');
    RegisterMethod('Function Iterate( Action : TIterateFunc; Up : Boolean; OtherData : Pointer) : TStTreeNode');
    RegisterMethod('Function First : TStTreeNode');
    RegisterMethod('Function Last : TStTreeNode');
    RegisterMethod('Function Next( N : TStTreeNode) : TStTreeNode');
    RegisterMethod('Function Prev( N : TStTreeNode) : TStTreeNode');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TStTreeNode(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStNode', 'TStTreeNode') do
  with CL.AddClassN(CL.FindClass('TStNode'),'TStTreeNode') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_StTree(CL: TPSPascalCompiler);
begin
  SIRegister_TStTreeNode(CL);
  SIRegister_TStTree(CL);
  //CL.AddTypeS('TStTreeClass', 'class of TStTree');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TStTree(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TStTree) do begin
    RegisterConstructor(@TStTree.Create, 'Create');
    RegisterMethod(@TStTree.Destroy, 'Free');
    RegisterMethod(@TStTree.Insert, 'Insert');
    RegisterMethod(@TStTree.Delete, 'Delete');
    RegisterMethod(@TStTree.Find, 'Find');
    RegisterMethod(@TStTree.Join, 'Join');
    RegisterMethod(@TStTree.Split, 'Split');
    RegisterMethod(@TStTree.Iterate, 'Iterate');
    RegisterMethod(@TStTree.First, 'First');
    RegisterMethod(@TStTree.Last, 'Last');
    RegisterMethod(@TStTree.Next, 'Next');
    RegisterMethod(@TStTree.Prev, 'Prev');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TStTreeNode(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TStTreeNode) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_StTree(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TStTreeNode(CL);
  RIRegister_TStTree(CL);
end;

 
 
{ TPSImport_StTree }
(*----------------------------------------------------------------------------*)
procedure TPSImport_StTree.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_StTree(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_StTree.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_StTree(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.