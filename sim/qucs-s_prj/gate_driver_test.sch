<Qucs Schematic 24.2.1>
<Properties>
  <View=-2067,-406,4830,2585,0.683013,1389,240>
  <Grid=10,10,1>
  <DataSet=gate_driver_test.dat>
  <DataDisplay=gate_driver_test.dpl>
  <OpenDisplay=0>
  <Script=gate_driver_test.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Vrect V1 0 470 560 18 -26 0 1 "10 V" 1 "5 us" 1 "5 us" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0 "0 V" 1>
  <GND * 1 470 630 0 0 0 0>
  <GND * 1 610 630 0 0 0 0>
  <GND * 1 330 630 0 0 0 0>
  <R R1 1 330 560 15 -26 0 1 "10 MegOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <SpiceModel SpiceModel_DI_ES3C1 1 240 280 -30 15 0 0 ".MODEL DI_ES3C D  ( IS=7.27p RS=22.4m BV=1.00k IBV=10.0u" 1 "+ CJO=83.2p  M=0.333 N=0.700 TT=36.0n )" 1 "" 0 "" 0 "Line_5=" 0>
  <SpiceModel SpiceModel_DI_ES3C2 1 260 700 -30 15 0 0 ".MODEL DI_ES3C2 D  ( IS=7.27p RS=22.4m BV=1.00k IBV=10.0u" 1 "+ CJO=83.2p  M=0.333 N=0.700 TT=0.0n )" 1 "" 0 "" 0 "Line_5=" 0>
  <Vdc V2 1 650 400 18 -26 0 1 "12 V" 1>
  <GND * 1 650 450 0 0 0 0>
  <GND * 1 810 630 0 0 0 0>
  <GND * 1 1090 530 0 0 0 0>
  <VProbe Pr1 1 1080 490 28 -31 0 0>
  <R R2 1 1000 510 -26 15 0 0 "5 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <PMOS_SPICE M1 1 810 460 -26 34 0 0 "pmod_g_drv" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M2 1 810 560 -26 34 0 0 "nmod_g_drv" 1 "" 0 "" 0 "" 0 "" 0>
  <vPWL V3 1 610 560 -39 95 0 1 "DC 0.0 PWL (0 0 T_R 12 {T_OFF} 12 {T_OFF + T_F} 0 {T_S} 0) r=0" 1 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0>
  <.DC DC1 1 890 140 0 41 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.TR TR1 1 1100 140 0 72 0 0 "lin" 1 "0 ms" 1 "20 ms" 1 "10001" 1 "Gear" 1 "3" 1 "1 ns" 0 "1e-20" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "100ns" 1>
  <SpiceModel SpiceModel_nmod_g_drv1 1 1370 160 -30 15 0 0 ".MODEL nmod_g_drv nmos(VTO=3.0 KP=0.015)" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <SpiceModel SpiceModel_pmod_g_drv1 1 1370 250 -30 15 0 0 ".MODEL pmod_g_drv pmos(VTO=-2.0 KP=0.010)" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <SpicePar BRIDGE_PARAM1 1 1380 350 -29 15 0 0 "PI=3.1415927" 1 "V_F=0.7" 1 "V_PK_LINE={230 * sqrt(2)}V" 1 "V_AVG={V_PK_LINE * 2 / PI}V" 1 "V_O={V_PK_LINE - 2 * V_F}V" 1 "P_LOAD=96.0W" 1 "R_LOAD={V_O^2 / P_LOAD}O" 1 "F_S=200k" 1 "T_S={1 / F_S}" 1 "D=0.33" 1 "T_ON={T_S * D}" 1 "T_OFF={T_S * (1 - D)}" 1 "T_R=5e-9" 1 "T_F=5e-9" 1>
</Components>
<Wires>
  <470 590 470 630 "" 0 0 0 "">
  <610 590 610 630 "" 0 0 0 "">
  <470 510 470 530 "" 0 0 0 "">
  <470 510 610 510 "V_DR" 600 480 98 "">
  <610 510 610 530 "" 0 0 0 "">
  <330 510 330 530 "" 0 0 0 "">
  <330 510 470 510 "" 0 0 0 "">
  <330 590 330 630 "" 0 0 0 "">
  <810 350 810 430 "" 0 0 0 "">
  <650 350 810 350 "" 0 0 0 "">
  <650 350 650 370 "" 0 0 0 "">
  <650 430 650 450 "" 0 0 0 "">
  <830 430 830 460 "" 0 0 0 "">
  <810 430 830 430 "" 0 0 0 "">
  <810 590 810 630 "" 0 0 0 "">
  <830 560 830 590 "" 0 0 0 "">
  <810 590 830 590 "" 0 0 0 "">
  <770 460 780 460 "" 0 0 0 "">
  <770 560 780 560 "" 0 0 0 "">
  <770 460 770 510 "" 0 0 0 "">
  <770 510 770 560 "" 0 0 0 "">
  <610 510 770 510 "" 0 0 0 "">
  <810 490 810 510 "" 0 0 0 "">
  <810 510 810 530 "" 0 0 0 "">
  <810 510 970 510 "" 0 0 0 "">
  <1090 510 1090 530 "" 0 0 0 "">
  <1030 510 1070 510 "V_G" 980 460 6 "">
</Wires>
<Diagrams>
  <Rect 210 961 1637 151 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 1 0 0 "" "" "">
	<"ngspice/tran.v(v_g)" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
