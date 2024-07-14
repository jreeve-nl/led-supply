<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,2024,800,0.751315,0,0>
  <Grid=10,10,1>
  <DataSet=bridge_active_pfc_ss_model.dat>
  <DataDisplay=bridge_active_pfc_ss_model.dpl>
  <OpenDisplay=1>
  <Script=bridge_active_pfc_ss_model.m>
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
  <SpicePar BOOST_PFC_PARAM1 1 1570 190 -29 15 0 0 "PI=3.1415927" 1 "V_F=0.7" 1 "V_LINE_MIN_RMS=85" 1 "V_LINE_MAX_RMS=265" 1 "V_LINE_NOM_RMS=230" 1 "V_LINE_NOM_PK={V_LINE_NOM_RMS * sqrt(2)}V" 1 "V_LINE_MAX_PK={V_LINE_MAX_RMS * sqrt(2)}V" 1 "V_LINE_MIN_PK={V_LINE_MIN_RMS * sqrt(2)}V" 1 "V_RECT_NOM_RMS={(V_LINE_NOM_PK - 2 * V_F) / sqrt(2)}" 1 "V_RECT_MIN_RMS={(V_LINE_MIN_PK - 2 * V_F) / sqrt(2)}" 1 "V_AVG={V_LINE_NOM_PK * 2 / PI}V" 1 "V_O=371.5V" 1 "ETA_EST=0.90" 1 "P_LOAD=96.0W" 1 "P_IN={P_LOAD / ETA_EST}" 1 "R_LOAD={V_O^2 / P_LOAD}O" 1 "F_S=200k" 1 "T_S={1 / F_S}" 1 "D=0.1281" 1 "T_ON={T_S * D}" 1 "T_OFF={T_S * (1 - D)}" 1 "T_R=5e-9" 1 "T_F=5e-9" 1 "R_SENSE=100mO" 1 "I_SENSE_NOM_PK={P_IN / V_RECT_NOM_RMS * sqrt(2)}" 1 "I_SENSE_MAX_PK={P_IN / V_RECT_MIN_RMS * sqrt(2)}" 1 "V_ISENSE_FS=10V" 1>
  <Vdc V1 1 260 350 18 -26 0 1 "1 V" 1>
</Components>
<Wires>
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
