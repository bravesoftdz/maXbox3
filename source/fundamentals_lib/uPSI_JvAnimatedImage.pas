unit uPSI_JvAnimatedImage;
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
  TPSImport_JvAnimatedImage = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvLockedBitmap(CL: TPSPascalCompiler);
procedure SIRegister_TJvAnimatedImage(CL: TPSPascalCompiler);
procedure SIRegister_TJvImageControl(CL: TPSPascalCompiler);
procedure SIRegister_JvAnimatedImage(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJvLockedBitmap(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvAnimatedImage(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvImageControl(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvAnimatedImage(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
  // JclUnitVersioning
  //Windows
  //,Messages
  //,Libc
  Types
  ,Graphics
  ,Controls
  ,ExtCtrls
 // ,JvComponent
  ,JvAnimatedImage
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvAnimatedImage]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvLockedBitmap(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TBitmap', 'TJvLockedBitmap') do
  with CL.AddClassN(CL.FindClass('TBitmap'),'TJvLockedBitmap') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvAnimatedImage(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvImageControl', 'TJvAnimatedImage') do
  with CL.AddClassN(CL.FindClass('TJvImageControl'),'TJvAnimatedImage') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
     RegisterMethod('Procedure Free');
     RegisterProperty('AsyncDrawing', 'Boolean', iptrw);
    RegisterProperty('Active', 'Boolean', iptrw);
    RegisterProperty('Center', 'Boolean', iptrw);
    RegisterProperty('Orientation', 'TGlyphOrientation', iptrw);
    RegisterProperty('Glyph', 'TBitmap', iptrw);
    RegisterProperty('GlyphNum', 'Integer', iptrw);
    RegisterProperty('Interval', 'Cardinal', iptrw);
    RegisterProperty('NumGlyphs', 'Integer', iptrw);
    RegisterProperty('InactiveGlyph', 'Integer', iptrw);
    RegisterProperty('TransparentColor', 'TColor', iptrw);
    RegisterProperty('Transparent', 'Boolean', iptrw);
    RegisterProperty('Stretch', 'Boolean', iptrw);
    RegisterProperty('OnFrameChanged', 'TNotifyEvent', iptrw);
    RegisterProperty('OnStart', 'TNotifyEvent', iptrw);
    RegisterProperty('OnStop', 'TNotifyEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvImageControl(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvGraphicControl', 'TJvImageControl') do
  with CL.AddClassN(CL.FindClass('TJvGraphicControl'),'TJvImageControl') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvAnimatedImage(CL: TPSPascalCompiler);
begin
  SIRegister_TJvImageControl(CL);
  CL.AddTypeS('TGlyphOrientation', '( goHorizontal, goVertical )');
  SIRegister_TJvAnimatedImage(CL);
  SIRegister_TJvLockedBitmap(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOnStop_W(Self: TJvAnimatedImage; const T: TNotifyEvent);
begin Self.OnStop := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOnStop_R(Self: TJvAnimatedImage; var T: TNotifyEvent);
begin T := Self.OnStop; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOnStart_W(Self: TJvAnimatedImage; const T: TNotifyEvent);
begin Self.OnStart := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOnStart_R(Self: TJvAnimatedImage; var T: TNotifyEvent);
begin T := Self.OnStart; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOnFrameChanged_W(Self: TJvAnimatedImage; const T: TNotifyEvent);
begin Self.OnFrameChanged := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOnFrameChanged_R(Self: TJvAnimatedImage; var T: TNotifyEvent);
begin T := Self.OnFrameChanged; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageStretch_W(Self: TJvAnimatedImage; const T: Boolean);
begin Self.Stretch := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageStretch_R(Self: TJvAnimatedImage; var T: Boolean);
begin T := Self.Stretch; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageTransparent_W(Self: TJvAnimatedImage; const T: Boolean);
begin Self.Transparent := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageTransparent_R(Self: TJvAnimatedImage; var T: Boolean);
begin T := Self.Transparent; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageTransparentColor_W(Self: TJvAnimatedImage; const T: TColor);
begin Self.TransparentColor := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageTransparentColor_R(Self: TJvAnimatedImage; var T: TColor);
begin T := Self.TransparentColor; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageInactiveGlyph_W(Self: TJvAnimatedImage; const T: Integer);
begin Self.InactiveGlyph := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageInactiveGlyph_R(Self: TJvAnimatedImage; var T: Integer);
begin T := Self.InactiveGlyph; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageNumGlyphs_W(Self: TJvAnimatedImage; const T: Integer);
begin Self.NumGlyphs := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageNumGlyphs_R(Self: TJvAnimatedImage; var T: Integer);
begin T := Self.NumGlyphs; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageInterval_W(Self: TJvAnimatedImage; const T: Cardinal);
begin Self.Interval := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageInterval_R(Self: TJvAnimatedImage; var T: Cardinal);
begin T := Self.Interval; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageGlyphNum_W(Self: TJvAnimatedImage; const T: Integer);
begin Self.GlyphNum := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageGlyphNum_R(Self: TJvAnimatedImage; var T: Integer);
begin T := Self.GlyphNum; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageGlyph_W(Self: TJvAnimatedImage; const T: TBitmap);
begin Self.Glyph := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageGlyph_R(Self: TJvAnimatedImage; var T: TBitmap);
begin T := Self.Glyph; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOrientation_W(Self: TJvAnimatedImage; const T: TGlyphOrientation);
begin Self.Orientation := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageOrientation_R(Self: TJvAnimatedImage; var T: TGlyphOrientation);
begin T := Self.Orientation; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageCenter_W(Self: TJvAnimatedImage; const T: Boolean);
begin Self.Center := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageCenter_R(Self: TJvAnimatedImage; var T: Boolean);
begin T := Self.Center; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageActive_W(Self: TJvAnimatedImage; const T: Boolean);
begin Self.Active := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageActive_R(Self: TJvAnimatedImage; var T: Boolean);
begin T := Self.Active; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageAsyncDrawing_W(Self: TJvAnimatedImage; const T: Boolean);
begin Self.AsyncDrawing := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvAnimatedImageAsyncDrawing_R(Self: TJvAnimatedImage; var T: Boolean);
begin T := Self.AsyncDrawing; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvLockedBitmap(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvLockedBitmap) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvAnimatedImage(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvAnimatedImage) do begin
    RegisterConstructor(@TJvAnimatedImage.Create, 'Create');
    RegisterMethod(@TJvAnimatedImage.Destroy, 'Free');
    RegisterPropertyHelper(@TJvAnimatedImageAsyncDrawing_R,@TJvAnimatedImageAsyncDrawing_W,'AsyncDrawing');
    RegisterPropertyHelper(@TJvAnimatedImageActive_R,@TJvAnimatedImageActive_W,'Active');
    RegisterPropertyHelper(@TJvAnimatedImageCenter_R,@TJvAnimatedImageCenter_W,'Center');
    RegisterPropertyHelper(@TJvAnimatedImageOrientation_R,@TJvAnimatedImageOrientation_W,'Orientation');
    RegisterPropertyHelper(@TJvAnimatedImageGlyph_R,@TJvAnimatedImageGlyph_W,'Glyph');
    RegisterPropertyHelper(@TJvAnimatedImageGlyphNum_R,@TJvAnimatedImageGlyphNum_W,'GlyphNum');
    RegisterPropertyHelper(@TJvAnimatedImageInterval_R,@TJvAnimatedImageInterval_W,'Interval');
    RegisterPropertyHelper(@TJvAnimatedImageNumGlyphs_R,@TJvAnimatedImageNumGlyphs_W,'NumGlyphs');
    RegisterPropertyHelper(@TJvAnimatedImageInactiveGlyph_R,@TJvAnimatedImageInactiveGlyph_W,'InactiveGlyph');
    RegisterPropertyHelper(@TJvAnimatedImageTransparentColor_R,@TJvAnimatedImageTransparentColor_W,'TransparentColor');
    RegisterPropertyHelper(@TJvAnimatedImageTransparent_R,@TJvAnimatedImageTransparent_W,'Transparent');
    RegisterPropertyHelper(@TJvAnimatedImageStretch_R,@TJvAnimatedImageStretch_W,'Stretch');
    RegisterPropertyHelper(@TJvAnimatedImageOnFrameChanged_R,@TJvAnimatedImageOnFrameChanged_W,'OnFrameChanged');
    RegisterPropertyHelper(@TJvAnimatedImageOnStart_R,@TJvAnimatedImageOnStart_W,'OnStart');
    RegisterPropertyHelper(@TJvAnimatedImageOnStop_R,@TJvAnimatedImageOnStop_W,'OnStop');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvImageControl(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvImageControl) do
  begin
    RegisterConstructor(@TJvImageControl.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvAnimatedImage(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TJvImageControl(CL);
  RIRegister_TJvAnimatedImage(CL);
  RIRegister_TJvLockedBitmap(CL);
end;

 
 
{ TPSImport_JvAnimatedImage }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvAnimatedImage.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvAnimatedImage(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvAnimatedImage.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvAnimatedImage(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
