EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:NUCLEO64-F411RE U7
U 1 1 6014D036
P 3600 3000
F 0 "U7" H 3600 5181 50  0000 C CNN
F 1 "NUCLEO64-F411RE" H 3600 5090 50  0000 C CNN
F 2 "Module:ST_Morpho_Connector_144_STLink" H 4150 1100 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/data_brief/DM00105918.pdf" H 2700 1600 50  0001 C CNN
	1    3600 3000
	1    0    0    -1  
$EndComp
Text HLabel 1400 3100 0    50   Output ~ 0
DRV_Q1
Wire Wire Line
	2500 3100 1400 3100
Text HLabel 1400 3200 0    50   Output ~ 0
DRV_Q2
Text HLabel 1400 3300 0    50   Output ~ 0
DRV_Q3
Text HLabel 1400 3400 0    50   Output ~ 0
DRV_Q4
Wire Wire Line
	2500 3200 1400 3200
Wire Wire Line
	1400 3300 2500 3300
Wire Wire Line
	1400 3400 2500 3400
Text HLabel 1400 3500 0    50   Output ~ 0
DRV_Q5
Text HLabel 1400 3600 0    50   Output ~ 0
DRV_Q6
Wire Wire Line
	1400 3500 2500 3500
Wire Wire Line
	2500 3600 1400 3600
$Comp
L power:GND #PWR027
U 1 1 601E5FBD
P 3100 5200
F 0 "#PWR027" H 3100 4950 50  0001 C CNN
F 1 "GND" H 3105 5027 50  0000 C CNN
F 2 "" H 3100 5200 50  0001 C CNN
F 3 "" H 3100 5200 50  0001 C CNN
	1    3100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5200 3100 5000
Text GLabel 3100 5150 0    50   Input ~ 0
GND
Text HLabel 6000 3200 2    50   Input ~ 0
I_SENSE_Q1
Text HLabel 6000 3300 2    50   Input ~ 0
I_SENSE_Q2
Text HLabel 6000 3400 2    50   Input ~ 0
I_SENSE_Q3
Text HLabel 6000 3500 2    50   Input ~ 0
I_SENSE_Q4
Text HLabel 6000 3600 2    50   Input ~ 0
I_SENSE_Q5
Text HLabel 6000 3700 2    50   Input ~ 0
I_SENSE_Q6
Wire Wire Line
	4700 3200 6000 3200
Wire Wire Line
	6000 3300 4700 3300
Wire Wire Line
	6000 3400 4700 3400
Wire Wire Line
	4700 3500 6000 3500
Wire Wire Line
	6000 3600 4700 3600
Wire Wire Line
	4700 3700 6000 3700
Text HLabel 6000 4000 2    50   Input ~ 0
V_SENSE_O
Text HLabel 6000 4100 2    50   Input ~ 0
I_SENSE_O
Wire Wire Line
	4700 4000 6000 4000
Wire Wire Line
	6000 4100 4700 4100
Text HLabel 6000 4200 2    50   Input ~ 0
V_SENSE_I
Text HLabel 6000 4300 2    50   Input ~ 0
I_SENSE_I
Wire Wire Line
	4700 4200 6000 4200
Wire Wire Line
	6000 4300 4700 4300
Text HLabel 4100 850  1    50   Input ~ 0
A_VDD
Wire Wire Line
	4100 1000 4100 850 
$Comp
L power:GNDA #PWR029
U 1 1 601E9DF1
P 4100 5200
F 0 "#PWR029" H 4100 4950 50  0001 C CNN
F 1 "GNDA" H 4105 5027 50  0000 C CNN
F 2 "" H 4100 5200 50  0001 C CNN
F 3 "" H 4100 5200 50  0001 C CNN
	1    4100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5200 4100 5000
Text GLabel 4100 5150 0    50   Input ~ 0
GNDA
$Comp
L power:+5V #PWR028
U 1 1 601EA91E
P 3400 700
F 0 "#PWR028" H 3400 550 50  0001 C CNN
F 1 "+5V" H 3415 873 50  0000 C CNN
F 2 "" H 3400 700 50  0001 C CNN
F 3 "" H 3400 700 50  0001 C CNN
	1    3400 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1000 3400 700 
Text GLabel 3400 750  0    50   Input ~ 0
+5V
Text HLabel 6000 1500 2    50   Output ~ 0
STATE_0
Text HLabel 6000 1600 2    50   Output ~ 0
STATE_1
Wire Wire Line
	4700 1500 6000 1500
Wire Wire Line
	6000 1600 4700 1600
$EndSCHEMATC
