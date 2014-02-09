unit uPSI_niRegularExpression;
{
This file has been generated by UnitParser v0.7, written by M. Knight

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
  TPSImport_niRegularExpression = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TniTestRegularExpression(CL: TPSPascalCompiler);
procedure SIRegister_TniRegularExpressionTransition(CL: TPSPascalCompiler);
procedure SIRegister_TniRegularExpressionState(CL: TPSPascalCompiler);
procedure SIRegister_TniRegularExpressionMatch(CL: TPSPascalCompiler);
procedure SIRegister_TniRegularExpressionMatcher(CL: TPSPascalCompiler);
procedure SIRegister_TniRegularExpression(CL: TPSPascalCompiler);
procedure SIRegister_niRegularExpression(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TniTestRegularExpression(CL: TPSRuntimeClassImporter);
procedure RIRegister_TniRegularExpressionTransition(CL: TPSRuntimeClassImporter);
procedure RIRegister_TniRegularExpressionState(CL: TPSRuntimeClassImporter);
procedure RIRegister_TniRegularExpressionMatch(CL: TPSRuntimeClassImporter);
procedure RIRegister_TniRegularExpressionMatcher(CL: TPSRuntimeClassImporter);
procedure RIRegister_TniRegularExpression(CL: TPSRuntimeClassImporter);
procedure RIRegister_niRegularExpression(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Contnrs
  ,niSTRING
  ,niTestCase
  ,niRegularExpression
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_niRegularExpression]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TniTestRegularExpression(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TniTestCase', 'TniTestRegularExpression') do
  with CL.AddClassN(CL.FindClass('TniTestCase'),'TniTestRegularExpression') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TniRegularExpressionTransition(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TniRegularExpressionTransition') do
  with CL.AddClassN(CL.FindClass('TObject'),'TniRegularExpressionTransition') do
  begin
    RegisterMethod('Constructor Create( oSource : TniRegularExpressionState; oDestination : TniRegularExpressionState; xCharacters : TCharSet; bLambda : boolean)');
    RegisterMethod('Procedure AddCharacters( xCharacters : TCharSet)');
    RegisterMethod('Function Description : string');
    RegisterProperty('Source', 'TniRegularExpressionState', iptr);
    RegisterProperty('Destination', 'TniRegularExpressionState', iptr);
    RegisterProperty('Characters', 'TCharSet', iptrw);
    RegisterProperty('Lambda', 'boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TniRegularExpressionState(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TniRegularExpressionState') do
  with CL.AddClassN(CL.FindClass('TObject'),'TniRegularExpressionState') do
  begin
    RegisterMethod('Constructor Create( oExpression : TniRegularExpression; eType : TniRegularExpressionStateType)');
    RegisterMethod('Procedure AddTransitionTo( oState : TniRegularExpressionState; xCharacters : TCharset)');
    RegisterMethod('Procedure AddLambdaTransitionTo( oState : TniRegularExpressionState)');
    RegisterMethod('Procedure RemoveTransitionTo( oState : TniRegularExpressionState; xCharacters : TCharset);');
    RegisterMethod('Procedure RemoveTransitionTo1( oState : TniRegularExpressionState);');
    RegisterMethod('Procedure GetTransitionsOn( cChar : char; oStateList : TList)');
    RegisterMethod('Function GetOnlyTransitionOn( cChar : char) : TniRegularExpressionState');
    RegisterMethod('Function FindImmediateTransitionOn( cChar : char) : TniRegularExpressionState');
    RegisterMethod('Procedure MakeCaseInsensitive');
    RegisterMethod('Procedure CheckIfAccept');
    RegisterMethod('Procedure RemoveLambdaTransitions( var bChanged : boolean)');
    RegisterMethod('Procedure MakeDeterministic( var bChanged : boolean)');
    RegisterMethod('Procedure MarkReachable');
    RegisterMethod('Function EqualState( oState : TniRegularExpressionState) : boolean');
    RegisterMethod('Function ContainsTransition( oTransition : TniRegularExpressionTransition) : boolean');
    RegisterMethod('Procedure ChangeEntryTransitions( oNewState : TniRegularExpressionState)');
    RegisterMethod('Procedure RedirectTransition( oOldState : TniRegularExpressionState; oNewState : TniRegularExpressionState)');
    RegisterMethod('Procedure CalculateFirstSet');
    RegisterMethod('Function IsDFAState : boolean');
    RegisterMethod('Function GetSuccessor( cChar : char) : TniRegularExpressionState');
    RegisterMethod('Function CanStart( cChar : char) : boolean');
    RegisterMethod('Function Name : string');
    RegisterMethod('Procedure DumpDescription( oStrings : TStrings)');
    RegisterMethod('Procedure AddState( oState : TniRegularExpressionState)');
    RegisterMethod('Procedure Closure');
    RegisterMethod('Function ContainsState( oState : TniRegularExpressionState) : boolean');
    RegisterProperty('StateType', 'TniRegularExpressionStateType', iptr);
    RegisterProperty('GroupStart', 'TniRegularExpressionState', iptrw);
    RegisterProperty('GroupFinish', 'TniRegularExpressionState', iptrw);
    RegisterProperty('StateNumber', 'integer', iptr);
    RegisterProperty('PriorStateCount', 'integer', iptr);
    RegisterProperty('PriorStates', 'TniRegularExpressionState integer', iptr);
    RegisterProperty('Accept', 'boolean', iptrw);
    RegisterProperty('Modified', 'boolean', iptrw);
    RegisterProperty('Reachable', 'boolean', iptrw);
    RegisterProperty('TransitionCount', 'integer', iptr);
    RegisterProperty('Transitions', 'TniRegularExpressionTransition integer', iptr);
    RegisterProperty('Marked', 'boolean', iptrw);
    RegisterProperty('FingerPrint', 'integer', iptrw);
    RegisterProperty('StateCount', 'integer', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TniRegularExpressionMatch(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TniRegularExpressionMatch') do
  with CL.AddClassN(CL.FindClass('TObject'),'TniRegularExpressionMatch') do
  begin
    RegisterMethod('Constructor Create( iStart : integer; sText : string)');
    RegisterProperty('Start', 'integer', iptr);
    RegisterProperty('Length', 'integer', iptr);
    RegisterProperty('Text', 'string', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TniRegularExpressionMatcher(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TniRegularExpressionMatcher') do
  with CL.AddClassN(CL.FindClass('TObject'),'TniRegularExpressionMatcher') do
  begin
    RegisterMethod('Constructor Create( oOwner : TniRegularExpression; xFlags : TniRegularExpressionMatchFlags)');
    RegisterMethod('Procedure FindMatches( const sString : string; xNotify : TniRegularExpressionMatchFoundEvent);');
    RegisterMethod('Procedure FindMatches1( const sString : string; iStart : integer; xNotify : TniRegularExpressionMatchFoundEvent);');
    RegisterProperty('Status', 'TniRegularExpressionMatchResult', iptr);
    RegisterProperty('Start', 'integer', iptr);
    RegisterProperty('Finish', 'integer', iptr);
    RegisterProperty('Flags', 'TniRegularExpressionMatchFlags', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TniRegularExpression(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TniRegularExpression') do
  with CL.AddClassN(CL.FindClass('TObject'),'TniRegularExpression') do
  begin
    RegisterMethod('Constructor Create( const sRule : string; xFlags : TniRegularExpressionMatchFlags)');
    RegisterMethod('Function CreateGlobber( sFilespec : string) : TniRegularExpression');
    RegisterMethod('Function Match( const sString : string) : TniRegularExpressionMatchResult;');
    RegisterMethod('Function Match1( const sString : string; iStart : integer) : TniRegularExpressionMatchResult;');
    RegisterMethod('Procedure DumpStateTable( oStrings : TStrings)');
    RegisterMethod('Function NewState( eType : TniRegularExpressionStateType) : TniRegularExpressionState');
    RegisterMethod('Function GetDFAState( oStates : TList) : TniRegularExpressionState');
    RegisterMethod('Function CalculateDFAFingerprint( oStates : TList) : integer');
    RegisterProperty('Expression', 'string', iptr);
    RegisterProperty('StateCount', 'integer', iptr);
    RegisterProperty('States', 'TniRegularExpressionState integer', iptr);
    RegisterProperty('MatchCount', 'integer', iptr);
    RegisterProperty('Matches', 'TniRegularExpressionMatch integer', iptr);
    RegisterProperty('StartState', 'TniRegularExpressionState', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_niRegularExpression(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'TniRegularExpression');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TniRegularExpressionState');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TniRegularExpressionTransition');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TniRegularExpressionMatch');
  CL.AddTypeS('TniRegularExpressionParserState', '( psStates, psCharRange )');
  CL.AddTypeS('TniRegularExpressionParserFlag', '( pfEscaped )');
  CL.AddTypeS('TniRegularExpressionParserFlags', 'set of TniRegularExpressionPa'
   +'rserFlag');
  CL.AddTypeS('TniRegularExpressionStateType', '( stNormal, stGroupStart, stGro'
   +'upFinish )');
  CL.AddTypeS('TniRegularExpressionMatchFlag', '( mfStartOnly, mfFinishOnly, mf'
   +'CaseInsensitive, mfLongMatches, mfShortMatches, mfMultipleMatches, mfOverl'
   +'apMatches )');
  CL.AddTypeS('TniRegularExpressionMatchFlags', 'set of TniRegularExpressionMat'
   +'chFlag');
  CL.AddTypeS('TniRegularExpressionMatchResult', '( mrNone, mrFail, mrMatch, mr'
   +'Insufficient )');
  CL.AddClassN(CL.FindClass('TOBJECT'),'EniRegularExpressionError');
  SIRegister_TniRegularExpression(CL);
  CL.AddTypeS('TniRegularExpressionMatchFoundEvent', 'Procedure ( const iStart '
   +': integer; const sText : string)');
  SIRegister_TniRegularExpressionMatcher(CL);
  SIRegister_TniRegularExpressionMatch(CL);
  SIRegister_TniRegularExpressionState(CL);
  SIRegister_TniRegularExpressionTransition(CL);
  SIRegister_TniTestRegularExpression(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionTransitionLambda_W(Self: TniRegularExpressionTransition; const T: boolean);
begin Self.Lambda := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionTransitionLambda_R(Self: TniRegularExpressionTransition; var T: boolean);
begin T := Self.Lambda; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionTransitionCharacters_W(Self: TniRegularExpressionTransition; const T: TCharSet);
begin Self.Characters := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionTransitionCharacters_R(Self: TniRegularExpressionTransition; var T: TCharSet);
begin T := Self.Characters; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionTransitionDestination_R(Self: TniRegularExpressionTransition; var T: TniRegularExpressionState);
begin T := Self.Destination; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionTransitionSource_R(Self: TniRegularExpressionTransition; var T: TniRegularExpressionState);
begin T := Self.Source; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateStateCount_R(Self: TniRegularExpressionState; var T: integer);
begin T := Self.StateCount; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateFingerPrint_W(Self: TniRegularExpressionState; const T: integer);
begin Self.FingerPrint := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateFingerPrint_R(Self: TniRegularExpressionState; var T: integer);
begin T := Self.FingerPrint; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateMarked_W(Self: TniRegularExpressionState; const T: boolean);
begin Self.Marked := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateMarked_R(Self: TniRegularExpressionState; var T: boolean);
begin T := Self.Marked; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateTransitions_R(Self: TniRegularExpressionState; var T: TniRegularExpressionTransition; const t1: integer);
begin T := Self.Transitions[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateTransitionCount_R(Self: TniRegularExpressionState; var T: integer);
begin T := Self.TransitionCount; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateReachable_W(Self: TniRegularExpressionState; const T: boolean);
begin Self.Reachable := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateReachable_R(Self: TniRegularExpressionState; var T: boolean);
begin T := Self.Reachable; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateModified_W(Self: TniRegularExpressionState; const T: boolean);
begin Self.Modified := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateModified_R(Self: TniRegularExpressionState; var T: boolean);
begin T := Self.Modified; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateAccept_W(Self: TniRegularExpressionState; const T: boolean);
begin Self.Accept := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateAccept_R(Self: TniRegularExpressionState; var T: boolean);
begin T := Self.Accept; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStatePriorStates_R(Self: TniRegularExpressionState; var T: TniRegularExpressionState; const t1: integer);
begin T := Self.PriorStates[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStatePriorStateCount_R(Self: TniRegularExpressionState; var T: integer);
begin T := Self.PriorStateCount; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateStateNumber_R(Self: TniRegularExpressionState; var T: integer);
begin T := Self.StateNumber; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateGroupFinish_W(Self: TniRegularExpressionState; const T: TniRegularExpressionState);
begin Self.GroupFinish := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateGroupFinish_R(Self: TniRegularExpressionState; var T: TniRegularExpressionState);
begin T := Self.GroupFinish; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateGroupStart_W(Self: TniRegularExpressionState; const T: TniRegularExpressionState);
begin Self.GroupStart := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateGroupStart_R(Self: TniRegularExpressionState; var T: TniRegularExpressionState);
begin T := Self.GroupStart; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateStateType_R(Self: TniRegularExpressionState; var T: TniRegularExpressionStateType);
begin T := Self.StateType; end;

(*----------------------------------------------------------------------------*)
Procedure TniRegularExpressionStateRemoveTransitionTo1_P(Self: TniRegularExpressionState;  oState : TniRegularExpressionState);
Begin Self.RemoveTransitionTo(oState); END;

(*----------------------------------------------------------------------------*)
Procedure TniRegularExpressionStateRemoveTransitionTo_P(Self: TniRegularExpressionState;  oState : TniRegularExpressionState; xCharacters : TCharset);
Begin Self.RemoveTransitionTo(oState, xCharacters); END;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatchText_R(Self: TniRegularExpressionMatch; var T: string);
begin T := Self.Text; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatchLength_R(Self: TniRegularExpressionMatch; var T: integer);
begin T := Self.Length; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatchStart_R(Self: TniRegularExpressionMatch; var T: integer);
begin T := Self.Start; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatcherFlags_W(Self: TniRegularExpressionMatcher; const T: TniRegularExpressionMatchFlags);
begin Self.Flags := T; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatcherFlags_R(Self: TniRegularExpressionMatcher; var T: TniRegularExpressionMatchFlags);
begin T := Self.Flags; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatcherFinish_R(Self: TniRegularExpressionMatcher; var T: integer);
begin T := Self.Finish; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatcherStart_R(Self: TniRegularExpressionMatcher; var T: integer);
begin T := Self.Start; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatcherStatus_R(Self: TniRegularExpressionMatcher; var T: TniRegularExpressionMatchResult);
begin T := Self.Status; end;

(*----------------------------------------------------------------------------*)
Procedure TniRegularExpressionMatcherFindMatches1_P(Self: TniRegularExpressionMatcher;  const sString : string; iStart : integer; xNotify : TniRegularExpressionMatchFoundEvent);
Begin Self.FindMatches(sString, iStart, xNotify); END;

(*----------------------------------------------------------------------------*)
Procedure TniRegularExpressionMatcherFindMatches_P(Self: TniRegularExpressionMatcher;  const sString : string; xNotify : TniRegularExpressionMatchFoundEvent);
Begin Self.FindMatches(sString, xNotify); END;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStartState_R(Self: TniRegularExpression; var T: TniRegularExpressionState);
begin T := Self.StartState; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatches_R(Self: TniRegularExpression; var T: TniRegularExpressionMatch; const t1: integer);
begin T := Self.Matches[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionMatchCount_R(Self: TniRegularExpression; var T: integer);
begin T := Self.MatchCount; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStates_R(Self: TniRegularExpression; var T: TniRegularExpressionState; const t1: integer);
begin T := Self.States[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionStateCount_R(Self: TniRegularExpression; var T: integer);
begin T := Self.StateCount; end;

(*----------------------------------------------------------------------------*)
procedure TniRegularExpressionExpression_R(Self: TniRegularExpression; var T: string);
begin T := Self.Expression; end;

(*----------------------------------------------------------------------------*)
Function TniRegularExpressionMatch1_P(Self: TniRegularExpression;  const sString : string; iStart : integer) : TniRegularExpressionMatchResult;
Begin Result := Self.Match(sString, iStart); END;

(*----------------------------------------------------------------------------*)
Function TniRegularExpressionMatch_P(Self: TniRegularExpression;  const sString : string) : TniRegularExpressionMatchResult;
Begin Result := Self.Match(sString); END;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TniTestRegularExpression(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TniTestRegularExpression) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TniRegularExpressionTransition(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TniRegularExpressionTransition) do
  begin
    RegisterConstructor(@TniRegularExpressionTransition.Create, 'Create');
    RegisterMethod(@TniRegularExpressionTransition.AddCharacters, 'AddCharacters');
    RegisterMethod(@TniRegularExpressionTransition.Description, 'Description');
    RegisterPropertyHelper(@TniRegularExpressionTransitionSource_R,nil,'Source');
    RegisterPropertyHelper(@TniRegularExpressionTransitionDestination_R,nil,'Destination');
    RegisterPropertyHelper(@TniRegularExpressionTransitionCharacters_R,@TniRegularExpressionTransitionCharacters_W,'Characters');
    RegisterPropertyHelper(@TniRegularExpressionTransitionLambda_R,@TniRegularExpressionTransitionLambda_W,'Lambda');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TniRegularExpressionState(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TniRegularExpressionState) do
  begin
    RegisterConstructor(@TniRegularExpressionState.Create, 'Create');
    RegisterMethod(@TniRegularExpressionState.AddTransitionTo, 'AddTransitionTo');
    RegisterMethod(@TniRegularExpressionState.AddLambdaTransitionTo, 'AddLambdaTransitionTo');
    RegisterMethod(@TniRegularExpressionStateRemoveTransitionTo_P, 'RemoveTransitionTo');
    RegisterMethod(@TniRegularExpressionStateRemoveTransitionTo1_P, 'RemoveTransitionTo1');
    RegisterMethod(@TniRegularExpressionState.GetTransitionsOn, 'GetTransitionsOn');
    RegisterMethod(@TniRegularExpressionState.GetOnlyTransitionOn, 'GetOnlyTransitionOn');
    RegisterMethod(@TniRegularExpressionState.FindImmediateTransitionOn, 'FindImmediateTransitionOn');
    RegisterMethod(@TniRegularExpressionState.MakeCaseInsensitive, 'MakeCaseInsensitive');
    RegisterMethod(@TniRegularExpressionState.CheckIfAccept, 'CheckIfAccept');
    RegisterMethod(@TniRegularExpressionState.RemoveLambdaTransitions, 'RemoveLambdaTransitions');
    RegisterMethod(@TniRegularExpressionState.MakeDeterministic, 'MakeDeterministic');
    RegisterMethod(@TniRegularExpressionState.MarkReachable, 'MarkReachable');
    RegisterMethod(@TniRegularExpressionState.EqualState, 'EqualState');
    RegisterMethod(@TniRegularExpressionState.ContainsTransition, 'ContainsTransition');
    RegisterMethod(@TniRegularExpressionState.ChangeEntryTransitions, 'ChangeEntryTransitions');
    RegisterMethod(@TniRegularExpressionState.RedirectTransition, 'RedirectTransition');
    RegisterMethod(@TniRegularExpressionState.CalculateFirstSet, 'CalculateFirstSet');
    RegisterMethod(@TniRegularExpressionState.IsDFAState, 'IsDFAState');
    RegisterMethod(@TniRegularExpressionState.GetSuccessor, 'GetSuccessor');
    RegisterMethod(@TniRegularExpressionState.CanStart, 'CanStart');
    RegisterMethod(@TniRegularExpressionState.Name, 'Name');
    RegisterMethod(@TniRegularExpressionState.DumpDescription, 'DumpDescription');
    RegisterMethod(@TniRegularExpressionState.AddState, 'AddState');
    RegisterMethod(@TniRegularExpressionState.Closure, 'Closure');
    RegisterMethod(@TniRegularExpressionState.ContainsState, 'ContainsState');
    RegisterPropertyHelper(@TniRegularExpressionStateStateType_R,nil,'StateType');
    RegisterPropertyHelper(@TniRegularExpressionStateGroupStart_R,@TniRegularExpressionStateGroupStart_W,'GroupStart');
    RegisterPropertyHelper(@TniRegularExpressionStateGroupFinish_R,@TniRegularExpressionStateGroupFinish_W,'GroupFinish');
    RegisterPropertyHelper(@TniRegularExpressionStateStateNumber_R,nil,'StateNumber');
    RegisterPropertyHelper(@TniRegularExpressionStatePriorStateCount_R,nil,'PriorStateCount');
    RegisterPropertyHelper(@TniRegularExpressionStatePriorStates_R,nil,'PriorStates');
    RegisterPropertyHelper(@TniRegularExpressionStateAccept_R,@TniRegularExpressionStateAccept_W,'Accept');
    RegisterPropertyHelper(@TniRegularExpressionStateModified_R,@TniRegularExpressionStateModified_W,'Modified');
    RegisterPropertyHelper(@TniRegularExpressionStateReachable_R,@TniRegularExpressionStateReachable_W,'Reachable');
    RegisterPropertyHelper(@TniRegularExpressionStateTransitionCount_R,nil,'TransitionCount');
    RegisterPropertyHelper(@TniRegularExpressionStateTransitions_R,nil,'Transitions');
    RegisterPropertyHelper(@TniRegularExpressionStateMarked_R,@TniRegularExpressionStateMarked_W,'Marked');
    RegisterPropertyHelper(@TniRegularExpressionStateFingerPrint_R,@TniRegularExpressionStateFingerPrint_W,'FingerPrint');
    RegisterPropertyHelper(@TniRegularExpressionStateStateCount_R,nil,'StateCount');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TniRegularExpressionMatch(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TniRegularExpressionMatch) do
  begin
    RegisterConstructor(@TniRegularExpressionMatch.Create, 'Create');
    RegisterPropertyHelper(@TniRegularExpressionMatchStart_R,nil,'Start');
    RegisterPropertyHelper(@TniRegularExpressionMatchLength_R,nil,'Length');
    RegisterPropertyHelper(@TniRegularExpressionMatchText_R,nil,'Text');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TniRegularExpressionMatcher(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TniRegularExpressionMatcher) do
  begin
    RegisterConstructor(@TniRegularExpressionMatcher.Create, 'Create');
    RegisterMethod(@TniRegularExpressionMatcherFindMatches_P, 'FindMatches');
    RegisterMethod(@TniRegularExpressionMatcherFindMatches1_P, 'FindMatches1');
    RegisterPropertyHelper(@TniRegularExpressionMatcherStatus_R,nil,'Status');
    RegisterPropertyHelper(@TniRegularExpressionMatcherStart_R,nil,'Start');
    RegisterPropertyHelper(@TniRegularExpressionMatcherFinish_R,nil,'Finish');
    RegisterPropertyHelper(@TniRegularExpressionMatcherFlags_R,@TniRegularExpressionMatcherFlags_W,'Flags');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TniRegularExpression(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TniRegularExpression) do
  begin
    RegisterConstructor(@TniRegularExpression.Create, 'Create');
    RegisterMethod(@TniRegularExpression.CreateGlobber, 'CreateGlobber');
    RegisterMethod(@TniRegularExpressionMatch_P, 'Match');
    RegisterMethod(@TniRegularExpressionMatch1_P, 'Match1');
    RegisterMethod(@TniRegularExpression.DumpStateTable, 'DumpStateTable');
    RegisterMethod(@TniRegularExpression.NewState, 'NewState');
    RegisterMethod(@TniRegularExpression.GetDFAState, 'GetDFAState');
    RegisterMethod(@TniRegularExpression.CalculateDFAFingerprint, 'CalculateDFAFingerprint');
    RegisterPropertyHelper(@TniRegularExpressionExpression_R,nil,'Expression');
    RegisterPropertyHelper(@TniRegularExpressionStateCount_R,nil,'StateCount');
    RegisterPropertyHelper(@TniRegularExpressionStates_R,nil,'States');
    RegisterPropertyHelper(@TniRegularExpressionMatchCount_R,nil,'MatchCount');
    RegisterPropertyHelper(@TniRegularExpressionMatches_R,nil,'Matches');
    RegisterPropertyHelper(@TniRegularExpressionStartState_R,nil,'StartState');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_niRegularExpression(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TniRegularExpression) do
  with CL.Add(TniRegularExpressionState) do
  with CL.Add(TniRegularExpressionTransition) do
  with CL.Add(TniRegularExpressionMatch) do
  with CL.Add(EniRegularExpressionError) do
  RIRegister_TniRegularExpression(CL);
  RIRegister_TniRegularExpressionMatcher(CL);
  RIRegister_TniRegularExpressionMatch(CL);
  RIRegister_TniRegularExpressionState(CL);
  RIRegister_TniRegularExpressionTransition(CL);
  RIRegister_TniTestRegularExpression(CL);
end;

 
 
{ TPSImport_niRegularExpression }
(*----------------------------------------------------------------------------*)
procedure TPSImport_niRegularExpression.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_niRegularExpression(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_niRegularExpression.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_niRegularExpression(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
