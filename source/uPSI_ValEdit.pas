unit uPSI_ValEdit;
{
  V3.8
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
  TPSImport_ValEdit = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TItemProp(CL: TPSPascalCompiler);
procedure SIRegister_TValueListStrings(CL: TPSPascalCompiler);
procedure SIRegister_TValueListEditor(CL: TPSPascalCompiler);
procedure SIRegister_ValEdit(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TItemProp(CL: TPSRuntimeClassImporter);
procedure RIRegister_TValueListStrings(CL: TPSRuntimeClassImporter);
procedure RIRegister_TValueListEditor(CL: TPSRuntimeClassImporter);
procedure RIRegister_ValEdit(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Messages
  ,Controls
  ,Grids
  ,StdCtrls
  ,ValEdit
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_ValEdit]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TItemProp(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPersistent', 'TItemProp') do
  with CL.AddClassN(CL.FindClass('TPersistent'),'TItemProp') do
  begin
    RegisterMethod('Constructor Create( AEditor : TValueListEditor)');
    RegisterMethod('Function HasPickList : Boolean');
    RegisterProperty('EditMask', 'string', iptrw);
    RegisterProperty('EditStyle', 'TEditStyle', iptrw);
    RegisterProperty('KeyDesc', 'string', iptrw);
    RegisterProperty('PickList', 'TStrings', iptrw);
    RegisterProperty('MaxLength', 'Integer', iptrw);
    RegisterProperty('ReadOnly', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TValueListStrings(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStringList', 'TValueListStrings') do
  with CL.AddClassN(CL.FindClass('TStringList'),'TValueListStrings') do
  begin
    RegisterMethod('Constructor Create( AEditor : TValueListEditor)');
    RegisterMethod('Function KeyIsValid( const Key : string; RaiseError : Boolean) : Boolean');
    RegisterProperty('ItemProps', 'TItemProp Variant', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TValueListEditor(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomDrawGrid', 'TValueListEditor') do
  with CL.AddClassN(CL.FindClass('TCustomDrawGrid'),'TValueListEditor') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Function FindRow( const KeyName : string; var Row : Integer) : Boolean');
    RegisterMethod('Function InsertRow( const KeyName, Value : string; Append : Boolean) : Integer');
    RegisterMethod('Procedure Refresh');
    RegisterMethod('Function RestoreCurrentRow : Boolean');
    RegisterProperty('Cells', 'string Integer Integer', iptrw);
    RegisterProperty('ItemProps', 'TItemProp Variant', iptrw);
    RegisterProperty('Keys', 'string Integer', iptrw);
    RegisterProperty('RowCount', 'Integer', iptr);
    RegisterProperty('Values', 'string string', iptrw);
    RegisterProperty('DisplayOptions', 'TDisplayOptions', iptrw);
    RegisterProperty('DropDownRows', 'Integer', iptrw);
    RegisterProperty('KeyOptions', 'TKeyOptions', iptrw);
    RegisterProperty('Options', 'TGridOptions', iptrw);
    RegisterProperty('Strings', 'TStrings', iptrw);
    RegisterProperty('TitleCaptions', 'TStrings', iptrw);
    RegisterProperty('OnEditButtonClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnGetPickList', 'TGetPickListEvent', iptrw);
    RegisterProperty('OnStringsChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnStringsChanging', 'TNotifyEvent', iptrw);
    RegisterProperty('OnValidate', 'TOnValidateEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_ValEdit(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'TItemProp');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TValueListStrings');
  CL.AddTypeS('TDisplayOption', '( doColumnTitles, doAutoColResize, doKeyColFixed )');
  CL.AddTypeS('TDisplayOptions', 'set of TDisplayOption');
  CL.AddTypeS('TKeyOption', '( keyEdit, keyAdd, keyDelete, keyUnique )');
  CL.AddTypeS('TKeyOptions', 'set of TKeyOption');
  CL.AddTypeS('TGetPickListEvent', 'Procedure ( Sender : TObject; const KeyName'
   +' : string; Values : TStrings)');
  CL.AddTypeS('TOnValidateEvent', 'Procedure ( Sender : TObject; ACol, ARow : L'
   +'ongint; const KeyName, KeyValue : string)');
  SIRegister_TValueListEditor(CL);
  CL.AddTypeS('TItemProps', 'array of TItemProp');
  SIRegister_TValueListStrings(CL);
  SIRegister_TItemProp(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TItemPropReadOnly_W(Self: TItemProp; const T: Boolean);
begin Self.ReadOnly := T; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropReadOnly_R(Self: TItemProp; var T: Boolean);
begin T := Self.ReadOnly; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropMaxLength_W(Self: TItemProp; const T: Integer);
begin Self.MaxLength := T; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropMaxLength_R(Self: TItemProp; var T: Integer);
begin T := Self.MaxLength; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropPickList_W(Self: TItemProp; const T: TStrings);
begin Self.PickList := T; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropPickList_R(Self: TItemProp; var T: TStrings);
begin T := Self.PickList; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropKeyDesc_W(Self: TItemProp; const T: string);
begin Self.KeyDesc := T; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropKeyDesc_R(Self: TItemProp; var T: string);
begin T := Self.KeyDesc; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropEditStyle_W(Self: TItemProp; const T: TEditStyle);
begin Self.EditStyle := T; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropEditStyle_R(Self: TItemProp; var T: TEditStyle);
begin T := Self.EditStyle; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropEditMask_W(Self: TItemProp; const T: string);
begin Self.EditMask := T; end;

(*----------------------------------------------------------------------------*)
procedure TItemPropEditMask_R(Self: TItemProp; var T: string);
begin T := Self.EditMask; end;

(*----------------------------------------------------------------------------*)
procedure TValueListStringsItemProps_W(Self: TValueListStrings; const T: TItemProp; const t1: Variant);
begin Self.ItemProps[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListStringsItemProps_R(Self: TValueListStrings; var T: TItemProp; const t1: Variant);
begin T := Self.ItemProps[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnValidate_W(Self: TValueListEditor; const T: TOnValidateEvent);
begin Self.OnValidate := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnValidate_R(Self: TValueListEditor; var T: TOnValidateEvent);
begin T := Self.OnValidate; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnStringsChanging_W(Self: TValueListEditor; const T: TNotifyEvent);
begin Self.OnStringsChanging := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnStringsChanging_R(Self: TValueListEditor; var T: TNotifyEvent);
begin T := Self.OnStringsChanging; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnStringsChange_W(Self: TValueListEditor; const T: TNotifyEvent);
begin Self.OnStringsChange := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnStringsChange_R(Self: TValueListEditor; var T: TNotifyEvent);
begin T := Self.OnStringsChange; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnGetPickList_W(Self: TValueListEditor; const T: TGetPickListEvent);
begin Self.OnGetPickList := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnGetPickList_R(Self: TValueListEditor; var T: TGetPickListEvent);
begin T := Self.OnGetPickList; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnEditButtonClick_W(Self: TValueListEditor; const T: TNotifyEvent);
begin Self.OnEditButtonClick := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOnEditButtonClick_R(Self: TValueListEditor; var T: TNotifyEvent);
begin T := Self.OnEditButtonClick; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorTitleCaptions_W(Self: TValueListEditor; const T: TStrings);
begin Self.TitleCaptions := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorTitleCaptions_R(Self: TValueListEditor; var T: TStrings);
begin T := Self.TitleCaptions; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorStrings_W(Self: TValueListEditor; const T: TStrings);
begin Self.Strings := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorStrings_R(Self: TValueListEditor; var T: TStrings);
begin T := Self.Strings; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOptions_W(Self: TValueListEditor; const T: TGridOptions);
begin Self.Options := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorOptions_R(Self: TValueListEditor; var T: TGridOptions);
begin T := Self.Options; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorKeyOptions_W(Self: TValueListEditor; const T: TKeyOptions);
begin Self.KeyOptions := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorKeyOptions_R(Self: TValueListEditor; var T: TKeyOptions);
begin T := Self.KeyOptions; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorDropDownRows_W(Self: TValueListEditor; const T: Integer);
begin Self.DropDownRows := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorDropDownRows_R(Self: TValueListEditor; var T: Integer);
begin T := Self.DropDownRows; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorDisplayOptions_W(Self: TValueListEditor; const T: TDisplayOptions);
begin Self.DisplayOptions := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorDisplayOptions_R(Self: TValueListEditor; var T: TDisplayOptions);
begin T := Self.DisplayOptions; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorValues_W(Self: TValueListEditor; const T: string; const t1: string);
begin Self.Values[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorValues_R(Self: TValueListEditor; var T: string; const t1: string);
begin T := Self.Values[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorRowCount_R(Self: TValueListEditor; var T: Integer);
begin T := Self.RowCount; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorKeys_W(Self: TValueListEditor; const T: string; const t1: Integer);
begin Self.Keys[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorKeys_R(Self: TValueListEditor; var T: string; const t1: Integer);
begin T := Self.Keys[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorItemProps_W(Self: TValueListEditor; const T: TItemProp; const t1: Variant);
begin Self.ItemProps[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorItemProps_R(Self: TValueListEditor; var T: TItemProp; const t1: Variant);
begin T := Self.ItemProps[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorCells_W(Self: TValueListEditor; const T: string; const t1: Integer; const t2: Integer);
begin Self.Cells[t1, t2] := T; end;

(*----------------------------------------------------------------------------*)
procedure TValueListEditorCells_R(Self: TValueListEditor; var T: string; const t1: Integer; const t2: Integer);
begin T := Self.Cells[t1, t2]; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TItemProp(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TItemProp) do
  begin
    RegisterConstructor(@TItemProp.Create, 'Create');
    RegisterMethod(@TItemProp.HasPickList, 'HasPickList');
    RegisterPropertyHelper(@TItemPropEditMask_R,@TItemPropEditMask_W,'EditMask');
    RegisterPropertyHelper(@TItemPropEditStyle_R,@TItemPropEditStyle_W,'EditStyle');
    RegisterPropertyHelper(@TItemPropKeyDesc_R,@TItemPropKeyDesc_W,'KeyDesc');
    RegisterPropertyHelper(@TItemPropPickList_R,@TItemPropPickList_W,'PickList');
    RegisterPropertyHelper(@TItemPropMaxLength_R,@TItemPropMaxLength_W,'MaxLength');
    RegisterPropertyHelper(@TItemPropReadOnly_R,@TItemPropReadOnly_W,'ReadOnly');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TValueListStrings(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TValueListStrings) do
  begin
    RegisterConstructor(@TValueListStrings.Create, 'Create');
    RegisterMethod(@TValueListStrings.KeyIsValid, 'KeyIsValid');
    RegisterPropertyHelper(@TValueListStringsItemProps_R,@TValueListStringsItemProps_W,'ItemProps');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TValueListEditor(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TValueListEditor) do
  begin
    RegisterConstructor(@TValueListEditor.Create, 'Create');
    RegisterMethod(@TValueListEditor.FindRow, 'FindRow');
    RegisterMethod(@TValueListEditor.InsertRow, 'InsertRow');
    RegisterMethod(@TValueListEditor.Refresh, 'Refresh');
    RegisterMethod(@TValueListEditor.RestoreCurrentRow, 'RestoreCurrentRow');
    RegisterPropertyHelper(@TValueListEditorCells_R,@TValueListEditorCells_W,'Cells');
    RegisterPropertyHelper(@TValueListEditorItemProps_R,@TValueListEditorItemProps_W,'ItemProps');
    RegisterPropertyHelper(@TValueListEditorKeys_R,@TValueListEditorKeys_W,'Keys');
    RegisterPropertyHelper(@TValueListEditorRowCount_R,nil,'RowCount');
    RegisterPropertyHelper(@TValueListEditorValues_R,@TValueListEditorValues_W,'Values');
    RegisterPropertyHelper(@TValueListEditorDisplayOptions_R,@TValueListEditorDisplayOptions_W,'DisplayOptions');
    RegisterPropertyHelper(@TValueListEditorDropDownRows_R,@TValueListEditorDropDownRows_W,'DropDownRows');
    RegisterPropertyHelper(@TValueListEditorKeyOptions_R,@TValueListEditorKeyOptions_W,'KeyOptions');
    RegisterPropertyHelper(@TValueListEditorOptions_R,@TValueListEditorOptions_W,'Options');
    RegisterPropertyHelper(@TValueListEditorStrings_R,@TValueListEditorStrings_W,'Strings');
    RegisterPropertyHelper(@TValueListEditorTitleCaptions_R,@TValueListEditorTitleCaptions_W,'TitleCaptions');
    RegisterPropertyHelper(@TValueListEditorOnEditButtonClick_R,@TValueListEditorOnEditButtonClick_W,'OnEditButtonClick');
    RegisterPropertyHelper(@TValueListEditorOnGetPickList_R,@TValueListEditorOnGetPickList_W,'OnGetPickList');
    RegisterPropertyHelper(@TValueListEditorOnStringsChange_R,@TValueListEditorOnStringsChange_W,'OnStringsChange');
    RegisterPropertyHelper(@TValueListEditorOnStringsChanging_R,@TValueListEditorOnStringsChanging_W,'OnStringsChanging');
    RegisterPropertyHelper(@TValueListEditorOnValidate_R,@TValueListEditorOnValidate_W,'OnValidate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_ValEdit(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TItemProp) do
  with CL.Add(TValueListStrings) do
  RIRegister_TValueListEditor(CL);
  RIRegister_TValueListStrings(CL);
  RIRegister_TItemProp(CL);
end;

 
 
{ TPSImport_ValEdit }
(*----------------------------------------------------------------------------*)
procedure TPSImport_ValEdit.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_ValEdit(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_ValEdit.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_ValEdit(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
