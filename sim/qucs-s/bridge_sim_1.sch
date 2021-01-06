<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,1356,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=bridge_sim_1.dat>
  <DataDisplay=bridge_sim_1.dpl>
  <OpenDisplay=1>
  <Script=bridge_sim_1.m>
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
  <GND * 1 540 520 0 0 0 0>
  <DIODE_SPICE D3 1 620 230 15 -26 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D4 1 620 390 15 -26 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <INCLSCR INCLSCR1 1 140 460 -68 15 0 0 "\n.CONTROL\nSET D_BRIDGE_MODEL=''DI_1N5408''\n.ENDC" 1 "" 0 "" 0>
  <SpiceModel DI_1N5408 1 110 700 -30 15 0 0 ".MODEL DI_1N5408 D  ( IS=63.0n RS=14.1m BV=1.00k IBV=10.0u " 1 "+ CJO=53.0p  M=0.333 N=1.70 TT=4.32u )" 1 "" 0 "" 0 "Line_5=" 0>
  <Vac V1 1 530 320 -26 -56 0 2 "{V_PK_LINE}" 1 "50 Hz" 1 "0" 0 "0" 0>
  <VProbe Pr1 1 1010 100 28 -31 0 0>
  <GND * 1 1020 140 0 0 0 0>
  <DIODE_SPICE D1 1 380 230 15 -26 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <DIODE_SPICE D2 1 380 390 11 10 0 1 "DI_1N5408" 1 "" 0 "" 0 "" 0 "" 0>
  <GND * 1 900 380 0 0 0 0>
  <R R1 1 900 310 15 -26 0 1 "{R_LOAD}" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 760 380 0 0 0 0>
  <IProbe Pr3 1 760 210 -41 -26 0 3>
  <IProbe Pr4 1 900 210 -41 -26 0 3>
  <IProbe Pr2 1 450 320 -26 16 0 0>
  <VProbe Pr5 1 530 400 32 3 0 2>
  <.TR TR1 1 760 630 0 59 0 0 "lin" 1 "0 ms" 1 "40 ms" 1 "40001" 1 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <SpicePar BRIDGE_PARAM 1 100 120 -29 15 0 0 "PI=3.1415927" 1 "V_F=0.7" 1 "V_PK_LINE={230 * sqrt(2)}V" 1 "V_AVG={V_PK_LINE * 2 / PI}V" 1 "V_O={V_PK_LINE - 2 * V_F}V" 1 "P_LOAD=96.0W" 1 "R_LOAD={V_O^2 / P_LOAD}O" 1>
  <NutmegEq NutmegBridge 1 1020 490 -27 15 0 0 "tran" 1 "P_L_t=V(Pr1) * vpr4#branch" 1 "P_I_t=V(Pr5) * vpr2#branch" 1 "V_I_rms=sqrt(mean(V(Pr5)^2))" 1 "I_I_rms=sqrt(mean(vpr2#branch^2))" 1 "V_O_rms=sqrt(mean(V(Pr1)^2))" 1 "I_O_rms=sqrt(mean(vpr4#branch^2))" 1 "V_O_ripple=vecmax(V(Pr1)) - vecmin(V(Pr1))" 1>
  <C C1 1 760 310 17 -26 0 1 "914u" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <620 120 620 200 "" 0 0 0 "">
  <540 520 620 520 "" 0 0 0 "">
  <620 420 620 520 "" 0 0 0 "">
  <620 260 620 320 "" 0 0 0 "">
  <620 320 620 360 "" 0 0 0 "">
  <560 320 580 320 "" 0 0 0 "">
  <620 120 760 120 "" 0 0 0 "">
  <1020 120 1020 140 "" 0 0 0 "">
  <380 520 540 520 "" 0 0 0 "">
  <380 120 620 120 "" 0 0 0 "">
  <380 120 380 200 "" 0 0 0 "">
  <380 420 380 520 "" 0 0 0 "">
  <380 260 380 320 "" 0 0 0 "">
  <900 340 900 380 "" 0 0 0 "">
  <760 340 760 380 "" 0 0 0 "">
  <760 120 900 120 "V_O" 850 90 61 "">
  <760 120 760 180 "" 0 0 0 "">
  <900 120 1000 120 "" 0 0 0 "">
  <900 120 900 180 "" 0 0 0 "">
  <760 240 760 280 "" 0 0 0 "">
  <900 240 900 280 "" 0 0 0 "">
  <480 320 490 320 "" 0 0 0 "">
  <380 320 380 360 "" 0 0 0 "">
  <380 320 420 320 "" 0 0 0 "">
  <540 360 540 380 "" 0 0 0 "">
  <540 360 580 360 "" 0 0 0 "">
  <580 320 620 320 "" 0 0 0 "">
  <580 320 580 360 "" 0 0 0 "">
  <520 360 520 380 "" 0 0 0 "">
  <490 360 520 360 "" 0 0 0 "">
  <490 320 500 320 "" 0 0 0 "">
  <490 320 490 360 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
