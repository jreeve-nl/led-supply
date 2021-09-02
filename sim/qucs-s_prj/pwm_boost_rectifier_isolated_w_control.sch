<Qucs Schematic 0.0.22>
<Properties>
  <View=0,-188,1676,822,1,0,0>
  <Grid=10,10,1>
  <DataSet=pwm_boost_rectifier_isolated_w_control.dat>
  <DataDisplay=pwm_boost_rectifier_isolated_w_control.dpl>
  <OpenDisplay=1>
  <Script=pwm_boost_rectifier_isolated_w_control.m>
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
  <SpiceModel SWITCH1 1 90 520 -30 15 0 0 ".model switch1 sw vt=0.5 vh=0.2 ron=0.03 roff=1e7" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <SpiceModel DI_1N1 1 90 620 -30 15 0 0 ".MODEL DI_1N5408 D  ( IS=63.0n RS=14.1m BV=1.00k IBV=10.0u " 1 "+ CJO=53.0p  M=0.333 N=1.70 TT=4.32u )" 1 "" 0 "" 0 "Line_5=" 0>
  <SpiceOptions SpiceOptions1 1 870 530 -37 15 0 0 "DEVICE" 0 "GMIN=1e-12" 1 "METHOD=gear" 1 "RELTOL=1m" 1>
  <SpicePar BRIDGE_PARAM1 1 1030 500 -29 15 0 0 "PI=3.1415927" 1 "V_F=0.7" 1 "V_PK_LINE={230 * sqrt(2) - 2.0 * V_F}V" 1 "F_S=132k" 1 "T_S={1 / F_S}" 1 "D=0.1202" 1 "T_ON={D * T_S}" 1 "T_OFF={(1 - D) * T_S}" 1 "V_AVG={V_PK_LINE * 2 / PI}V" 1 "V_O=48.25V" 1 "P_O_MAX=86.4W" 1 "P_LOAD=96.0W" 1 "R_LOAD={V_O^2 / P_O_MAX}O" 1>
  <SpiceModel SpiceModel_DI_ES3C1 1 90 730 -30 15 0 0 ".MODEL DI_ES3C D  ( IS=7.27p RS=22.4m BV=150 IBV=10.0u" 1 "+ CJO=83.2p  M=0.333 N=0.700 TT=36.0n )" 1 "" 0 "" 0 "Line_5=" 0>
  <.TR TR1 1 630 530 0 59 0 0 "lin" 1 "0 ms" 1 "1 ms" 1 "800001" 1 "Gear" 1 "2" 0 "500 ps" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "200 ps" 1>
  <NutmegEq NutmegBridge1 1 1340 510 -27 15 0 0 "tran" 1 "P_L_t=V(Pr1) * vpr5#branch" 1 "P_I_t=V(Pr6) * vpr4#branch" 1 "V_I_rms=sqrt(mean(V(Pr6)^2))" 1 "I_I_rms=sqrt(mean(vpr4#branch^2))" 1 "V_O_rms=sqrt(mean(V(Pr1)^2))" 1 "I_O_rms=sqrt(mean(vpr5#branch^2))" 1 "V_O_ripple=vecmax(V(Pr1)) - vecmin(V(Pr1))" 1>
  <GND * 1 240 400 0 0 0 0>
  <DIODE_SPICE D1 1 320 110 15 -26 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D2 1 320 270 15 -26 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <Vac V1 1 230 200 -26 -56 0 2 "{V_PK_LINE}" 1 "50 Hz" 1 "0" 0 "0" 0>
  <DIODE_SPICE D3 1 80 110 15 -26 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D4 1 80 270 11 10 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <IProbe Pr1 1 150 200 -26 16 0 0>
  <VProbe Pr2 1 230 280 32 3 0 2>
  <L_SPICE L1 1 410 0 -26 -48 0 2 "" 1 "" 0 "" 0 "" 0 "" 0>
  <S4Q_S S1 1 560 70 19 -36 0 1 "SWITCH1" 1 "" 0 "" 0 "" 0 "" 0>
  <S4Q_S S2 1 800 70 19 -36 0 1 "SWITCH1" 1 "" 0 "" 0 "" 0 "" 0>
  <S4Q_S S3 1 560 290 19 -36 0 1 "SWITCH1" 1 "" 0 "" 0 "" 0 "" 0>
  <S4Q_S S4 1 800 290 19 -36 0 1 "SWITCH1" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D5 1 620 70 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D6 1 860 70 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D7 1 620 290 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D8 1 860 290 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <GND * 1 580 400 0 0 0 0>
  <GND * 1 820 400 0 0 0 0>
  <Lib TRAN1 1 1000 120 -20 100 0 0 "Transformers" 0 "PositiveCouplingPS" 0 "0.99" 1 "0.5" 1 "0.125" 1 "2" 1 "1" 1>
  <DIODE_SPICE D9 1 1080 70 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D10 1 1080 290 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D11 1 1240 70 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D12 1 1240 290 15 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
  <GND * 1 1080 400 0 0 0 0>
  <GND * 1 1240 400 0 0 0 0>
</Components>
<Wires>
  <320 0 320 80 "" 0 0 0 "">
  <240 400 320 400 "" 0 0 0 "">
  <320 300 320 400 "" 0 0 0 "">
  <80 400 240 400 "" 0 0 0 "">
  <80 0 320 0 "" 0 0 0 "">
  <80 0 80 80 "" 0 0 0 "">
  <80 300 80 400 "" 0 0 0 "">
  <80 140 80 200 "" 0 0 0 "">
  <80 200 80 240 "" 0 0 0 "">
  <80 200 120 200 "" 0 0 0 "">
  <240 240 240 260 "" 0 0 0 "">
  <240 240 280 240 "" 0 0 0 "">
  <320 140 320 200 "" 0 0 0 "">
  <320 200 320 240 "" 0 0 0 "">
  <260 200 280 200 "" 0 0 0 "">
  <280 200 320 200 "" 0 0 0 "">
  <280 200 280 240 "" 0 0 0 "">
  <220 240 220 260 "" 0 0 0 "">
  <190 240 220 240 "" 0 0 0 "">
  <180 200 190 200 "" 0 0 0 "">
  <190 200 200 200 "" 0 0 0 "">
  <190 200 190 240 "" 0 0 0 "">
  <320 0 380 0 "" 0 0 0 "">
  <560 40 580 40 "" 0 0 0 "">
  <560 100 580 100 "" 0 0 0 "">
  <560 320 580 320 "" 0 0 0 "">
  <560 260 580 260 "" 0 0 0 "">
  <800 320 820 320 "" 0 0 0 "">
  <800 260 820 260 "" 0 0 0 "">
  <800 100 820 100 "" 0 0 0 "">
  <800 40 820 40 "" 0 0 0 "">
  <440 0 580 0 "" 0 0 0 "">
  <580 40 620 40 "" 0 0 0 "">
  <580 0 580 40 "" 0 0 0 "">
  <580 0 820 0 "" 0 0 0 "">
  <820 40 860 40 "" 0 0 0 "">
  <820 0 820 40 "" 0 0 0 "">
  <580 100 620 100 "" 0 0 0 "">
  <580 260 620 260 "" 0 0 0 "">
  <580 100 580 140 "" 0 0 0 "">
  <580 320 620 320 "" 0 0 0 "">
  <580 320 580 400 "" 0 0 0 "">
  <820 100 860 100 "" 0 0 0 "">
  <820 260 860 260 "" 0 0 0 "">
  <820 100 820 210 "" 0 0 0 "">
  <820 320 860 320 "" 0 0 0 "">
  <820 320 820 400 "" 0 0 0 "">
  <580 140 580 260 "" 0 0 0 "">
  <580 140 980 140 "" 0 0 0 "">
  <820 210 820 260 "" 0 0 0 "">
  <820 210 980 210 "" 0 0 0 "">
  <1040 140 1080 140 "" 0 0 0 "">
  <1080 100 1080 140 "" 0 0 0 "">
  <1080 140 1080 260 "" 0 0 0 "">
  <1080 0 1080 40 "" 0 0 0 "">
  <1080 0 1240 0 "" 0 0 0 "">
  <1240 0 1240 40 "" 0 0 0 "">
  <1040 210 1240 210 "" 0 0 0 "">
  <1240 210 1240 260 "" 0 0 0 "">
  <1240 100 1240 210 "" 0 0 0 "">
  <1080 320 1080 400 "" 0 0 0 "">
  <1240 320 1240 400 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>