<Qucs Schematic 0.0.22>
<Properties>
  <View=0,7,1694,1178,1,0,0>
  <Grid=10,10,1>
  <DataSet=xspice_clk_test.dat>
  <DataDisplay=xspice_clk_test.dpl>
  <OpenDisplay=1>
  <Script=xspice_clk_test.m>
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
  <GND * 1 900 650 0 0 0 0>
  <SpiceModel SpiceModel_pwm_pulse1 1 150 190 -30 15 0 0 ".MODEL pwm_pulse oneshot(cntl_array = [0 10]," 1 "+   pw_array=[0 {T_S}], out_low=-1.0, out_high=1.0," 1 "+   fall_time=5.0e-9, rise_time=5.0e-9)" 1 "" 0 "Line_5=" 0>
  <SpiceModel SpiceModel_clk1 1 150 520 -30 15 0 0 ".MODEL clk square( cntl_array = [-1 1]," 1 "+   freq_array = [{F_S/2} {3*F_S/2}]," 1 "+   out_low = -1.0, out_high = 1.0," 1 "+   duty_cycle = 0.02" 1 "Line_5=+   rise_time = 40.0e-9, fall_time = 40.0e-9)" 1>
  <Vdc V1 1 900 600 18 -26 0 1 "0 V" 1>
  <XSPICE_A A1 1 960 550 -63 -74 0 0 "v,v" 1 "clk" 1>
  <VProbe Pr1 1 1070 530 28 -31 0 0>
  <GND * 1 1080 550 0 0 0 0>
  <SpicePar BOOST_PFC_PARAM1 1 1240 160 -29 15 0 0 "PI=3.1415927" 1 "V_F=0.7" 1 "V_LINE_MIN_RMS=85" 1 "V_LINE_MAX_RMS=265" 1 "V_LINE_NOM_RMS=230" 1 "V_LINE_NOM_PK={V_LINE_NOM_RMS * sqrt(2)}V" 1 "V_LINE_MAX_PK={V_LINE_MAX_RMS * sqrt(2)}V" 1 "V_LINE_MIN_PK={V_LINE_MIN_RMS * sqrt(2)}V" 1 "V_RECT_NOM_RMS={(V_LINE_NOM_PK - 2 * V_F) / sqrt(2)}" 1 "V_RECT_MIN_RMS={(V_LINE_MIN_PK - 2 * V_F) / sqrt(2)}" 1 "V_AVG={V_LINE_NOM_PK * 2 / PI}V" 1 "V_O=371.5V" 1 "ETA_EST=0.90" 1 "P_LOAD=96.0W" 1 "P_IN={P_LOAD / ETA_EST}" 1 "R_LOAD={V_O^2 / P_LOAD}O" 1 "F_S=200k" 1 "T_S={1 / F_S}" 1 "D=0.1281" 1 "T_ON={T_S * D}" 1 "T_OFF={T_S * (1 - D)}" 1 "T_R=5e-9" 1 "T_F=5e-9" 1 "R_SENSE=100mO" 1 "I_SENSE_NOM_PK={P_IN / V_RECT_NOM_RMS * sqrt(2)}" 1 "I_SENSE_MAX_PK={P_IN / V_RECT_MIN_RMS * sqrt(2)}" 1 "V_ISENSE_FS=10V" 1>
  <.TR TR1 1 140 940 0 66 0 0 "lin" 1 "0 ms" 1 "10 ms" 1 "10001" 1 "Gear" 1 "2" 1 "1 ns" 0 "1e-16" 0 "150" 0 "0.01" 0 "1 uA" 0 "1 mV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "100ns" 1>
  <GND * 1 1030 650 0 0 0 0>
  <R R1 1 1030 600 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <SpiceModel SpiceModel_gain_inv1 1 150 670 -30 15 0 0 ".MODEL gain_inv gain(gain = -5.0, out_offset = 5.0)" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
</Components>
<Wires>
  <900 630 900 650 "" 0 0 0 "">
  <1000 550 1030 550 "" 0 0 0 "">
  <900 550 900 570 "" 0 0 0 "">
  <900 550 920 550 "" 0 0 0 "">
  <1030 550 1060 550 "" 0 0 0 "">
  <1030 550 1030 570 "" 0 0 0 "">
  <1030 630 1030 650 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
