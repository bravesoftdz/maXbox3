(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is TurboPower SysTools
 *
 * The Initial Developer of the Original Code is
 * TurboPower Software
 *
 * Portions created by the Initial Developer are Copyright (C) 1996-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

{*********************************************************}
{* SysTools: StNeptun.pas 4.03                           *}
{*********************************************************}
{* SysTools: Astronomical Routines (for Neptune)         *}
{*********************************************************}

{$I StDefine.inc}

unit StNeptun;

interface

uses
  StAstroP;

function ComputeNeptune(JD : Double) : TStEclipticalCord;


implementation

function GetLongitude(Tau, Tau2, Tau3, Tau4, Tau5 : Double) : Double;
var
  L0, L1,
  L2, L3,
  L4, L5  : Double;
begin
  L0 := 5.31188633050 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.01798475509 * cos(2.90101273050 +   38.13303563800 * Tau)
      + 0.01019727662 * cos(0.48580923660 +    1.48447270830 * Tau)
      + 0.00124531845 * cos(4.83008090680 +   36.64856292900 * Tau)
      + 0.00042064450 * cos(5.41054991610 +    2.96894541660 * Tau)
      + 0.00037714589 * cos(6.09221834950 +   35.16409022100 * Tau)
      + 0.00033784734 * cos(1.24488865580 +   76.26607127600 * Tau)
      + 0.00016482741 * cos(0.00007729261 +  491.55792946000 * Tau)
      + 0.00009198582 * cos(4.93747059920 +   39.61750834600 * Tau)
      + 0.00008994249 * cos(0.27462142569 +  175.16605980000 * Tau)
      + 0.00004216235 * cos(1.98711914360 +   73.29712585900 * Tau)
      + 0.00003364818 * cos(1.03590121820 +   33.67961751300 * Tau)
      + 0.00002284800 * cos(4.20606932560 +    4.45341812490 * Tau)
      + 0.00001433512 * cos(2.78340432710 +   74.78159856700 * Tau)
      + 0.00000900240 * cos(2.07606702420 +  109.94568879000 * Tau)
      + 0.00000744996 * cos(3.19032530140 +   71.81265315100 * Tau)
      + 0.00000506206 * cos(5.74785370250 +  114.39910691000 * Tau)
      + 0.00000399552 * cos(0.34972342569 + 1021.24889460000 * Tau)
      + 0.00000345195 * cos(3.46186210170 +   41.10198105400 * Tau)
      + 0.00000340323 * cos(3.30369900420 +   77.75054398400 * Tau)
      + 0.00000323004 * cos(2.24815188610 +   32.19514480500 * Tau)
      + 0.00000306338 * cos(0.49684039897 +    0.52126486180 * Tau)
      + 0.00000287322 * cos(4.50523446020 +    0.04818410980 * Tau)
      + 0.00000282170 * cos(2.24565579690 +  146.59425172000 * Tau)
      + 0.00000266605 * cos(4.88932609480 +    0.96320784650 * Tau)
      + 0.00000251941 * cos(5.78166597290 +  388.46515524000 * Tau)
      + 0.00000244722 * cos(1.24693337930 +    9.56122755560 * Tau)
      + 0.00000232887 * cos(2.50459795020 +  137.03302416000 * Tau)
      + 0.00000227079 * cos(1.79713054540 +  453.42489382000 * Tau)
      + 0.00000170404 * cos(3.32390630650 +  108.46121608000 * Tau)
      + 0.00000151401 * cos(2.19153094280 +   33.94024994400 * Tau)
      + 0.00000150180 * cos(2.99706110410 +    5.93789083320 * Tau)
      + 0.00000148295 * cos(0.85948986145 +  111.43016150000 * Tau)
      + 0.00000118672 * cos(3.67706204310 +    2.44768055480 * Tau)
      + 0.00000109300 * cos(2.41599378050 +  183.24281465000 * Tau)
      + 0.00000103305 * cos(0.04078966679 +    0.26063243090 * Tau)
      + 0.00000103054 * cos(4.40441222000 +   70.32818044200 * Tau)
      + 0.00000101821 * cos(5.70539236950 +    0.11187458460 * Tau);

  L1 := 38.37687716700 * cos(0.00000000000 +   0.00000000000 * Tau)
      + 0.00016604187 * cos(4.86319129560 +   1.48447270830 * Tau)
      + 0.00015807148 * cos(2.27923488530 +  38.13303563800 * Tau)
      + 0.00003334701 * cos(3.68199676020 +  76.26607127600 * Tau)
      + 0.00001305840 * cos(3.67320813490 +   2.96894541660 * Tau)
      + 0.00000604832 * cos(1.50477747550 +  35.16409022100 * Tau)
      + 0.00000178623 * cos(3.45318524150 +  39.61750834600 * Tau)
      + 0.00000106537 * cos(2.45126138330 +   4.45341812490 * Tau)
      + 0.00000105747 * cos(2.75479326550 +  33.67961751300 * Tau)
      + 0.00000072684 * cos(5.48724732700 +  36.64856292900 * Tau)
      + 0.00000057355 * cos(1.85767603380 + 114.39910691000 * Tau)
      + 0.00000057069 * cos(5.21649804970 +   0.52126486180 * Tau)
      + 0.00000035368 * cos(4.51676827540 +  74.78159856700 * Tau)
      + 0.00000032216 * cos(5.90411489680 +  77.75054398400 * Tau)
      + 0.00000029871 * cos(3.67043294110 + 388.46515524000 * Tau)
      + 0.00000028866 * cos(5.16877529160 +   9.56122755560 * Tau)
      + 0.00000028742 * cos(5.16732589020 +   2.44768055480 * Tau)
      + 0.00000025507 * cos(5.24526281930 + 168.05251280000 * Tau);

  L2 := 0.00053892649 * cos(0.00000000000 +  0.00000000000 * Tau)
      + 0.00000295693 * cos(1.85520292250 +  1.48447270830 * Tau)
      + 0.00000281251 * cos(1.19084538890 + 38.13303563800 * Tau)
      + 0.00000270190 * cos(5.72143228150 + 76.26607127600 * Tau)
      + 0.00000023023 * cos(1.21035596450 +  2.96894541660 * Tau)
      + 0.00000009057 * cos(4.42544992040 + 35.16409022100 * Tau)
      + 0.00000007333 * cos(0.54033306830 +  2.44768055480 * Tau);

  L3 := 0.00000031254 * cos(0.00000000000 +  0.00000000000 * Tau)
      + 0.00000014541 * cos(1.35337075860 + 76.26607127600 * Tau)
      + 0.00000012461 * cos(6.04431418810 +  1.48447270830 * Tau)
      + 0.00000011547 * cos(6.11257808370 + 38.13303563800 * Tau);

  L4 := 0.00000113998 * cos(3.14159265360 + 0.00000000000 * Tau);

  L5 := 0.00000000000;
  Result := (L0 + L1*Tau + L2*Tau2 + L3*Tau3 + L4*Tau4 + L5*Tau5);
end;

{---------------------------------------------------------------------------}

function GetLatitude(Tau, Tau2, Tau3, Tau4, Tau5 : Double) : Double;
var
  B0, B1,
  B2, B3,
  B4, B5  : Double;
begin
  B0 := 0.03088622933 * cos(1.44104372630 +  38.13303563800 * Tau)
      + 0.00027780087 * cos(5.91271882840 +  76.26607127600 * Tau)
      + 0.00027623609 * cos(0.00000000000 +   0.00000000000 * Tau)
      + 0.00015448133 * cos(3.50877080890 +  39.61750834600 * Tau)
      + 0.00015355490 * cos(2.52123799480 +  36.64856292900 * Tau)
      + 0.00001999919 * cos(1.50998669500 +  74.78159856700 * Tau)
      + 0.00001967540 * cos(4.37778195770 +   1.48447270830 * Tau)
      + 0.00001015137 * cos(3.21561035880 +  35.16409022100 * Tau)
      + 0.00000605767 * cos(2.80246601410 +  73.29712585900 * Tau)
      + 0.00000594878 * cos(2.12892708110 +  41.10198105400 * Tau)
      + 0.00000588805 * cos(3.18655882500 +   2.96894541660 * Tau)
      + 0.00000401830 * cos(4.16883287240 + 114.39910691000 * Tau)
      + 0.00000279964 * cos(1.68165309700 +  77.75054398400 * Tau)
      + 0.00000261647 * cos(3.76722704750 + 213.29909544000 * Tau)
      + 0.00000254333 * cos(3.27120499440 + 453.42489382000 * Tau)
      + 0.00000205590 * cos(4.25652348860 + 529.69096509000 * Tau)
      + 0.00000140455 * cos(3.52969556380 + 137.03302416000 * Tau);

  B1 := 0.00227279214 * cos(3.80793089870 +  38.13303563800 * Tau)
      + 0.00001803120 * cos(1.97576485380 +  76.26607127600 * Tau)
      + 0.00001433300 * cos(3.14159265360 +   0.00000000000 * Tau)
      + 0.00001385733 * cos(4.82555548020 +  36.64856292900 * Tau)
      + 0.00001073298 * cos(6.08054240710 +  39.61750834600 * Tau)
      + 0.00000147903 * cos(3.85766231350 +  74.78159856700 * Tau)
      + 0.00000136448 * cos(0.47764957338 +   1.48447270830 * Tau)
      + 0.00000070285 * cos(6.18782052140 +  35.16409022100 * Tau)
      + 0.00000051899 * cos(5.05221791890 +  73.29712585900 * Tau)
      + 0.00000042568 * cos(0.30721737205 + 114.39910691000 * Tau)
      + 0.00000037273 * cos(4.89476629250 +  41.10198105400 * Tau)
      + 0.00000037104 * cos(5.75999349110 +   2.96894541660 * Tau)
      + 0.00000026399 * cos(5.21566335940 + 213.29909544000 * Tau);

  B2 := 0.00009690766 * cos(5.57123750290 + 38.13303563800 * Tau)
      + 0.00000078815 * cos(3.62705474220 + 76.26607127600 * Tau)
      + 0.00000071523 * cos(0.45476688580 + 36.64856292900 * Tau)
      + 0.00000058646 * cos(3.14159265360 +  0.00000000000 * Tau)
      + 0.00000029915 * cos(1.60671721860 + 39.61750834600 * Tau)
      + 0.00000006472 * cos(5.60736756580 + 74.78159856700 * Tau);

  B3 := 0.00000273423 * cos(1.01688979070 + 38.13303563800 * Tau)
      + 0.00000002393 * cos(0.00000000000 +  0.00000000000 * Tau)
      + 0.00000002274 * cos(2.36805657130 + 36.64856292900 * Tau)
      + 0.00000002029 * cos(5.33364321340 + 76.26607127600 * Tau);

  B4 := 0.00000005728 * cos(2.66872693320 + 38.13303563800 * Tau);

  B5 := 0.00000000000;
  Result := (B0 + B1*Tau + B2*Tau2 + B3*Tau3 + B4*Tau4 + B5*Tau5);
end;

{---------------------------------------------------------------------------}

function GetRadiusVector(Tau, Tau2, Tau3, Tau4, Tau5 : Double) : Double;
var
  R0, R1,
  R2, R3,
  R4, R5  : Double;
begin
  R0 := 30.07013206100 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.27062259490 * cos(1.32999458930 +   38.13303563800 * Tau)
      + 0.01691764281 * cos(3.25186138900 +   36.64856292900 * Tau)
      + 0.00807830737 * cos(5.18592836170 +    1.48447270830 * Tau)
      + 0.00537760613 * cos(4.52113902850 +   35.16409022100 * Tau)
      + 0.00495725642 * cos(1.57105654810 +  491.55792946000 * Tau)
      + 0.00274571970 * cos(1.84552256800 +  175.16605980000 * Tau)
      + 0.00135134095 * cos(3.37220607380 +   39.61750834600 * Tau)
      + 0.00121801825 * cos(5.79754444300 +   76.26607127600 * Tau)
      + 0.00100895397 * cos(0.37702748681 +   73.29712585900 * Tau)
      + 0.00069791722 * cos(3.79617226930 +    2.96894541660 * Tau)
      + 0.00046687838 * cos(5.74937810090 +   33.67961751300 * Tau)
      + 0.00024593778 * cos(0.50801728204 +  109.94568879000 * Tau)
      + 0.00016939242 * cos(1.59422166990 +   71.81265315100 * Tau)
      + 0.00014229686 * cos(1.07786112900 +   74.78159856700 * Tau)
      + 0.00012011825 * cos(1.92062131640 + 1021.24889460000 * Tau)
      + 0.00008394731 * cos(0.67816895547 +  146.59425172000 * Tau)
      + 0.00007571800 * cos(1.07149263430 +  388.46515524000 * Tau)
      + 0.00005720852 * cos(2.59059512270 +    4.45341812490 * Tau)
      + 0.00004839672 * cos(1.90685991070 +   41.10198105400 * Tau)
      + 0.00004483492 * cos(2.90573457530 +  529.69096509000 * Tau)
      + 0.00004420804 * cos(1.74993796500 +  108.46121608000 * Tau)
      + 0.00004353790 * cos(0.67985662370 +   32.19514480500 * Tau)
      + 0.00004270202 * cos(3.41343865820 +  453.42489382000 * Tau)
      + 0.00003380930 * cos(0.84810683275 +  183.24281465000 * Tau)
      + 0.00002881063 * cos(1.98600105120 +  137.03302416000 * Tau)
      + 0.00002878942 * cos(3.67415901850 +  350.33211960000 * Tau)
      + 0.00002635535 * cos(3.09755943420 +  213.29909544000 * Tau)
      + 0.00002530149 * cos(5.79839567010 +  490.07345675000 * Tau)
      + 0.00002523132 * cos(0.48630800015 +  493.04240217000 * Tau)
      + 0.00002306293 * cos(2.80962935720 +   70.32818044200 * Tau)
      + 0.00002087303 * cos(0.61858378281 +   33.94024994400 * Tau);

  R1 := 0.00236338502 * cos(0.70498011235 +   38.13303563800 * Tau)
      + 0.00013220279 * cos(3.32015499890 +    1.48447270830 * Tau)
      + 0.00008621863 * cos(6.21628951630 +   35.16409022100 * Tau)
      + 0.00002701740 * cos(1.88140666780 +   39.61750834600 * Tau)
      + 0.00002154735 * cos(2.09431198090 +    2.96894541660 * Tau)
      + 0.00002153150 * cos(5.16873840980 +   76.26607127600 * Tau)
      + 0.00001603165 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.00001463924 * cos(1.18417031050 +   33.67961751300 * Tau)
      + 0.00001135773 * cos(3.91891199650 +   36.64856292900 * Tau)
      + 0.00000897650 * cos(5.24122933530 +  388.46515524000 * Tau)
      + 0.00000789908 * cos(0.53315484580 +  168.05251280000 * Tau)
      + 0.00000760030 * cos(0.02051033644 +  182.27960680000 * Tau)
      + 0.00000607183 * cos(1.07706500350 + 1021.24889460000 * Tau)
      + 0.00000571622 * cos(3.40060785430 +  484.44438246000 * Tau)
      + 0.00000560790 * cos(2.88685815670 +  498.67147646000 * Tau);

  R2 := 0.00004247412 * cos(5.89910679120 +  38.13303563800 * Tau)
      + 0.00000217570 * cos(0.34581829080 +   1.48447270830 * Tau)
      + 0.00000163025 * cos(2.23872947130 + 168.05251280000 * Tau)
      + 0.00000156285 * cos(4.59414467340 + 182.27960680000 * Tau)
      + 0.00000127141 * cos(2.84786298080 +  35.16409022100 * Tau);

  R3 := 0.00000166297 * cos(4.55243893490 +  38.13303563800 * Tau);

  R4 := 0.00000000000;

  R5 := 0.00000000000;
  Result := (R0 + R1*Tau + R2*Tau2 + R3*Tau3 + R4*Tau4 + R5*Tau5);
end;

{---------------------------------------------------------------------------}

function ComputeNeptune(JD : Double) : TStEclipticalCord;
var
  Tau,
  Tau2,
  Tau3,
  Tau4,
  Tau5      : Double;
begin
  Tau  := (JD - 2451545.0) / 365250.0;
  Tau2 := sqr(Tau);
  Tau3 := Tau * Tau2;
  Tau4 := sqr(Tau2);
  Tau5 := Tau2 * Tau3;

  Result.L0 := GetLongitude(Tau, Tau2, Tau3, Tau4, Tau5);
  Result.B0 := GetLatitude(Tau, Tau2, Tau3, Tau4, Tau5);
  Result.R0 := GetRadiusVector(Tau, Tau2, Tau3, Tau4, Tau5);
end;


end.
