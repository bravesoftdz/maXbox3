{ ****************************************************************
  sourcefile :    fMain.pas
  typ :  	        boundary-Unit
  author :  	    RemObjects, max kleiner, LoC's 1005
  description :   handles scriptloading and user events	�gung
  classes :	      see ModelMaker ps#12
  specials : 	    cooperates with uPS* units/ namespace
  revisions :     20.07.04 build menu structure
		              22.07.04 enlarge register functions
                  10.08.04 options menu, 3 file examples
                  28.08.04 kylix 2 branch, checked uses
                  10.01.05 show & save bytecode in memo
                  23.01.05 rebuild, save handling d6 from kylix2
                  30.01.05 initial dir, pascal analyzer checks
                  08.08.05 clx corrections
                  10.01.06 add random, pos, sleep, delete, max in kernel
                  07.07.06 line numbers in editor
                  19.07.06 OOP extensions, search and inc in kernel
                  20.07.06 line numbers read only
                  21.07.06 ini file read & write
                  11.11.07 SynEdit, timer events, showmessage and oop examples
                  12.12.07 Search & Replace functions   locs = 766
                  26.04.08 findfirst extension & save the monitor,locs = 812
                  04.05.08 random2, fileexists as double, now string,locs = 836
                  13.10.08 filename with *.txt, drag n drop super function
                  19.10.08 include file, print func, comp messages,locs= 970
                  08.04.09 ln, tsearchrec, now2, extract func, timer, locs 1005
                  05.10.09 V2.7 include tstringgrid and treeview, func max3,
                   reversestring, linenumbers, tabs, statusline, locs = 1136
                  09.10.09 timer, datetimefunctions, less plugin, locs= 1166
                  12.10.09 mathmax lib, lastfile and savefile, locs= 1205
                  V 2.7.1  compiledebug, executedebug, decompile, mp3 locs=1551
                  22.01.10 V 2.8 debug checks, assign2, history file in ini
                  29.01.10 CLX version on qtinterface for Linux
 ****************************************************************** }

unit fMain;

interface

uses
  QForms, SysUtils, uPSComponent, uPSCompiler, uPSRuntime, QMenus,
  Classes, QExtCtrls, QControls, QStdCtrls,  QSynEditHighlighter,
  QSynEdit, QSynMemo, QSynEditMiscClasses, QSynEditSearch,
  QButtons, QDialogs, uPSComponent_Default,
  uPSComponent_Controls, SynCompletionProposal, QSynEditAutoComplete,
  QImgList, QComCtrls, QGraphics, uPSDebugger, uPSDisassembly,
  uPSComponent_StdCtrls, uPSComponent_Forms, uPSComponent_COM,
  QSynEditPrint, QTypes, QSynHighlighterPas; //, jpeg;

const
  {alias to bytecode.txt}
   BYTECODE = 'bytecode.txt';
   PSTEXT = 'PS Textfiles (*.txt)';
   DEFFILENAME = 'firstdemo.txt';
   DEFINIFILE = 'maxboxdef.ini';
   MB_VERSION = '2.8';
   MXSITE = 'http://www.softwareschule.ch/maxbox.htm';
   MXMAIL = 'max@kleiner.com';
   TAB = #$09;
   CODECOMPLETION ='bds_delphi.dci';

type
  TMaxForm1 = class(TForm)
    memo2: TMemo;
    Splitter1: TSplitter;
    PSScript: TPSScript;
    PS3DllPlugin: TPSDllPlugin;
    MainMenu1: TMainMenu;
    Program1: TMenuItem;
    Compile1: TMenuItem;
    Files1: TMenuItem;
    open1: TMenuItem;
    Save2: TMenuItem;
    Options1: TMenuItem;
    Savebefore1: TMenuItem;
    Largefont1: TMenuItem;
    sBytecode1: TMenuItem;
    Saveas3: TMenuItem;
    Clear1: TMenuItem;
    Slinenumbers1: TMenuItem;
    About1: TMenuItem;
    Search1: TMenuItem;
    SynPasSyn1: TSynPasSyn;
    memo1: TSynMemo;
    SynEditSearch1: TSynEditSearch;
    WordWrap1: TMenuItem;
    //XPManifest1: TXPManifest;
    SearchNext1: TMenuItem;
    Replace1: TMenuItem;
    PSImport_Controls1: TPSImport_Controls;
    PSImport_Classes1: TPSImport_Classes;
    ShowInclude1: TMenuItem;
    SynEditPrint1: TSynEditPrint;
    Printout1: TMenuItem;
    mnPrintColors1: TMenuItem;
    //dlgFilePrint: TPrintDialog;
    dlgPrintFont1: TFontDialog;
    mnuPrintFont1: TMenuItem;
    Include1: TMenuItem;
    UpdateView1: TMenuItem;
    CodeCompletionList1: TMenuItem;
    IncludeList1: TMenuItem;
    ImageList1: TImageList;
    ImageList2: TImageList;
    statusBar1: TStatusBar;
    SaveOutput1: TMenuItem;
    ExportClipboard1: TMenuItem;
    Close1: TMenuItem;
    Manual1: TMenuItem;
    About2: TMenuItem;
    loadLastfile1: TMenuItem;
    //imglogo: TImage;
    cedebug: TPSScriptDebugger;
    debugPopupMenu1: TPopupMenu;
    BreakPointMenu: TMenuItem;
    Decompile1: TMenuItem;
    N2: TMenuItem;
    StepInto1: TMenuItem;
    StepOut1: TMenuItem;
    Reset1: TMenuItem;
    N3: TMenuItem;
    DebugRun1: TMenuItem;
    //PSImport_ComObj1: TPSImport_ComObj;
    PSImport_StdCtrls1: TPSImport_StdCtrls;
    PSImport_Forms1: TPSImport_Forms;
    PSImport_DateUtils1: TPSImport_DateUtils;
    PascalScript1: TMenuItem;
    ExporttoClipboard1: TMenuItem;
    ImportfromClipboard1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ImportfromClipboard2: TMenuItem;
    tutorial1: TMenuItem;
    N7: TMenuItem;
    ShowSpecChars1: TMenuItem;
    maxpanel: TPanel;
    spload: TSpeedButton;
    spcompile: TSpeedButton;
    spsearch: TSpeedButton;
    imglogo: TImage;
    spreplace: TSpeedButton;
    procedure IFPS3ClassesPlugin1CompImport(Sender: TObject;
                                              x: TPSPascalCompiler);
    procedure IFPS3ClassesPlugin1ExecImport(Sender: TObject; Exec: TPSExec;
                                              x: TPSRuntimeClassImporter);
    procedure PSScriptCompile(Sender: TPSScript);
    procedure Compile1Click(Sender: TObject);
    procedure PSScriptExecute(Sender: TPSScript);
    procedure open1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Savebefore1Click(Sender: TObject);
    procedure Largefont1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBytecode1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Saveas3Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Slinenumbers1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1ReplaceText(Sender: TObject; const ASearch,
      AReplace: String; Line, Column: Integer; var Action: TSynReplaceAction);
    procedure Memo1StatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure WordWrap1Click(Sender: TObject);
    procedure SearchNext1Click(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    function PSScriptNeedFile(Sender: TObject; const OrginFileName: String;
      var FileName, Output: String): Boolean;
    procedure ShowInclude1Click(Sender: TObject);
    procedure Printout1Click(Sender: TObject);
    procedure mnuPrintFont1Click(Sender: TObject);
    procedure Include1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpdateView1Click(Sender: TObject);
    procedure CodeCompletionList1Click(Sender: TObject);
    procedure SaveOutput1Click(Sender: TObject);
    procedure ExportClipboard1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Manual1Click(Sender: TObject);
    procedure LoadLastFile1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Decompile1Click(Sender: TObject);
    procedure StepInto1Click(Sender: TObject);
    procedure StepOut1Click(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
    procedure cedebugAfterExecute(Sender: TPSScript);
    procedure cedebugBreakpoint(Sender: TObject; const FileName: String;
      Position, Row, Col: Cardinal);
    procedure cedebugCompile(Sender: TPSScript);
    procedure cedebugExecute(Sender: TPSScript);
    procedure cedebugIdle(Sender: TObject);
    procedure cedebugLineInfo(Sender: TObject; const FileName: String;
      Position, Row, Col: Cardinal);
    procedure Memo1SpecialLineColors(Sender: TObject; Line: Integer;
      var Special: Boolean; var FG, BG: TColor);
    procedure BreakPointMenuClick(Sender: TObject);
    procedure DebugRun1Click(Sender: TObject);
    procedure PascalScript1Click(Sender: TObject);
    procedure ImportfromClipboard1Click(Sender: TObject);
    procedure ImportfromClipboard2Click(Sender: TObject);
    procedure tutorial1Click(Sender: TObject);
    procedure ShowSpecChars1Click(Sender: TObject);
    //procedure Memo1DropFiles(Sender: TObject; X,Y: Integer; AFiles: TStrings);
  private
    STATSavebefore: boolean;
    STATShowBytecode: boolean;
    STATInclude: boolean;
    STATEdchanged: boolean;
    Act_Filename: string[255];
    Def_FName: string[255];
    last_fName: string[255];
    last_fontsize: byte;
    fileextension: string[12];
    fPrintOut: TSynEditPrint;
    tmpWriteStr: string;
    fAutoComplete: TSynAutoComplete;
    fActiveLine: Longint;
    fResume: Boolean;
    function CompileDebug: Boolean;
    function ExecuteDebug: Boolean;
    procedure showandSaveBCode(const bdata: string);
    procedure lineToNumber(met: boolean);
    procedure defFileread;
    procedure SaveFileOptionsToIni(const filen: string);
    procedure LoadFileNameFromIni;
    function GetClientTop: integer;
    function UpdateFindtext: string;
    procedure FindNextText(Sender: TObject);
    procedure ReplaceNextText(Sender: TObject);
    //procedure WMDROP_THEFILES(var message: TWMDROPFILES); message WM_DROPFILES;
  public
    { Public declarations }
  end;

var
  maxForm1: TMaxForm1;

implementation

{$R *.dfm}

uses
  uPSR_std,
  uPSC_std,
  uPSR_stdctrls,
  uPSC_stdctrls,
  uPSR_forms,
  uPSC_forms,
  uPSC_graphics,
  uPSC_controls,
  uPSC_classes,
  uPSR_graphics,
  uPSR_controls,
  uPSR_extctrls,
  uPSC_extctrls,
  uPSC_dateutils,
  uPSR_dateutils,
  uPSI_MathMax,
  uPSR_menus,
  //uPSC_grids,
  uPSR_classes,
  infobox1,
  //IFSI_Tetris1,
  IFSI_WinForm1puzzle,
  //dlgSearchText,
  QSynEditTypes, ConfirmReplDlg, FindReplDlg, Libc,
  QSynEditKeyCmds,
  ide_debugoutput, Types;
  //ToolWin; Types, Grids

resourcestring
  RCReplace = 'Replace this occurrence'#13'of "%s"'#13+'by "%s"?';
  RCSTRMB ='maXbox ';
  RCPRINTFONT ='Courier New';
  FILELOAD = ' File loaded';
  BEFOREFILE = ' last File set';

const
  DefSynEditOptions = [eoDragDropEditing,
  eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoScrollPastEol,
  eoGroupUndo, eoTrimTrailingSpaces, eoTabstoSpaces, eoAutoIndent, eoDropFiles];

var
  srec: TSearchRec;
  f: TextFile;

procedure TMaxForm1.IFPS3ClassesPlugin1CompImport(Sender: TObject;
  x: TIFPSPascalcompiler);
begin
  SIRegister_Std(x);
  SIRegister_Classes(x, true);
  SIRegister_Graphics(x, true);
  SIRegister_Controls(x);
  SIRegister_stdctrls(x);
  SIRegister_extctrls(x);
  SIRegister_Forms(x);
  //added puzzle in IFSI_winform1puzzle
  SIRegister_TwinFormp(x);
  SIRegister_TMyLabel(x);
  SIRegister_WinForm1(x);
  RegisterDateTimeLibrary_C(x);
  SIRegister_EInvalidArgument(x);
  SIRegister_MathMax(x);
end;

procedure TMaxForm1.IFPS3ClassesPlugin1ExecImport(Sender: TObject; Exec: TIFPSExec;
  x: TIFPSRuntimeClassImporter);
begin
  //procedure RIRegister_ExtCtrls(cl: TPSRuntimeClassImporter);
  RIRegister_Std(x);
  RIRegister_Classes(x, True);
  RIRegister_Graphics(x, True);
  RIRegister_Controls(x);
  RIRegister_stdctrls(x);
  RIRegister_extctrls(x);
  RIRegister_Forms(x);
  //RIRegister_Grids(x);
  //added puzzle in IFSI_winform1puzzle
  RIRegister_TwinFormp(x);
  RIRegister_TMyLabel(x);
  RIRegister_WinForm1(x);
  RegisterDateTimeLibrary_R(exec);
  RIRegister_EInvalidArgument(x);
  RIRegister_MathMax_Routines(exec);
end;

procedure TMaxForm1.FormCreate(Sender: TObject);
//var
  //Plugin: TPSPlugin;
begin
  self.Height:= 825;
  self.Width:= 950;
  STATEdchanged:= false;
  memo1.Options:= memo1.Options + [eoDropFiles];
  //dragAcceptFiles(maxForm1.Handle, True );
  memo2.Height:= 175;
  memo2.WordWrap:= true;
  //Plugin:= TPSImport_Winform1.create(self);
  //TPSPluginItem(psscript.plugins.add).plugin:= Plugin;
  //cedebug.Plugins:= psscript.Plugins.
  cedebug.OnCompile:= PSScriptCompile;
  cedebug.OnExecute:= cedebugExecute; //!! independent from main execute
  //memo1.Options:= DefSynEditOptions;
  memo1.Highlighter:= SynPasSyn1;
  memo1.Gutter.ShowLineNumbers:= true;
  memo1.WantTabs:= true;
  if fileexists(DEFINIFILE) then LoadFileNameFromIni;
  defFileread; //beta
  PSScript.UsePreProcessor:= true;
  fPrintOut:= TSynEditPrint.Create(Self);
  fPrintOut.Font.Name:= RCPRINTFONT;
  //fAutoComplete.Editor := TCustomSynEdit(SynPasSyn1);
  //stringGrid1:= TStringGrid.create(self);
  {if Application.MainForm = NIL then begin
    fAutoComplete:= TSynAutoComplete.Create(Self);
    fAutoComplete.Editor:= memo1;
  if fileexists('bds_delphi.dci') then
    fAutoComplete.AutoCompleteList.LoadFromFile('bds_delphi.dci') else
      showmessage('maXbox: a bds_delphi.dci file is missing(code completion)');
  end else
    maxForm1.fAutoComplete.AddEditor(memo1);}
  memo1.AddKey(ecAutoCompletion, word('J'), [ssCtrl], 0, []);
  statusbar1.simplepanel:= true;
  statusBar1.SimpleText:= MXMAIL;
  showSpecChars1.Checked:= false;
  debugoutput:= Tdebugoutput.Create(self);
  PSImport_Forms1.EnableMenus:= false;
end;

procedure TMaxForm1.FormActivate(Sender: TObject);
begin
  STATSavebefore:= true;
  STATInclude:= true;
    //idLogDebug1.Active:= true;
  if fileexists(DEFFILENAME) then
    Def_FName:= DEFFILENAME else begin
      memo1.Lines.SaveToFile(DEFFILENAME);
      memo2.Lines.Add('intern ' +DEFFILENAME + FILELOAD);
  end;
  memo1.SetFocus;
  // saved with line numbers and check the state before
  if pos(inttostr(1), memo1.lines.Strings[1]) <> 0 then
                                Slinenumbers1.Checked:= true;
  if last_fontsize = 14 then Largefont1.checked:= true;
end;

function ImportTest(const s1:string; s2:Longint; s3:Byte; s4:word; var s5:string): string;
begin
  Result:= s1 +' '+ IntToStr(s2)+ ' '+ IntToStr(s3)+ ' ' + IntToStr(s4)+ 'OK!';
  s5:= s5 + ' '+ result + ' -   OK2!';
end;

function myrandom(const arnd: integer): integer;
begin
  result:= Random(arnd);
end;

function myrandom2(arnd: integer): real;
begin
  if arnd > 0 then
    result:= Random(arnd)
  else result:= Random;
end;

function myASCtoChar(const a: byte): char;
begin
  result:= chr(a);
end;

procedure myMessageBox(const mytext: string);
begin
  showmessage(mytext)
end;

procedure myRandomize;
begin
  Randomize;
end;

procedure MyWriteln(const sln: string);
begin
  maxForm1.tmpWriteStr:='';
  maxForm1.memo2.Lines.Add(sln);
end;

procedure MyWrite(const s: string);
var idx: integer;
begin
  //maxForm1.tmpWriteStr:='';
  maxForm1.tmpWriteStr:= maxForm1.tmpWriteStr +' '+s;
  idx:= maxForm1.memo2.Lines.add(maxForm1.tmpWriteStr);
  maxForm1.memo2.Lines.Delete(idx - 1);
  //ShowMessage('Column One' + TAB + 'Column Two' + TAB + 'Column Three');
end;

function MyReadln(const question: string): string;
begin
  Result:= InputBox(question, RCSTRMB, '');
end;

procedure mySleep(vmsec: cardinal);
begin
  if vmsec > 1 then
    sleep(vmsec);
end;

procedure myInc(var x: longint);
begin
  inc(x);
end;

procedure myIncb(var x: byte);
begin
  inc(x);
end;

procedure myDec(var x: Longint);
begin
  dec(x);
end;

function myfindFirst(const filepath: string; attr: integer): integer;
begin
  result:= findFirst(filePath, Attr, srec);
  //faDirectory = $00000010;
  //faAnyFile   = $0000003F;
end;

function myfindNext: integer;
//var search: TSearchRec;
begin
  result:= findNext(srec)
end;

function mySearchRecName: string;
begin
  result:= srec.Name
end;

function mySearchRecSize: integer;
begin
  result:= srec.size
end;

function mySearchRecAttr: integer;
begin
  result:= srec.attr
end;

function mySearchRecTime: integer;
begin
  result:= srec.Time
end;

procedure myfindClose; //TSearchRec
begin
  sysutils.findClose(Srec)
end;

procedure myBeep;
begin
  sysutils.beep;
end;

function myBeep2(dwFreq: dword): boolean;
begin
  //result:= beep(dwFreq, dwDuration);
end;

procedure myplaymp3(mpath: string);
begin
   playmp3(mpath);
end;

procedure mystopmp3;
begin
  stopmp3;
end;

procedure myclosemp3;
begin
  closemp3;
end;

function myNow: string;
begin
  result:= dateTimetoStr(now);
end;

function myNow2: TDateTime;
begin
  result:= now;
end;

function myFileExists(const FileName: string): Boolean;
begin
  result:= FileExists(FileName);
end;

function myExtractFileName(const FileName: string): string;
begin
  result:= ExtractFileName(FileName);
end;

function myExtractFilePath(const FileName: string): string;
begin
  result:= ExtractFilePath(FileName);
end;

// HINST = THandle = LongWord;

{function myWinExec(FileName: pchar; ShowCmd: Integer): HINST;
begin
  result:= Windows.winExec(FileName, SW_SHOW);
end;}

procedure myAssert(expr : Boolean; const msg: string);
begin
  Assert(expr, msg);
end;

function mymax3(const x,y,z: Integer): Integer;
begin
  result:= Max3(x,y,z);
end;

procedure myreverseString(var s: String);
begin
  ReverseString(s);
end;

function mychartohexstr(value: char): string;
begin
  result:= CharToHexStr(Value);
end;

procedure myassign(mystring, mypath: string); //v2.8
begin
  AssignFile(f, mypath);
  Rewrite(f);
  WriteLn(f, mystring);
  CloseFile(f);
end;

function myreset(mypath: string): string;
begin
  AssignFile(f, mypath);
  Reset(f);
  while not EOF(f) do
    ReadLN(f,result);
  CloseFile(f)
end;

// how to add function into the engine:
{procedure TPSPascalCompiler.DefineStandardProcedures;
  in upscompiler.pas
 line 11618
 AddFunction('function max(a: integer; b: integer): integer;');
  in upsruntime.pas
  procedure TPSExec.RegisterStandardProcs;
 line 8183
 RegisterFunctionName('MAX', DefProc, Pointer(50), nil);
 function DefProc(Caller: TPSExec; p: TPSExternalProcRec; Global, Stack:
                                                TPSStack): Boolean;
  put function on the stack and calls pointer at runtime ??
  line 7924
  50: Stack.SetInt(-1, Max(Stack.GetInt(-2), Stack.GetInt(-3)));// max
 }

procedure TMaxForm1.PSScriptCompile(Sender: TPSScript);
//var s: TSearchRec;
begin
  Sender.AddFunction(@MyWriteln, 'procedure Writeln(s: string);');
  Sender.AddFunction(@MyWrite, 'procedure Write(s: string);');
  Sender.AddFunction(@MyReadln, 'function Readln(question: string): string;');
  Sender.AddFunction(@ImportTest, 'function ImportTest(S1: string;' +
                     's2:longint; s3:Byte; s4:word; var s5:string): string;');
  // new self function
  Sender.AddFunction(@myrandom, 'function random(const a: integer): integer');
  Sender.AddFunction(@myrandom2, 'function random2(a: integer): single');
  Sender.AddFunction(@myMessageBox, 'procedure showmessage(mytext: string);');
  Sender.AddFunction(@myASCtoChar, 'function ChrA(const a: byte): char;');
  Sender.AddFunction(@myRandomize, 'procedure randomize;');
  Sender.AddFunction(@mySleep, 'procedure sleep(vmsec: cardinal);');
  Sender.AddFunction(@myInc, 'procedure Inc(var x: longint);');
  Sender.AddFunction(@myIncb, 'procedure Incb(var x: byte);');
  Sender.AddFunction(@myDec, 'procedure Dec(var x: longint);');
  Sender.AddFunction(@myfindFirst, 'function Findfirst(const filepath: string; attr: integer): integer;');
  Sender.AddFunction(@myfindNext, 'function FindNext: integer;');
  Sender.AddFunction(@myfindClose, 'procedure findClose;');
  Sender.AddFunction(@mySearchRecName, 'function SearchRecname: string;');
  Sender.AddFunction(@mySearchRecSize, 'function SearchRecsize: integer;');
  Sender.AddFunction(@mySearchRecAttr, 'function SearchRecattr: integer;');
  Sender.AddFunction(@mySearchRecTime, 'function SearchRecTime: integer;');
  Sender.AddFunction(@myBeep, 'procedure Beep');
  Sender.AddFunction(@myNow, 'function Now: string');
  Sender.AddFunction(@myNow2, 'function Now2: tDateTime');
  Sender.AddFunction(@myFileExists, 'function fileExists(const FileName: string): Boolean;');
  //Sender.AddFunction(@myShellExecute,'function ShellExecute(hWnd: HWND;' +
   //   'Operation, FileName, Parameters,Directory: pchar; ShowCmd: Integer): integer; stdcall;');
  Sender.AddFunction(@myBeep2, 'function beep2(dwFreq, dwDuration: integer): boolean;');
  //Sender.AddFunction(@myWinExec, 'function winexec(FileName: pchar; showCmd: integer): integer;');
  Sender.AddFunction(@myAssert,'procedure Assert(expr : Boolean; const msg: string);');
  Sender.AddFunction(@myExtractFileName,'function ExtractFileName(const filename: string):string;');
  Sender.AddFunction(@myExtractFilePath,'function ExtractFilePath(const filename: string):string;');
  Sender.AddFunction(@mymax3,'function Max3(const x,y,z: Integer): Integer;');
  Sender.AddFunction(@myReverseString,'procedure ReverseString(var s: String);');
  Sender.AddFunction(@myCharToHexStr, 'function CharToHexStr(Value: char): string);');
  Sender.AddFunction(@myplaymp3,'procedure playmp3(mpath: string);');
  Sender.AddFunction(@mystopmp3,'procedure stopmp3;');
  Sender.AddFunction(@myclosemp3,'procedure closemp3;');
  Sender.AddFunction(@myassign,'procedure Assign2(mystring, mypath: string);');
  Sender.AddFunction(@myreset,'function Reset2(mypath: string):string;');

  Sender.AddRegisteredVariable('Application', 'TApplication');
  Sender.AddRegisteredVariable('Self', 'TForm');
  //Sender.AddRegisteredVariable('Searchrec', 'TSearchRec');
  //Sender.AddRegisteredPTRVariable('Memo1', 'TSynMemo');
  Sender.AddRegisteredVariable('memo2', 'TMemo');
  Sender.AddRegisteredVariable('maxForm1', 'TForm');
  //Sender.AddRegisteredVariable('stringgrid1', 'TStringGrid');
  //sender.AddRegisteredVariable('puzObj','TWinFormp');
end;


procedure TMaxForm1.PSScriptExecute(Sender: TPSScript);
begin
  PSScript.SetVarToInstance('APPLICATION', Application);
  PSScript.SetVarToInstance('SELF', Self);
  //PSScript.SetPointerToData('Memo1', @Memo1, PSScript.FindNamedType('TSynMemo'));
  PSScript.SetVarToInstance('memo2', memo2);
  PSScript.SetVarToInstance('maxForm1', maxForm1);
  //PSScript.SetVarToInstance('stringgrid1', stringgrid1);
end;

// facade and mediator pattern
procedure TMaxForm1.Compile1Click(Sender: TObject);
var mybytecode: string;
  procedure OutputMessages;
  var
    l: Longint;
    b: Boolean;
    m: string;
  begin
    b:= False;
    if STATSavebefore then
      if fileexists(Act_Filename) then
        Save2Click(sender)
      else
        showMessage('Load a Pascal File first - Files Open/Save...');
    for l:= 0 to PSScript.CompilerMessageCount - 1 do begin
      m:= psscript.CompilerMessages[l].MessageToString;
      memo2.Lines.Add('PSXCompiler: '+PSScript.CompilerErrorToStr(l)+#13#10 +m);
      if (not b) and (PSScript.CompilerMessages[l] is TIFPSPascalCompilerError)
      then begin
        b:= True;
        memo1.SelStart:= PSScript.CompilerMessages[l].Pos;
      end;
    end
  end;
begin
  memo2.Lines.Clear;
  imglogo.Transparent:= false;
  lineToNumber(false);
  Slinenumbers1.Checked:= false;
  PSScript.MainFileName:= Act_Filename;
  PSScript.Script.Assign(memo1.Lines);
  cedebug.MainFileName:= Act_Filename;
  cedebug.Script.Assign(memo1.Lines);
  //showmessage(psscript.script.Text);
  memo2.Lines.Add('Compiling '+RCSTRMB +inttostr(memo1.Lines.count-1)+' lines');
  //TPSPascalCompiler transforms to bytecode
  memo2.Lines.Add('Codelines in window: '+inttoStr(memo1.LinesInWindow));
  statusBar1.SimpleText:= 'Codelines in window: '+inttoStr(memo1.LinesInWindow);
  if PSScript.Compile then begin
    OutputMessages;
    memo2.Lines.Add(RCSTRMB +extractFileName(Act_Filename)+' Compiled done: '
                                                         +dateTimetoStr(now()));
    memo2.Lines.Add('--------------------------------------------------------');
    statusBar1.SimpleText:= RCSTRMB +Act_Filename+' Compiled done: '
                                                         +dateTimetoStr(now());
    if not PSScript.Execute then begin
      memo1.SelStart := PSScript.ExecErrorPosition;
      memo2.Lines.Add(PSScript.ExecErrorToString +' at '+Inttostr(PSScript.ExecErrorProcNo)
                       +'.'+Inttostr(PSScript.ExecErrorByteCodePosition));
    end else memo2.Lines.Add('ruNMax executed on: '+dateTimetoStr(now()));
     //debug test
    memo2.Lines.add(PSScript.About);
    if STATShowBytecode then begin
      PSScript.GetCompiled(mybytecode);
      showandSaveBCode(mybytecode);
    end;
    //imglogo.Transparent:= true;
    //mybytecode:= 'memo2.Lines.Add(PSScript.ExecErrorToString +';
    //memo1.lines.add(mybytecode);
  end else begin
    OutputMessages;
    memo2.Lines.Add('Compiling Script failed');
  end
end;


procedure TMaxForm1.open1Click(Sender: TObject);
begin
  with TOpenDialog.Create(self) do begin
    Filter:= PStext;
    FileName:= '*.txt';
    defaultExt:= fileextension;
    title:= 'PascalScript File Open';
    InitialDir:= ExtractFilePath(application.ExeName)+'*.txt';
    if Act_Filename <> '' then begin
      last_fName:= Act_Filename;
      statusbar1.SimpleText:= BEFOREFILE + Act_Filename;  //beta
      loadLastfile1.Caption:= '&Load Last File'+': '+ extractFileName(last_fName);
    end;
    if execute then begin
      memo1.Lines.LoadFromFile(FileName);
      Act_Filename:= FileName;
      memo2.Lines.Add(FileName + FILELOAD);
      statusBar1.SimpleText:= FileName + FILELOAD;
    //default action
    end else if fileexists(Def_FName) then
      if MessageDlg('Welcode, do you want to load '+DEFFILENAME,
                  mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin
        memo1.Lines.LoadFromFile(Def_FName);
        memo2.Lines.Add(DEFFILENAME + FILELOAD);
        statusBar1.SimpleText:= DEFFILENAME + FILELOAD;
        Act_Filename:= Def_FName;
      end else exit;
      //raise Exception.Create('Brake File in '+RCSTRMB+':' +FileName);
    Free;
  end; //with
end;

procedure TMaxForm1.Saveas3Click(Sender: TObject);
begin
  with TSaveDialog.Create(self) do begin
    Filter:= PStext;
    //Filename:= '*.txt';
    if Act_Filename <> '' then begin
      last_fName:= Act_Filename;
      memo2.Lines.Add(last_fName + BEFOREFILE);    //beta
      loadLastfile1.Caption:= '&Load Last'+': '+ extractFileName(last_fName);
    end;
    FileName:= Act_Filename;
    defaultExt:= fileextension;
    title:= 'maXbox_FileSave';
    if execute then begin
      InitialDir:= ExtractFilePath(FileName);
      memo1.Lines.SaveToFile(FileName);
      Act_Filename:= FileName;
      memo2.Lines.Add(FileName +' stored');
      statusBar1.SimpleText:= FileName +' file stored';
      // add last file to the deffile
      SaveFileOptionsToIni(FileName);
      STATEdchanged:= false;
    end;
   Free;
  end
end;

procedure TMaxForm1.Save2Click(Sender: TObject);
begin
  if Act_Filename <> '' then begin
    memo1.Lines.SaveToFile(Act_Filename);
    memo2.Lines.Add(Act_Filename +' file stored');
    SaveFileOptionsToIni(Act_Filename);
    STATEdchanged:= false;
  end else
    Saveas3Click(sender);
end;

procedure TMaxForm1.Savebefore1Click(Sender: TObject);
begin
 Savebefore1.Checked:= not Savebefore1.Checked;
 if Savebefore1.Checked then STATSavebefore:= true else
   STATSavebefore:= false;
end;

{procedure TMaxForm1.WMDROP_THEFILES(var message: TWMDROPFILES);
const
  MAXCHARS = 254;
var
  hDroppedFile: tHandle;
  bFilename: array[0..MAXCHARS] of char;
begin
   hDroppedFile:= message.Drop;
   if STATedchanged then begin
     sysutils.beep;
     if MessageDlg(RCSTRMB+ ': Save Code Changes now?',
                  mtConfirmation, [mbYes,mbNo], 0) = mrYes then
       Save2Click(self)
     end else
       STATEdchanged:= false;
   last_fName:= Act_Filename;
   memo2.Lines.Add(last_fName + BEFOREFILE);    //beta
   loadLastfile1.Caption:= '&Load Last File' +': '+ extractFileName(last_fName);
   with Memo1 do begin
     Lines.clear;
     //Grab the name of a dropped file
     dragQueryFile(hDroppedFile, 0, @bFilename, sizeOf(bFilename));
     Lines.loadFromFile(StrPas(bFilename));
   end;
   Act_Filename:= bFilename;
   memo2.Lines.Add(bFileName + FILELOAD);
   statusBar1.SimpleText:= bFileName +' drag&drop' +FILELOAD;
   //release memory.
   dragFinish(hDroppedFile );
end;}

procedure TMaxForm1.Largefont1Click(Sender: TObject);
begin
  Largefont1.checked:= not Largefont1.Checked;
  if Largefont1.Checked then begin
    memo1.Font.Size:= 14;
    memo2.Font.Size:= 14;
    last_fontsize:= 14;
  end else begin
    memo1.Font.Size:= 10;
    memo2.Font.Size:= 10;
    last_fontsize:= 10;
  end
end;

procedure TMaxForm1.showandSaveBCode(const bdata: string);
var locstr, outfile: string;
    i: integer;
    fx: longint;
    //szBuffer: array[0..900] of Char;
begin
 //numWritten:= 0;
 outfile:= ExtractFilePath(paramstr(0))+ BYTECODE;
 fx:= filecreate(outfile);
 fileWrite(fx, bdata[1], length(bdata));
 fileClose(fx);
 //AssignFile(f, BYTECODE);
 //{$I-}
 //Rewrite(f,1);
 //{$I+}
 //PSScript.SetCompiled(bdata);
 //CloseFile(f);
 //memo2.WordWrap:= true;
 memo2.Lines.Add('');
 memo2.Lines.Add('-----'+BYTECODE+'-----');
 memo2.Lines.Add('-----PS BYTECODE-----');
 memo2.Lines.Add('-----BYTECODE saved as bytecode.txt-----');
 for i:= 1 to length(bdata) do begin
   //bdata:= bdata + bdata[i];
   //StrpCopy(szBuffer, bdata);
   locstr:= locstr + bdata[i];
   if i mod 20 = 0 then begin
     memo2.Lines.Add(locstr);
     locstr:= '';
     //delete(locstr, 80, length(locstr)-80);  //after cut
     //memo2.Lines.add((locstr)); //delete(bdata, 1, 79); //before cut
   end;
 end;
   //if (length(bdata) < 80) then begin
     //delete(locstr, i, length(locstr));
     //break;
   //end;
end;

procedure TMaxForm1.SBytecode1Click(Sender: TObject);
begin
 sBytecode1.Checked:= not sBytecode1.Checked;
 if sBytecode1.Checked then STATShowBytecode:= true else
   STATShowBytecode:= false;
end;

procedure TMaxForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure TMaxForm1.Clear1Click(Sender: TObject);
begin
  if MessageDlg('Welcode to '+RCSTRMB+ ' Clear code memo now?',
    mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin
    last_fName:= Act_Filename;
    loadLastfile1.Caption:= '&Load Last File'+': '+ extractFileName(last_fName);
    memo1.Lines.Clear;
    memo1.lines.Add('---code_cleared_checked---');
    STATEdchanged:= false;
    Act_Filename:= '';
  end
end;

procedure TMaxForm1.lineToNumber(met: boolean);
var i: integer;
  mypos: integer;
  mystr: string[250];
begin
  if met then
  for i:= 1 to memo1.Lines.Count - 1 do begin
    memo1.Lines.Strings[i]:= inttostr(i)+' '+memo1.Lines.Strings[i];
    memo1.readonly:= true;
    memo1.Font.Style:= [fsBold];
  end
  // check if linenumber was on before
  else if pos(inttostr(1), memo1.lines.Strings[1]) <> 0 then begin
    for i:= 1 to memo1.Lines.Count - 1 do begin
      mypos:= pos(inttostr(i), memo1.lines.Strings[i]);
      if pos(inttostr(i), memo1.lines.Strings[i]) <> 0 then begin
        mystr:= memo1.Lines.Strings[i];
        delete(mystr, mypos, (length(inttostr(i))+1));
        memo1.Lines.Strings[i]:= mystr;
      end;
    end;
    memo1.readonly:= false;
    memo1.Font.Style:=[];
  end;
end;


procedure TMaxForm1.Slinenumbers1Click(Sender: TObject);
begin
  if Slinenumbers1.Checked then lineToNumber(true)
    else lineToNumber(false)
end;

procedure TMaxForm1.defFileread;
var deflist: TStringlist;
     filepath, fN: string;
begin
deflist:= TStringlist.create;
filepath:= ExtractFilePath(Application.ExeName);
  try
    fN:= filepath+ DEFINIFILE;
    if fileexists(fN) then begin
      deflist.LoadFromFile(fN);
      last_fName:= (deflist.Values['PRELAST_FILE']);
      loadLastfile1.Caption:= '&Load Last'+': '+ extractFileName(last_fName);
      last_fontsize:= strtoint((deflist.values['FONTSIZE']));
      memo1.Font.Size:= last_fontsize;
      memo2.Font.Size:= last_fontsize;
      fileextension:= deflist.Values['EXTENSION'];
      self.Height:= strtoint(deflist.Values['SCREENY']);
      self.Width:= strtoInt(deflist.values['SCREENX']);
      memo2.Height:= strToInt(deflist.Values['MEMHEIGHT']);
      if deflist.Values['LINENUMBERS'] = 'Y' then
      memo1.Gutter.ShowLineNumbers:= true
        else memo1.Gutter.ShowLineNumbers:= false;
    end else begin
      // init values case of no file
      deflist.add('//***Definitions for ' +RCSTRMB+MB_VERSION+' ***');
      deflist.values['LAST_FILE']:= DEFFILENAME; //Def_FName;
      deflist.values['PRELAST_FILE']:= DEFFILENAME; //Def_FName;
      deflist.values['FONTSIZE']:= '10';
      deflist.values['EXTENSION']:= 'txt';
      deflist.Values['SCREENX']:= '950';
      deflist.Values['SCREENY']:= '825';
      deflist.Values['MEMHEIGHT']:= '175';
      deflist.Values['PRINTFONT']:= 'Courier New';
      deflist.Values['LINENUMBERS']:= 'Y';
      deflist.SaveToFile(fN);
    end;
  finally
    deflist.Free
 end;
end;


procedure TMaxForm1.SaveFileOptionsToIni(const filen: string);
var filepath, fN: string;
begin
 filepath:= ExtractFilePath(Application.ExeName);
 fN:= filepath+ DEFINIFILE;
 if fileexists(fN) then begin
   with TStringlist.Create do begin
     LoadFromFile(fN);
     Values['LAST_FILE']:= filen;
     Values['PRELAST_FILE']:= last_fName;
     Values['FONTSIZE']:= inttoStr(last_fontsize);
     Values['SCREENY']:= inttostr(maxForm1.height);
     Values['SCREENX']:= inttoStr(maxForm1.Width);
     Values['MEMHEIGHT']:= inttoStr(memo2.height);
     SaveToFile(fN);
     Free;
   end;
  memo2.Lines.Add(extractFileName(filen) +' in .ini stored');
  statusBar1.SimpleText:= last_fName +' last in .ini stored';
 end;
end;

procedure TMaxForm1.LoadFileNameFromIni;
begin
 with TStringlist.Create do begin
   LoadFromFile(DEFINIFILE);
   memo1.Lines.LoadFromFile(values['LAST_FILE']);
   //set act filename
   Act_Filename:= values['LAST_FILE'];
   memo2.Lines.Add(Act_Filename + FILELOAD);
   statusBar1.SimpleText:= Act_Filename + FILELOAD;
   Free;
 end;
end;


procedure TMaxForm1.About1Click(Sender: TObject);
begin
  with TAboutBox.Create(self) do
  try
    showinfoBox('Delphi in a Box 2010', RCSTRMB,(MB_VERSION));
  finally
    Free;
  end;
  statusBar1.Font.color:= clblue;
  statusBar1.SimpleText:= MXSITE;
end;

//this section describes search & replace functions
// OnFind routine for find text
procedure TMaxForm1.FindNextText(Sender: TObject);
begin
  with FindReplDialog do begin
    if Length(FindText)=0 then SysUtils.Beep
    else begin
      if memo1.SearchReplace(FindText,'',Options)= 0 then begin
        SysUtils.Beep;
        ShowMessage('"'+FindText+'" not found yet!');
        end;
      end
    end;
  end;

// OnReplace routine for replace text
procedure TMaxForm1.ReplaceNextText(Sender: TObject);
begin
  with FindReplDialog do begin
    if Length(FindText)=0 then SysUtils.Beep
    else begin
      if memo1.SearchReplace(FindText,ReplaceText,Options)=0 then begin
        SysUtils.Beep;
        ShowMessage('"'+FindText+'" not found!');
      end;
    end;
  end;
end;

procedure TMaxForm1.Search1Click(Sender: TObject);
begin
  with FindReplDialog do begin
    Findtext:= UpdateFindtext;
    OnFind:= FindNextText;
    Execute(false);
  end;
end;

function TMaxForm1.GetClientTop : integer;
begin
  Result:= Height-ClientHeight + maxpanel.Height;
end;

function TMaxForm1.UpdateFindtext : string;
begin
  with memo1 do begin
    if SelAvail then Result:= SelText
    else Result:= wordAtCursor;
  end;
end;


procedure TMaxForm1.Memo1ReplaceText(Sender: TObject; const ASearch,
  AReplace: String; Line, Column: Integer; var Action: TSynReplaceAction);
var
  mPos: TPoint;
begin
  mPos:= memo1.RowColumnToPixels(DisplayCoord(Column,Line+1));
  with mPos do begin
    x:= x+Left;
    Y:= Y+Top+GetClientTop;
  end;
  Action:= ConfirmReplDialog.Execute(mPos,Format(RCReplace,[ASearch,AReplace]));
end;

procedure TMaxForm1.Memo1StatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
  if Changes*[scCaretY,scCaretX]<>[] then begin
    with FindReplDialog do if Visible and not Searching then
                             FindText:= UpdateFindtext;
  end;
end;

procedure TMaxForm1.WordWrap1Click(Sender: TObject);
begin
 wordWrap1.Checked:= not WordWrap1.Checked;
 if WordWrap1.Checked then memo1.WordWrap:= true else
   memo1.WordWrap:= false;
end;

procedure TMaxForm1.SearchNext1Click(Sender: TObject);
begin
  FindNextText(self);
end;

procedure TMaxForm1.Replace1Click(Sender: TObject);
begin
  with FindReplDialog do begin
    Findtext:= UpdateFindtext;
    OnFind:= FindNextText;
    OnReplace:= ReplaceNextText;
    Execute(true);
  end;
end;


function TMaxForm1.PSScriptNeedFile(Sender: TObject;
          const OrginFileName: String; var FileName, Output: String): Boolean;
var path: string;
  f: TFileStream;
begin
  path:= ExtractFilePath(ParamStr(0)) + FileName;
  try
    f:= TFileStream.Create(path, fmOpenRead or fmShareDenyWrite);
  except
    result:= false;
    exit;
  end;
  try
    setLength(output, f.size);
    f.Read(output[1], length(output));
  finally
    f.Free;
  end;
  result:= true;
  if STATInclude then
    showmessage('this Include: '+ orginfilename + ' '+FileName + ' '+output);
end;

procedure TMaxForm1.ShowInclude1Click(Sender: TObject);
begin
 showInclude1.Checked:= not showInclude1.Checked;
 if showInclude1.Checked then STATInclude:= true else
   STATInclude:= false;
end;

procedure TMaxForm1.ShowSpecChars1Click(Sender: TObject);
begin
 showSpecChars1.Checked:= not showSpecChars1.Checked;
 if showSpecChars1.Checked then Memo1.Options:=
                              Memo1.Options +[eoShowSpecialChars] else
 Memo1.Options:= Memo1.Options - [eoShowSpecialChars];
end;

procedure TMaxForm1.Printout1Click(Sender: TObject);
begin
   //set all properties because this can affect pagination
  with fPrintOut do begin
    Title:= Act_Filename;
    //Lines.AddStrings(memo1.Lines);
    Lines.LoadFromFile(Act_Filename);
    Header.Clear;
    Footer.Clear;
    Header.DefaultFont.Name:= RCPRINTFONT;
    Header.Add(RCSTRMB +MB_VERSION, NIL, taLeftJustify, 1 );
    Header.Add(dateTimeToStr(now), NIL, taRightJustify, 1 );
    Footer.DefaultFont.Size:= 7;
    //Footer.FixLines;
    Footer.Add(fPrintOut.Title, NIL, taLeftJustify, 1 );
    Footer.Add(MXSITE, NIL, taRightJustify, 1);
    Colors:= mnPrintColors1.Checked;
    Highlighter:= SynPasSyn1;
    LineNumbers:= true;
    Wrap:= wordWrap1.Checked;
  end;
  //show print setup dialog and print
  //with dlgFilePrint do begin
  with SynEditPrint1 do begin
    //MinPage:= 1;
    //FromPage:= 1;
    {MaxPage:= fPrintOut.PageCount;
    ToPage:= MaxPage;
    if Execute then begin
      fPrintOut.Copies:= Copies;
      case PrintRange of
        prAllPages: fPrintOut.Print;
        prPageNums: fPrintOut.PrintRange(FromPage, ToPage);
      end;
    end;}
  end;
  statusBar1.SimpleText:= Act_Filename +' is printed';
end;

procedure TMaxForm1.mnuPrintFont1Click(Sender: TObject);
begin
  dlgPrintFont1.Font.Assign(fPrintOut.Font);
  memo1.Font.Assign(fPrintOut.Font);
  if dlgPrintFont1.Execute then begin
    fPrintOut.Font.Assign(dlgPrintFont1.Font);
    memo1.Font.Assign(dlgPrintFont1.Font);
  end;  
end;

procedure TMaxForm1.Include1Click(Sender: TObject);
begin
  showMessage('Library, Units and Include Lists in maXbox V3.0');
end;

procedure TMaxForm1.FormDestroy(Sender: TObject);
begin
  //fprintOut.Free;
  //DragAcceptFiles(maxForm1.Handle, false);
end;

procedure TMaxForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //stringGrid1.Free;
  fprintOut.Free;
  fAutoComplete.Free;
  debugoutput.Free;
  if STATedchanged then begin
  if MessageDlg(RCSTRMB+ ' Save Code Changes now?',
    mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin
      Save2Click(sender);
      memo1.Lines.Clear;
      Action:= caFree;
    end else
    Action:= caFree;
  end;
  // debug showmessage('close');
end;

procedure TMaxForm1.UpdateView1Click(Sender: TObject);
begin
  memo1.Repaint; //after copy&paste or drag'n drop
end;

procedure TMaxForm1.CodeCompletionList1Click(Sender: TObject);
begin
  if fileExists(ExtractFilePath(ParamStr(0))+ CODECOMPLETION) then
    memo2.Lines.LoadFromFile(ExtractFilePath(ParamStr(0))+CODECOMPLETION) else
    showMessage('the file '+CODECOMPLETION+' is missing');
end;

procedure TMaxForm1.SaveOutput1Click(Sender: TObject);
begin
  memo2.Lines.SaveToFile(Act_Filename+'Output'+'.txt');
  memo2.Lines.Add(Act_Filename +' output stored');
end;

procedure TMaxForm1.ExportClipboard1Click(Sender: TObject);
begin
  memo1.SelectAll;
  if memo1.Focused then memo1.CopyToClipboard;
end;

procedure TMaxForm1.ImportfromClipboard1Click(Sender: TObject);
begin
  last_fName:= Act_Filename;
  loadLastfile1.Caption:= '&Load Last'+': '+ extractFileName(last_fName);
  if memo1.Focused then memo1.PasteFromClipboard;
  statusBar1.SimpleText:= ' Import of Clipboard...' +FILELOAD;
end;

procedure TMaxForm1.ImportfromClipboard2Click(Sender: TObject);
begin
  ImportfromClipboard1Click(Sender);
end;

procedure TMaxForm1.Close1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TMaxForm1.Manual1Click(Sender: TObject);
var FileName: string;
   pid, status: integer;
begin
  if fileexists(ExtractFilePath(ParamStr(0))+'docs/delphi_kurs.pdf') then begin
    FileName:= ExtractFilePath(ParamStr(0))+'docs/delphi_kurs.pdf';
    showmessage('you can read: '+ Filename); 
    {pid:= fork;
    if pid = 0 then begin
      if Execlp(PChar(FileName), NIL) <> 0 then
        Halt(1);
    end else begin
      WaitPid(pid, @status, 0);
    end;}
    //ShellExecute(HInstance, NIL, pchar(FileName), NIL, NIL, sw_ShowNormal);
  end else
    showmessage('sorry, the filepath to docs\delphi_kurs.pdf is missing')
end;

procedure TMaxForm1.PascalScript1Click(Sender: TObject);
var FileName: string;
  pid, status: integer;
begin
  if fileexists(ExtractFilePath(ParamStr(0))+'/docs/pascalscript.pdf') then begin
    FileName:= ExtractFilePath(ParamStr(0))+'/docs/pascalscript.pdf';
    showmessage('you can read it: '+ Filename);
    {pid:= fork;
    if pid = 0 then begin
      if ExeCvp(PChar(FileName), NIL) <> 0 then
        Halt(1);
    end else begin
      WaitPid(pid, @status, 0);
    end;}
   //ShellExecute(HInstance, NIL, pchar(FileName), NIL, NIL, sw_ShowNormal);
  end else
    showmessage('sorry, the filepath to docs\pascalscript.pdf is missing')
end;

procedure TMaxForm1.tutorial1Click(Sender: TObject);
var FileName: string;
  pid, status: integer;
begin
  if fileexists(ExtractFilePath(ParamStr(0))+'/docs/maxbox_starter.pdf') then begin
    FileName:= ExtractFilePath(ParamStr(0))+'/docs/maxbox_starter.pdf';
    showmessage('you can read the great: '+ Filename);
    {pid:= fork;
    if pid = 0 then begin
      if ExeCvp(PChar(FileName), NIL) <> 0 then
        Halt(1);
    end else begin
      WaitPid(pid, @status, 0);
    end;}
   //ShellExecute(HInstance, NIL, pchar(FileName), NIL, NIL, sw_ShowNormal);
  end else
    showmessage('sorry, the filepath to docs\maxbox_starter.pdf is missing')
end;

procedure TMaxForm1.LoadLastFile1Click(Sender: TObject);
var templastfile: string;
begin
  memo1.Lines.LoadFromFile(last_fName);
  templastfile:= Act_Filename;
  Act_Filename:= last_fName;
  last_fName:= templastfile;
  loadLastfile1.Caption:= '&Load Last'+': '+ extractFileName(last_fName);
  memo2.Lines.Add(last_fName +' '+ BEFOREFILE);
  statusBar1.SimpleText:= last_fName +' '+ BEFOREFILE;
end;

procedure TMaxForm1.Memo1Change(Sender: TObject);
begin
  STATedchanged:= true;
  //debug statusBar1.SimpleText:= ' editior changed';
end;

//-----------------------------------------Debug-----------------------------//
function TMaxForm1.CompileDebug: Boolean;
var
  i: Longint;
begin
  cedebug.Script.Assign(memo1.Lines);
  Result:= cedebug.Compile;
  //result:= PSScript.Compile;
  memo2.Clear;
  for i:= 0 to cedebug.CompilerMessageCount -1 do begin
    memo2.lines.Add(cedebug.CompilerMessages[i].MessageToString);
  end;
  if Result then begin
    memo2.lines.Add('Succesfully compiled/decompiled/debuged');
    statusBar1.SimpleText:= Act_Filename +' in ---debug mode--- '+ FILELOAD
  end;
end;

function TMaxForm1.ExecuteDebug: Boolean;
begin
debugoutput.Output.Clear;
  if cedebug.Execute then begin
  //if PSScript.Execute then begin
    memo2.lines.Add('Succesfully Execute/Debuged...');
    Result:= True;
  end else begin
    memo2.lines.Add('Debug Runtime Error: '+cedebug.ExecErrorToString +
    ' at ['+IntToStr(cedebug.ExecErrorRow)+':'+IntToStr(cedebug.ExecErrorCol)+'] bytecode pos:'+
    inttostr(cedebug.ExecErrorProcNo)+':'+inttostr(cedebug.ExecErrorByteCodePosition));
    Result:= False;
  end;
end;

procedure TMaxForm1.Decompile1Click(Sender: TObject);
 var
  s: string;
begin
  if CompileDebug then begin
    cedebug.GetCompiled(s);
    IFPS3DataToText(s, s);
    debugoutput.output.Lines.Text:= s;
    debugoutput.output.Lines.Add('Decompiled Code from maXbox: ' +
                                     ExtractFileName(Act_Filename));
    debugoutput.visible:= true;
  end;
end;

procedure TMaxForm1.StepInto1Click(Sender: TObject);
begin
  if cedebug.Exec.Status = isRunning then
    cedebug.StepInto
  else begin
    memo1.Gutter.LeadingZeros:= true; //2.8
    if CompileDebug then begin
      cedebug.StepInto;
      ExecuteDebug;
    end;
  end;
end;

procedure TMaxForm1.StepOut1Click(Sender: TObject);
begin
if cedebug.Exec.Status = isRunning then
    cedebug.StepOver
  else begin
    if CompileDebug then begin
      cedebug.StepInto;
      ExecuteDebug;
    end;
  end;
end;

procedure TMaxForm1.Reset1Click(Sender: TObject);
begin
if cedebug.Exec.Status = isRunning then
    cedebug.Stop;
end;

procedure TMaxForm1.cedebugAfterExecute(Sender: TPSScript);
begin
//Caption := 'Editor';
  FActiveLine:= 0;
  memo1.Refresh;
  memo1.Gutter.LeadingZeros:= false; //2.8
// this is debug
end;

procedure TMaxForm1.cedebugBreakpoint(Sender: TObject;
  const FileName: String; Position, Row, Col: Cardinal);
begin
FActiveLine:= Row;
  if (FActiveLine < memo1.TopLine +2) or
        (FActiveLine > memo1.TopLine + memo1.LinesInWindow -2) then begin
    memo1.TopLine := FActiveLine - (memo1.LinesInWindow div 2);
  end;
  memo1.CaretY:= FActiveLine;
  memo1.CaretX:= 1;
  memo1.Refresh;
// this is debug
end;

procedure TMaxForm1.cedebugCompile(Sender: TPSScript);
begin
// this is just for test
  Sender.AddRegisteredVariable('Self', 'TForm');
  Sender.AddRegisteredVariable('Application', 'TApplication');
end;

procedure TMaxForm1.cedebugExecute(Sender: TPSScript);
begin
  cedebug.SetVarToInstance('SELF', Self);
  cedebug.SetVarToInstance('APPLICATION', Application);
  //PSScript.SetPointerToData('Memo1', @Memo1, PSScript.FindNamedType('TSynMemo'));
  cedebug.SetVarToInstance('memo2', memo2);
  cedebug.SetVarToInstance('maxForm1', maxForm1);
end;

procedure TMaxForm1.cedebugIdle(Sender: TObject);
begin
 Application.HandleMessage;
  if FResume then begin
    FResume:= False;
    cedebug.Resume;
    FActiveLine:= 0;
    memo1.Refresh;
  end;
end;

procedure TMaxForm1.cedebugLineInfo(Sender: TObject;
              const FileName: String; Position, Row, Col: Cardinal);
begin
  if cedebug.Exec.DebugMode <> dmRun then begin
    FActiveLine:= Row;
    if (FActiveLine < memo1.TopLine +2) or
           (FActiveLine > memo1.TopLine + memo1.LinesInWindow -2) then begin
      memo1.TopLine:= FActiveLine - (memo1.LinesInWindow div 2);
    end;
    memo1.CaretY:= FActiveLine;
    memo1.CaretX:= 1;
    memo1.Refresh;
  end;
end;

procedure TMaxForm1.Memo1SpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
begin
  cedebug.MainFileName:= Act_Filename;
  if cedebug.HasBreakPoint(cedebug.MainFileName, Line) then begin
    Special:= True;
    if Line = FActiveLine then begin
      BG:= clWhite;
      FG:= clRed;
    end else begin
      FG:= clWhite;
      BG:= clRed;
    end;
  end else
  if Line = FActiveLine then begin
    Special:= True;
    FG:= clWhite;
    bg:= clBlue;
  end else Special:= False;
end;

procedure TMaxForm1.BreakPointMenuClick(Sender: TObject);
var
  Line: Longint;
begin
  Line:= memo1.CaretY;
  if cedebug.HasBreakPoint(cedebug.MainFileName, Line) then
    cedebug.ClearBreakPoint(cedebug.MainFileName, Line)
  else
    cedebug.SetBreakPoint(cedebug.MainFileName, Line);
  memo1.Refresh;
end;

procedure TMaxForm1.DebugRun1Click(Sender: TObject);
begin
 if cedebug.Running then begin
    FResume:= True
  end else begin
    if CompileDebug then
      ExecuteDebug;
  end;
end;

end.
