<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,1894,1140,0.751315,0,0>
  <Grid=10,10,1>
  <DataSet=xspice_clk_test_push_pull.dat>
  <DataDisplay=xspice_clk_test_push_pull.dpl>
  <OpenDisplay=1>
  <Script=xspice_clk_test_push_pull.m>
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
  <Vdc V1 1 580 310 18 -26 0 1 "12 V" 1>
  <GND * 1 1020 440 0 0 0 0>
  <VProbe Pr1 1 1010 400 28 -31 0 0>
  <R R1 1 930 420 -26 15 0 0 "5 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <PMOS_SPICE M1 1 740 370 28 -21 0 0 "pmod_g_drv" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M2 1 740 470 35 1 0 0 "nmod_g_drv" 1 "" 0 "" 0 "" 0 "" 0>
  <Vrect V2 0 200 460 18 -26 0 1 "10 V" 1 "5 us" 1 "5 us" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0>
  <XSPICE_A A1 1 480 420 -35 -76 0 0 "v,v" 1 "gain_inv_1" 1>
  <VProbe Pr_V_DRV_G1 1 600 470 -16 28 0 3>
  <VProbe Pr_V_DRV1 1 420 470 -16 28 0 3>
  <vPWL V3 0 340 460 -77 101 0 1 "DC 0.0 PWL (0 0 T_R 12 {T_ON} 12 {T_ON + T_F} 0 {T_S} 0) r=0" 1 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0 "" 0>
  <GND * 1 1120 520 0 0 0 0>
  <Vdc V4 1 1120 470 18 -26 0 1 "0 V" 1>
  <XSPICE_A A2 1 1220 440 -43 -81 0 0 "v,v" 1 "clk12v" 1>
  <GND * 1 740 530 0 0 0 0>
  <GND * 1 580 360 0 0 0 0>
  <SpiceModel SpiceModel_nmod_g_drv1 1 110 650 -30 15 0 0 ".MODEL nmod_g_drv nmos(VTO=3.0 KP=0.015)" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <SpiceModel SpiceModel_pmod_g_drv1 1 110 730 -30 15 0 0 ".MODEL pmod_g_drv pmos(VTO=-2.0 KP=0.010)" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <SpiceModel SpiceModel_clk_12v1 1 110 810 -30 15 0 0 ".MODEL clk12v square(cntl_array = [-1 1]," 1 "+   freq_array = [{F_S/2} {3*F_S/2}]," 1 "+   out_low = 1.0, out_high = 13.0," 1 "+   duty_cycle = 0.1281," 1 "Line_5=+   rise_time = 10.0e-9, fall_time = 10.0e-9)" 1>
  <SPICEINIT SPICEINIT1 1 110 300 -31 15 0 0 "set ngbehavior=ltpsa" 1>
  <SpiceOptions SpiceOptions1 1 110 130 -37 15 0 0 "DEVICE" 0 "GMIN=1e-12" 1 "METHOD=gear" 1 "RELTOL=1m" 1 "VNTOL=1m" 1 "ABSTOL=1u" 1>
  <SpicePar BOOST_PFC_PARAM1 1 1440 130 -29 15 0 0 "PI=3.1415927" 1 "V_F=0.7" 1 "V_LINE_MIN_RMS=85" 1 "V_LINE_MAX_RMS=265" 1 "V_LINE_NOM_RMS=230" 1 "V_LINE_NOM_PK={V_LINE_NOM_RMS * sqrt(2)}V" 1 "V_LINE_MAX_PK={V_LINE_MAX_RMS * sqrt(2)}V" 1 "V_LINE_MIN_PK={V_LINE_MIN_RMS * sqrt(2)}V" 1 "V_RECT_NOM_RMS={(V_LINE_NOM_PK - 2 * V_F) / sqrt(2)}" 1 "V_RECT_MIN_RMS={(V_LINE_MIN_PK - 2 * V_F) / sqrt(2)}" 1 "V_AVG={V_LINE_NOM_PK * 2 / PI}V" 1 "V_O=371.5V" 1 "ETA_EST=0.90" 1 "P_LOAD=96.0W" 1 "P_IN={P_LOAD / ETA_EST}" 1 "R_LOAD={V_O^2 / P_LOAD}O" 1 "F_S=200k" 1 "T_S={1 / F_S}" 1 "D=0.1281" 1 "T_ON={T_S * D}" 1 "T_OFF={T_S * (1 - D)}" 1 "T_R=10e-9" 1 "T_F=10e-9" 1 "R_SENSE=100mO" 1 "I_SENSE_NOM_PK={P_IN / V_RECT_NOM_RMS * sqrt(2)}" 1 "I_SENSE_MAX_PK={P_IN / V_RECT_MIN_RMS * sqrt(2)}" 1 "V_ISENSE_FS=10V" 1>
  <SpiceModel SpiceModel_gain_inv_1 1 110 970 -30 15 0 0 ".MODEL gain_inv_1 gain(in_offset = -1.0, gain = -1.0, out_offset = 12.0)" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <.TR TR1 1 1080 620 0 66 0 0 "lin" 1 "0 ms" 1 "10 ms" 1 "10001" 1 "Gear" 1 "2" 1 "1 ns" 0 "1e-16" 0 "150" 0 "0.01" 0 "1 uA" 0 "1 mV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "5ns" 1>
</Components>
<Wires>
  <740 260 740 340 "" 0 0 0 "">
  <580 260 740 260 "" 0 0 0 "">
  <580 260 580 280 "" 0 0 0 "">
  <580 340 580 360 "" 0 0 0 "">
  <760 340 760 370 "" 0 0 0 "">
  <740 340 760 340 "" 0 0 0 "">
  <760 470 760 500 "" 0 0 0 "">
  <740 500 760 500 "" 0 0 0 "">
  <700 370 710 370 "" 0 0 0 "">
  <700 470 710 470 "" 0 0 0 "">
  <740 400 740 420 "" 0 0 0 "">
  <740 420 740 440 "" 0 0 0 "">
  <740 420 900 420 "" 0 0 0 "">
  <1020 420 1020 440 "" 0 0 0 "">
  <960 420 1000 420 "V_G" 910 370 6 "">
  <740 500 740 530 "" 0 0 0 "">
  <200 490 200 530 "" 0 0 0 "">
  <340 490 340 530 "" 0 0 0 "">
  <340 420 340 430 "" 0 0 0 "">
  <200 530 340 530 "" 0 0 0 "">
  <200 430 200 440 "" 0 0 0 "">
  <200 420 340 420 "V_DRV" 290 390 56 "">
  <200 420 200 430 "" 0 0 0 "">
  <700 370 700 420 "" 0 0 0 "">
  <560 530 740 530 "" 0 0 0 "">
  <560 480 560 530 "" 0 0 0 "">
  <560 480 580 480 "" 0 0 0 "">
  <700 420 700 470 "" 0 0 0 "">
  <520 420 560 420 "" 0 0 0 "">
  <560 420 700 420 "V_DRV_G" 610 380 40 "">
  <560 420 560 460 "" 0 0 0 "">
  <560 460 580 460 "" 0 0 0 "">
  <380 460 400 460 "" 0 0 0 "">
  <340 420 380 420 "" 0 0 0 "">
  <380 420 440 420 "" 0 0 0 "">
  <380 420 380 460 "" 0 0 0 "">
  <380 480 400 480 "" 0 0 0 "">
  <340 530 380 530 "" 0 0 0 "">
  <380 530 560 530 "" 0 0 0 "">
  <380 480 380 530 "" 0 0 0 "">
  <1120 440 1180 440 "" 0 0 0 "">
  <1120 500 1120 520 "" 0 0 0 "">
  <1260 440 1340 440 "V_DRV" 1330 410 38 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
