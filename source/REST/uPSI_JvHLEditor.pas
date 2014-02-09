unit uPSI_JvHLEditor;
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
  TPSImport_JvHLEditor = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvHLEditor(CL: TPSPascalCompiler);
procedure SIRegister_TJvEditorHighlighter(CL: TPSPascalCompiler);
procedure SIRegister_JvHLEditor(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJvHLEditor(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvEditorHighlighter(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvHLEditor(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  //,JclUnitVersioning
  ,Graphics
  ,JvEditor
  //,JvEditorCommon
  ,JvHLParser
  ,JvHLEditor
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvHLEditor]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvHLEditor(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvEditor', 'TJvHLEditor') do
  with CL.AddClassN(CL.FindClass('TJvEditor'),'TJvHLEditor') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure Assign( Source : TPersistent)');
    RegisterProperty('Highlighter', 'TJvHighlighter', iptrw);
    RegisterProperty('Colors', 'TJvColors', iptrw);
    RegisterProperty('DelphiColors', 'Boolean', iptrw);
    RegisterProperty('LongTokens', 'Boolean', iptrw);
    RegisterProperty('OnReservedWord', 'TOnReservedWord', iptrw);
    RegisterProperty('SyntaxHighlighting', 'Boolean', iptrw);
    RegisterProperty('SyntaxHighlighter', 'TJvEditorHighlighter', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvEditorHighlighter(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TComponent', 'TJvEditorHighlighter') do
  with CL.AddClassN(CL.FindClass('TComponent'),'TJvEditorHighlighter') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvHLEditor(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'TJvHLEditor');
  CL.AddTypeS('TOnReservedWord', 'Procedure ( Sender : TObject; Token : string;'
   +' var Reserved : Boolean)');
  SIRegister_TJvEditorHighlighter(CL);
  SIRegister_TJvHLEditor(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvHLEditorSyntaxHighlighter_W(Self: TJvHLEditor; const T: TJvEditorHighlighter);
begin Self.SyntaxHighlighter := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorSyntaxHighlighter_R(Self: TJvHLEditor; var T: TJvEditorHighlighter);
begin T := Self.SyntaxHighlighter; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorSyntaxHighlighting_W(Self: TJvHLEditor; const T: Boolean);
begin Self.SyntaxHighlighting := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorSyntaxHighlighting_R(Self: TJvHLEditor; var T: Boolean);
begin T := Self.SyntaxHighlighting; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorOnReservedWord_W(Self: TJvHLEditor; const T: TOnReservedWord);
begin Self.OnReservedWord := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorOnReservedWord_R(Self: TJvHLEditor; var T: TOnReservedWord);
begin T := Self.OnReservedWord; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorLongTokens_W(Self: TJvHLEditor; const T: Boolean);
begin Self.LongTokens := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorLongTokens_R(Self: TJvHLEditor; var T: Boolean);
begin T := Self.LongTokens; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorDelphiColors_W(Self: TJvHLEditor; const T: Boolean);
begin Self.DelphiColors := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorDelphiColors_R(Self: TJvHLEditor; var T: Boolean);
begin T := Self.DelphiColors; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorColors_W(Self: TJvHLEditor; const T: TJvColors);
begin Self.Colors := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorColors_R(Self: TJvHLEditor; var T: TJvColors);
begin T := Self.Colors; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorHighlighter_W(Self: TJvHLEditor; const T: TJvHighlighter);
begin Self.Highlighter := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvHLEditorHighlighter_R(Self: TJvHLEditor; var T: TJvHighlighter);
begin T := Self.Highlighter; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvHLEditor(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvHLEditor) do
  begin
    RegisterConstructor(@TJvHLEditor.Create, 'Create');
    RegisterMethod(@TJvHLEditor.Assign, 'Assign');
    RegisterPropertyHelper(@TJvHLEditorHighlighter_R,@TJvHLEditorHighlighter_W,'Highlighter');
    RegisterPropertyHelper(@TJvHLEditorColors_R,@TJvHLEditorColors_W,'Colors');
    RegisterPropertyHelper(@TJvHLEditorDelphiColors_R,@TJvHLEditorDelphiColors_W,'DelphiColors');
    RegisterPropertyHelper(@TJvHLEditorLongTokens_R,@TJvHLEditorLongTokens_W,'LongTokens');
    RegisterPropertyHelper(@TJvHLEditorOnReservedWord_R,@TJvHLEditorOnReservedWord_W,'OnReservedWord');
    RegisterPropertyHelper(@TJvHLEditorSyntaxHighlighting_R,@TJvHLEditorSyntaxHighlighting_W,'SyntaxHighlighting');
    RegisterPropertyHelper(@TJvHLEditorSyntaxHighlighter_R,@TJvHLEditorSyntaxHighlighter_W,'SyntaxHighlighter');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvEditorHighlighter(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvEditorHighlighter) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvHLEditor(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvHLEditor) do
  RIRegister_TJvEditorHighlighter(CL);
  RIRegister_TJvHLEditor(CL);
end;

 
 
{ TPSImport_JvHLEditor }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvHLEditor.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvHLEditor(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvHLEditor.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvHLEditor(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
