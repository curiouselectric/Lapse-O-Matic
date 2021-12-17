EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L WildlifeCamera_PCB-rescue:R-Device R10
U 1 1 5F433F45
P 5550 3400
F 0 "R10" H 5620 3447 50  0000 L CNN
F 1 "10k" H 5620 3354 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5480 3400 50  0001 C CNN
F 3 "~" H 5550 3400 50  0001 C CNN
	1    5550 3400
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R1
U 1 1 5F4345CF
P 1750 6250
F 0 "R1" V 1540 6250 50  0000 C CNN
F 1 "330" V 1633 6250 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1680 6250 50  0001 C CNN
F 3 "~" H 1750 6250 50  0001 C CNN
	1    1750 6250
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x03-Connector_Generic J1
U 1 1 5F434B25
P 1050 6250
F 0 "J1" V 967 5920 50  0000 C CNN
F 1 "PIR" H 967 6013 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_PIR_SENSOR" H 1050 6250 50  0001 C CNN
F 3 "~" H 1050 6250 50  0001 C CNN
	1    1050 6250
	-1   0    0    1   
$EndComp
$Comp
L power1:GND #PWR03
U 1 1 5F43612D
P 1500 6600
F 0 "#PWR03" H 1500 6350 50  0001 C CNN
F 1 "GND" H 1500 6450 50  0000 C CNN
F 2 "" H 1500 6600 50  0000 C CNN
F 3 "" H 1500 6600 50  0000 C CNN
	1    1500 6600
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR022
U 1 1 5F4386F1
P 8800 2800
F 0 "#PWR022" H 8800 2550 50  0001 C CNN
F 1 "GND" H 8800 2650 50  0000 C CNN
F 2 "" H 8800 2800 50  0000 C CNN
F 3 "" H 8800 2800 50  0000 C CNN
	1    8800 2800
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR02
U 1 1 5F4389FE
P 1500 5850
F 0 "#PWR02" H 1500 5700 50  0001 C CNN
F 1 "+3.3V" H 1515 6026 50  0000 C CNN
F 2 "" H 1500 5850 50  0001 C CNN
F 3 "" H 1500 5850 50  0001 C CNN
	1    1500 5850
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR07
U 1 1 5F439209
P 2700 6600
F 0 "#PWR07" H 2700 6350 50  0001 C CNN
F 1 "GND" H 2700 6450 50  0000 C CNN
F 2 "" H 2700 6600 50  0000 C CNN
F 3 "" H 2700 6600 50  0000 C CNN
	1    2700 6600
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR018
U 1 1 5F43E1BA
P 5350 2200
F 0 "#PWR018" H 5350 1950 50  0001 C CNN
F 1 "GND" H 5350 2050 50  0000 C CNN
F 2 "" H 5350 2200 50  0000 C CNN
F 3 "" H 5350 2200 50  0000 C CNN
	1    5350 2200
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR023
U 1 1 5F43E4F8
P 8950 2350
F 0 "#PWR023" H 8950 2100 50  0001 C CNN
F 1 "GND" H 8950 2200 50  0000 C CNN
F 2 "" H 8950 2350 50  0000 C CNN
F 3 "" H 8950 2350 50  0000 C CNN
	1    8950 2350
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR021
U 1 1 5F43E8AB
P 8800 2000
F 0 "#PWR021" H 8800 1850 50  0001 C CNN
F 1 "+3.3V" H 8815 2176 50  0000 C CNN
F 2 "" H 8800 2000 50  0001 C CNN
F 3 "" H 8800 2000 50  0001 C CNN
	1    8800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 2050 8800 2000
Wire Wire Line
	8800 2750 8800 2800
Wire Wire Line
	5350 2150 5350 2200
Wire Wire Line
	2700 6450 2700 6600
Wire Wire Line
	1250 6150 1500 6150
Wire Wire Line
	1500 6150 1500 5850
Wire Wire Line
	1250 6250 1600 6250
Wire Wire Line
	1250 6350 1500 6350
Wire Wire Line
	1500 6350 1500 6600
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x03-Connector_Generic J2
U 1 1 5F455A97
P 3650 6300
F 0 "J2" V 3567 5970 50  0000 C CNN
F 1 "TRIG" H 3567 6063 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_lg_pad" H 3650 6300 50  0001 C CNN
F 3 "~" H 3650 6300 50  0001 C CNN
	1    3650 6300
	-1   0    0    1   
$EndComp
$Comp
L matts_components:SPST SW1
U 1 1 5F462D31
P 2650 1850
F 0 "SW1" H 2650 2120 50  0000 C CNN
F 1 "POWER" H 2650 2027 50  0000 C CNN
F 2 "REInnovationFootprint:SW_SPDT_R_Angle_ALIEX" H 2650 1850 50  0001 C CNN
F 3 "" H 2650 1850 50  0000 C CNN
	1    2650 1850
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR01
U 1 1 5F463920
P 2400 2350
F 0 "#PWR01" H 2400 2200 50  0001 C CNN
F 1 "VCC" H 2400 2500 50  0000 C CNN
F 2 "" H 2400 2350 50  0000 C CNN
F 3 "" H 2400 2350 50  0000 C CNN
	1    2400 2350
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR010
U 1 1 5F463CF4
P 3600 2150
F 0 "#PWR010" H 3600 1900 50  0001 C CNN
F 1 "GND" H 3600 2000 50  0000 C CNN
F 2 "" H 3600 2150 50  0000 C CNN
F 3 "" H 3600 2150 50  0000 C CNN
	1    3600 2150
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR012
U 1 1 5F467366
P 4550 1300
F 0 "#PWR012" H 4550 1150 50  0001 C CNN
F 1 "+3.3V" H 4565 1476 50  0000 C CNN
F 2 "" H 4550 1300 50  0001 C CNN
F 3 "" H 4550 1300 50  0001 C CNN
	1    4550 1300
	1    0    0    -1  
$EndComp
$Comp
L device:CP C1
U 1 1 5F46966A
P 2950 1650
F 0 "C1" H 3070 1697 50  0000 L CNN
F 1 "1uf" H 3070 1604 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 2988 1500 50  0001 C CNN
F 3 "~" H 2950 1650 50  0001 C CNN
	1    2950 1650
	1    0    0    -1  
$EndComp
$Comp
L device:CP C3
U 1 1 5F469C49
P 4300 1650
F 0 "C3" H 4420 1697 50  0000 L CNN
F 1 "1uf" H 4420 1604 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 4338 1500 50  0001 C CNN
F 3 "~" H 4300 1650 50  0001 C CNN
	1    4300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1350 4300 1350
Wire Wire Line
	4550 1350 4550 1300
Wire Wire Line
	4300 1500 4300 1350
Connection ~ 4300 1350
Wire Wire Line
	4300 1350 4550 1350
Wire Wire Line
	2650 1350 2950 1350
Wire Wire Line
	2950 1350 2950 1500
Wire Wire Line
	2950 1800 2950 1950
Wire Wire Line
	2950 1950 3600 1950
Wire Wire Line
	4300 1950 4300 1800
Wire Wire Line
	3600 1650 3600 1950
Connection ~ 3600 1950
Wire Wire Line
	3600 1950 4300 1950
Wire Wire Line
	3600 1950 3600 2150
Wire Wire Line
	2950 1350 3200 1350
Connection ~ 2950 1350
$Comp
L WildlifeCamera_PCB-rescue:LED-device D4
U 1 1 5F4D026C
P 5100 3250
F 0 "D4" V 5140 3130 50  0000 R CNN
F 1 "TRIG?" V 5047 3130 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 5100 3250 50  0001 C CNN
F 3 "~" H 5100 3250 50  0001 C CNN
	1    5100 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 6250 2150 6250
$Comp
L WildlifeCamera_PCB-rescue:SW_Push-Switch SW2
U 1 1 5F4DA4DE
P 4700 5900
F 0 "SW2" V 4747 5850 50  0000 R CNN
F 1 "TRIGGER" V 4654 5850 50  0000 R CNN
F 2 "REInnovationFootprint:SW_PUSH_SMALL_lg_pad" H 4700 6100 50  0001 C CNN
F 3 "~" H 4700 6100 50  0001 C CNN
	1    4700 5900
	0    -1   -1   0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R6
U 1 1 5F4DF1E6
P 4850 6300
F 0 "R6" V 4640 6300 50  0000 C CNN
F 1 "330" V 4733 6300 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 4780 6300 50  0001 C CNN
F 3 "~" H 4850 6300 50  0001 C CNN
	1    4850 6300
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R9
U 1 1 5F4DFB70
P 5100 3700
F 0 "R9" H 5170 3747 50  0000 L CNN
F 1 "330" H 5170 3654 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5030 3700 50  0001 C CNN
F 3 "~" H 5100 3700 50  0001 C CNN
	1    5100 3700
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR015
U 1 1 5F4E0074
P 5100 2900
F 0 "#PWR015" H 5100 2750 50  0001 C CNN
F 1 "+3.3V" H 5115 3076 50  0000 C CNN
F 2 "" H 5100 2900 50  0001 C CNN
F 3 "" H 5100 2900 50  0001 C CNN
	1    5100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3400 5100 3550
Wire Wire Line
	5100 3850 5100 3950
$Comp
L power1:GND #PWR016
U 1 1 5F4E6DB4
P 5450 6900
F 0 "#PWR016" H 5450 6650 50  0001 C CNN
F 1 "GND" H 5450 6750 50  0000 C CNN
F 2 "" H 5450 6900 50  0000 C CNN
F 3 "" H 5450 6900 50  0000 C CNN
	1    5450 6900
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR014
U 1 1 5F4E713C
P 4050 6500
F 0 "#PWR014" H 4050 6250 50  0001 C CNN
F 1 "GND" H 4050 6350 50  0000 C CNN
F 2 "" H 4050 6500 50  0000 C CNN
F 3 "" H 4050 6500 50  0000 C CNN
	1    4050 6500
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR013
U 1 1 5F4E76B0
P 4050 5500
F 0 "#PWR013" H 4050 5350 50  0001 C CNN
F 1 "+3.3V" H 4065 5676 50  0000 C CNN
F 2 "" H 4050 5500 50  0001 C CNN
F 3 "" H 4050 5500 50  0001 C CNN
	1    4050 5500
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R2
U 1 1 5F4E7ABA
P 2150 6500
F 0 "R2" H 2220 6547 50  0000 L CNN
F 1 "100k" H 2220 6454 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2080 6500 50  0001 C CNN
F 3 "~" H 2150 6500 50  0001 C CNN
	1    2150 6500
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR05
U 1 1 5F4E7F19
P 2150 6750
F 0 "#PWR05" H 2150 6500 50  0001 C CNN
F 1 "GND" H 2150 6600 50  0000 C CNN
F 2 "" H 2150 6750 50  0000 C CNN
F 3 "" H 2150 6750 50  0000 C CNN
	1    2150 6750
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R8
U 1 1 5F4E826D
P 5150 6550
F 0 "R8" H 5220 6597 50  0000 L CNN
F 1 "100k" H 5220 6504 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5080 6550 50  0001 C CNN
F 3 "~" H 5150 6550 50  0001 C CNN
	1    5150 6550
	1    0    0    -1  
$EndComp
Text Label 5800 3950 0    60   ~ 0
TRIG
Text Label 5550 5800 0    60   ~ 0
TRIG
Wire Wire Line
	5550 6100 5550 5800
Wire Wire Line
	3850 6200 4050 6200
Wire Wire Line
	5000 6300 5150 6300
Wire Wire Line
	5150 6700 5150 6800
Wire Wire Line
	5150 6800 5450 6800
Wire Wire Line
	5550 6800 5550 6500
Wire Wire Line
	5450 6900 5450 6800
Connection ~ 5450 6800
Wire Wire Line
	5450 6800 5550 6800
Wire Wire Line
	5150 6400 5150 6300
Connection ~ 5150 6300
Wire Wire Line
	5150 6300 5250 6300
Wire Wire Line
	3850 6400 4050 6400
Wire Wire Line
	4050 6400 4050 6500
Wire Wire Line
	2150 6350 2150 6250
Connection ~ 2150 6250
Wire Wire Line
	2150 6250 2400 6250
Wire Wire Line
	2150 6650 2150 6750
Text Label 2700 5900 0    60   ~ 0
TRIG
Wire Wire Line
	2700 6050 2700 5900
Text Notes 1850 5700 0    60   ~ 0
PIR Trigger
Text Notes 4400 5400 0    60   ~ 0
EXTERNAL Trigger
Text Notes 7000 1050 0    60   ~ 0
ESP32_CAM Pinout
Text Notes 2950 950  0    60   ~ 0
Power Supply 3.3V 1A
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x06-Connector_Generic J4
U 1 1 5F50D962
P 10550 1600
F 0 "J4" H 10630 1592 50  0000 L CNN
F 1 "PROG" H 10630 1499 50  0000 L CNN
F 2 "REInnovationFootprint:TH_6x1_CONN" H 10550 1600 50  0001 C CNN
F 3 "~" H 10550 1600 50  0001 C CNN
	1    10550 1600
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x02-Connector_Generic J5
U 1 1 5F50EC3E
P 10550 2150
F 0 "J5" H 10630 2142 50  0000 L CNN
F 1 "PROG_EN" H 10630 2049 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Pin_Header_Straight_1x02" H 10550 2150 50  0001 C CNN
F 3 "~" H 10550 2150 50  0001 C CNN
	1    10550 2150
	1    0    0    -1  
$EndComp
Text Notes 10150 1000 0    60   ~ 0
Programming
Text Label 8700 2250 0    60   ~ 0
PROG_EN
Text Label 9850 2150 0    60   ~ 0
PROG_EN
$Comp
L power1:GND #PWR025
U 1 1 5F53D671
P 9850 2350
F 0 "#PWR025" H 9850 2100 50  0001 C CNN
F 1 "GND" H 9850 2200 50  0000 C CNN
F 2 "" H 9850 2350 50  0000 C CNN
F 3 "" H 9850 2350 50  0000 C CNN
	1    9850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 2150 10350 2150
Wire Wire Line
	10350 2250 9850 2250
Wire Wire Line
	9850 2250 9850 2350
$Comp
L power1:GND #PWR026
U 1 1 5F547C35
P 10100 1300
F 0 "#PWR026" H 10100 1050 50  0001 C CNN
F 1 "GND" H 10100 1150 50  0000 C CNN
F 2 "" H 10100 1300 50  0000 C CNN
F 3 "" H 10100 1300 50  0000 C CNN
	1    10100 1300
	1    0    0    -1  
$EndComp
Text Label 5750 2050 0    60   ~ 0
5V_PWR
Text Label 9800 1600 0    60   ~ 0
5V_PWR
Wire Wire Line
	10350 1600 9800 1600
Wire Wire Line
	10100 1300 10250 1300
Wire Wire Line
	10250 1300 10250 1400
Wire Wire Line
	10250 1400 10350 1400
Text Label 8650 2550 0    60   ~ 0
U0R
Text Label 8650 2650 0    60   ~ 0
U0T
Text Label 9900 1700 0    60   ~ 0
U0R
Text Label 9900 1800 0    60   ~ 0
U0T
Wire Wire Line
	10350 1800 9900 1800
Wire Wire Line
	9900 1700 10350 1700
Text Label 5750 2450 0    60   ~ 0
I2C_CLK
Text Label 5750 2550 0    60   ~ 0
I2C_DAT
Text Notes 10000 3650 0    60   ~ 0
RTC DS3231
Text Notes 6450 1550 0    60   ~ 0
SD Card is changed from 4 bit write to 1 bit write.\nThis frees up 3 x GPIO.\n1 is for External Interrupt\n2 are form I2C - connect to RTC.
$Comp
L matts_components:ZENER D1
U 1 1 5F4F0673
P 4300 6600
F 0 "D1" V 4253 6680 50  0000 L CNN
F 1 "ZENER" V 4346 6680 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Diode_3" H 4300 6600 50  0001 C CNN
F 3 "" H 4300 6600 50  0000 C CNN
	1    4300 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 5700 4700 5600
Wire Wire Line
	4050 5600 4050 6200
Wire Wire Line
	4050 5600 4050 5500
Connection ~ 4050 5600
Wire Wire Line
	4700 6100 4700 6300
Connection ~ 4700 6300
NoConn ~ 10350 1500
NoConn ~ 10350 1900
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 5F562F8B
P 6550 6850
F 0 "J7" H 6630 6892 50  0000 L CNN
F 1 "LOGO2" H 6630 6799 50  0000 L CNN
F 2 "CuriousElectric3:2019_011_16_CuriousElectricCompany_Logo_Round_Logo_No_words_KiCAD_10mm_PCBLogo" H 6550 6850 50  0001 C CNN
F 3 "~" H 6550 6850 50  0001 C CNN
	1    6550 6850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 5F5632BE
P 6550 7100
F 0 "J8" H 6630 7142 50  0000 L CNN
F 1 "PCB" H 6630 7049 50  0000 L CNN
F 2 "REInnovationFootprint:PCB_SolarChargerPCB40x80" H 6550 7100 50  0001 C CNN
F 3 "~" H 6550 7100 50  0001 C CNN
	1    6550 7100
	1    0    0    -1  
$EndComp
NoConn ~ 6350 6650
NoConn ~ 6350 6850
NoConn ~ 6350 7100
Wire Wire Line
	8200 2150 8250 2150
Wire Wire Line
	8200 2450 8250 2450
Wire Wire Line
	6750 2250 6650 2250
$Comp
L matts_components:MCP1826S-3302 U1
U 1 1 5F5E56C3
P 3600 1400
F 0 "U1" H 3600 1745 60  0000 C CNN
F 1 "MCP1826S-3302" H 3600 1635 60  0000 C CNN
F 2 "REInnovationFootprint:TO220_MCP1826S" H 3600 1400 60  0001 C CNN
F 3 "http://docs-europe.electrocomponents.com/webdocs/137e/0900766b8137eda2.pdf" H 3600 1635 60  0001 C CNN
	1    3600 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2050 8800 2050
Wire Wire Line
	8200 2250 8700 2250
Wire Wire Line
	8200 2350 8950 2350
Wire Wire Line
	8200 2550 8650 2550
Wire Wire Line
	8200 2650 8650 2650
Wire Wire Line
	8200 2750 8800 2750
Wire Wire Line
	5350 2150 6750 2150
Wire Wire Line
	5750 2050 6750 2050
NoConn ~ 6650 2250
NoConn ~ 6650 2650
NoConn ~ 8250 2150
NoConn ~ 8250 2450
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 5F562AB4
P 6550 6650
F 0 "J6" H 6630 6692 50  0000 L CNN
F 1 "LOGO1" H 6630 6599 50  0000 L CNN
F 2 "CuriousElectric3:TCEC_Words_13mm" H 6550 6650 50  0001 C CNN
F 3 "~" H 6550 6650 50  0001 C CNN
	1    6550 6650
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R11
U 1 1 5F5439ED
P 1550 3850
F 0 "R11" V 1340 3850 50  0000 C CNN
F 1 "330" V 1433 3850 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1480 3850 50  0001 C CNN
F 3 "~" H 1550 3850 50  0001 C CNN
	1    1550 3850
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Q_NPN_BCE-Device Q3
U 1 1 5F5439F7
P 2150 3850
F 0 "Q3" H 2340 3897 50  0000 L CNN
F 1 "BD135" H 2340 3804 50  0000 L CNN
F 2 "REInnovationFootprint:TO220_BD135" H 2350 3950 50  0001 C CNN
F 3 "~" H 2150 3850 50  0001 C CNN
	1    2150 3850
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR028
U 1 1 5F543A01
P 2150 4450
F 0 "#PWR028" H 2150 4200 50  0001 C CNN
F 1 "GND" H 2150 4300 50  0000 C CNN
F 2 "" H 2150 4450 50  0000 C CNN
F 3 "" H 2150 4450 50  0000 C CNN
	1    2150 4450
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R12
U 1 1 5F543A0B
P 1850 4100
F 0 "R12" H 1920 4147 50  0000 L CNN
F 1 "100k" H 1920 4054 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1780 4100 50  0001 C CNN
F 3 "~" H 1850 4100 50  0001 C CNN
	1    1850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3650 2250 3350
Wire Wire Line
	1700 3850 1850 3850
Wire Wire Line
	1850 4250 1850 4350
Wire Wire Line
	1850 4350 2150 4350
Wire Wire Line
	2250 4350 2250 4050
Wire Wire Line
	2150 4450 2150 4350
Connection ~ 2150 4350
Wire Wire Line
	2150 4350 2250 4350
Wire Wire Line
	1850 3950 1850 3850
Connection ~ 1850 3850
Wire Wire Line
	1850 3850 1950 3850
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR029
U 1 1 5F54F9CF
P 3750 3250
F 0 "#PWR029" H 3750 3100 50  0001 C CNN
F 1 "+3.3V" H 3765 3426 50  0000 C CNN
F 2 "" H 3750 3250 50  0001 C CNN
F 3 "" H 3750 3250 50  0001 C CNN
	1    3750 3250
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D5
U 1 1 5F5503F1
P 3300 3350
F 0 "D5" V 3340 3230 50  0000 R CNN
F 1 "FLASH" V 3247 3230 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3300 3350 50  0001 C CNN
F 3 "~" H 3300 3350 50  0001 C CNN
	1    3300 3350
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D6
U 1 1 5F550E8E
P 3300 3750
F 0 "D6" V 3340 3630 50  0000 R CNN
F 1 "FLASH" V 3247 3630 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3300 3750 50  0001 C CNN
F 3 "~" H 3300 3750 50  0001 C CNN
	1    3300 3750
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D7
U 1 1 5F5511AB
P 3300 4150
F 0 "D7" V 3340 4030 50  0000 R CNN
F 1 "FLASH" V 3247 4030 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3300 4150 50  0001 C CNN
F 3 "~" H 3300 4150 50  0001 C CNN
	1    3300 4150
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D8
U 1 1 5F55161A
P 3300 4550
F 0 "D8" V 3340 4430 50  0000 R CNN
F 1 "FLASH" V 3247 4430 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3300 4550 50  0001 C CNN
F 3 "~" H 3300 4550 50  0001 C CNN
	1    3300 4550
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R13
U 1 1 5F557941
P 2900 3350
F 0 "R13" H 2970 3397 50  0000 L CNN
F 1 "100" H 2970 3304 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2830 3350 50  0001 C CNN
F 3 "~" H 2900 3350 50  0001 C CNN
	1    2900 3350
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R14
U 1 1 5F5580BC
P 2900 3750
F 0 "R14" H 2970 3797 50  0000 L CNN
F 1 "100" H 2970 3704 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2830 3750 50  0001 C CNN
F 3 "~" H 2900 3750 50  0001 C CNN
	1    2900 3750
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R15
U 1 1 5F558344
P 2900 4150
F 0 "R15" H 2970 4197 50  0000 L CNN
F 1 "100" H 2970 4104 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2830 4150 50  0001 C CNN
F 3 "~" H 2900 4150 50  0001 C CNN
	1    2900 4150
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R16
U 1 1 5F5586EA
P 2900 4550
F 0 "R16" H 2970 4597 50  0000 L CNN
F 1 "100" H 2970 4504 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2830 4550 50  0001 C CNN
F 3 "~" H 2900 4550 50  0001 C CNN
	1    2900 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 4550 3750 4550
Wire Wire Line
	3750 4550 3750 4150
Wire Wire Line
	2250 3350 2650 3350
Wire Wire Line
	2650 3350 2650 3750
Wire Wire Line
	2650 4550 2750 4550
Wire Wire Line
	2650 3350 2750 3350
Connection ~ 2650 3350
Wire Wire Line
	3050 3350 3150 3350
Wire Wire Line
	3450 3350 3750 3350
Connection ~ 3750 3350
Wire Wire Line
	3750 3350 3750 3250
Wire Wire Line
	2750 3750 2650 3750
Connection ~ 2650 3750
Wire Wire Line
	2650 3750 2650 4150
Wire Wire Line
	2750 4150 2650 4150
Connection ~ 2650 4150
Wire Wire Line
	2650 4150 2650 4550
Wire Wire Line
	3050 3750 3150 3750
Wire Wire Line
	3050 4150 3150 4150
Wire Wire Line
	3050 4550 3150 4550
Wire Wire Line
	3450 4150 3750 4150
Connection ~ 3750 4150
Wire Wire Line
	3750 4150 3750 3750
Wire Wire Line
	3450 3750 3750 3750
Connection ~ 3750 3750
Wire Wire Line
	3750 3750 3750 3350
Wire Wire Line
	1000 3850 1400 3850
Text Notes 1600 3350 0    60   ~ 0
LED Control
Wire Wire Line
	2400 2350 2400 2400
Wire Wire Line
	2400 2400 2650 2400
Wire Wire Line
	2650 2400 2650 2350
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 5F9E542B
P 10550 4200
F 0 "J3" H 10630 4242 50  0000 L CNN
F 1 "RTC_DS3231" H 10630 4151 50  0000 L CNN
F 2 "REInnovationFootprint:TH_RTC_MODULE_SM" H 10550 4200 50  0001 C CNN
F 3 "~" H 10550 4200 50  0001 C CNN
	1    10550 4200
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR024
U 1 1 5F9E59FA
P 10200 4000
F 0 "#PWR024" H 10200 3850 50  0001 C CNN
F 1 "+3.3V" H 10215 4176 50  0000 C CNN
F 2 "" H 10200 4000 50  0001 C CNN
F 3 "" H 10200 4000 50  0001 C CNN
	1    10200 4000
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR027
U 1 1 5F9E5C64
P 10200 4400
F 0 "#PWR027" H 10200 4150 50  0001 C CNN
F 1 "GND" H 10200 4250 50  0000 C CNN
F 2 "" H 10200 4400 50  0000 C CNN
F 3 "" H 10200 4400 50  0000 C CNN
	1    10200 4400
	1    0    0    -1  
$EndComp
Text Label 9800 4200 0    60   ~ 0
I2C_CLK
Text Label 9800 4100 0    60   ~ 0
I2C_DAT
NoConn ~ 10350 4300
Wire Wire Line
	10350 4400 10200 4400
Wire Wire Line
	10200 4000 10350 4000
Wire Wire Line
	3850 6300 4300 6300
Wire Wire Line
	4050 5600 4700 5600
Wire Wire Line
	4300 6400 4300 6300
Connection ~ 4300 6300
Wire Wire Line
	4300 6300 4700 6300
$Comp
L power1:GND #PWR0101
U 1 1 5FA7F2FD
P 4300 6900
F 0 "#PWR0101" H 4300 6650 50  0001 C CNN
F 1 "GND" H 4300 6750 50  0000 C CNN
F 2 "" H 4300 6900 50  0000 C CNN
F 3 "" H 4300 6900 50  0000 C CNN
	1    4300 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6900 4300 6800
$Comp
L matts_components:NPN Q1
U 1 1 5FCCCC31
P 2600 6250
F 0 "Q1" H 2790 6297 50  0000 L CNN
F 1 "BC547C" H 2790 6204 50  0000 L CNN
F 2 "REInnovationFootprint:NPN_BC337" H 2600 6250 60  0001 C CNN
F 3 "transistors/bipolar/*.*" H 2790 6157 60  0001 L CNN
	1    2600 6250
	1    0    0    -1  
$EndComp
$Comp
L matts_components:NPN Q2
U 1 1 5FCD0A57
P 5450 6300
F 0 "Q2" H 5640 6347 50  0000 L CNN
F 1 "BC547C" H 5640 6254 50  0000 L CNN
F 2 "REInnovationFootprint:NPN_BC337" H 5450 6300 60  0001 C CNN
F 3 "transistors/bipolar/*.*" H 5640 6207 60  0001 L CNN
	1    5450 6300
	1    0    0    -1  
$EndComp
Text Notes 6900 3950 0    60   ~ 0
GPIO12 = HS2_DATA2\nGPIO12 = HS2_DATA2\nGPIO15 = HS2_DATA3\nGPIO14 = HS2_CLK\nGPIO2 = HS2_DATA0\nGPIO4 = HS2_DATA1/Flash\n
Wire Wire Line
	6750 2650 6650 2650
Wire Wire Line
	5750 2550 6750 2550
Wire Wire Line
	5750 2450 6750 2450
$Comp
L matts_components:ESP32_CAM U3
U 1 1 5F431B0D
P 7550 1950
F 0 "U3" H 7475 2145 60  0000 C CNN
F 1 "ESP32_CAM" H 7475 2035 60  0000 C CNN
F 2 "REInnovationFootprint:ESP32_CAM" H 7550 1950 60  0001 C CNN
F 3 "" H 7550 1950 60  0001 C CNN
	1    7550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4100 10350 4100
Wire Wire Line
	10350 4200 9800 4200
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 60F7BB91
P 1200 1700
F 0 "J10" H 1118 1375 50  0000 C CNN
F 1 "POWER" H 1118 1466 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-2_screw_terminal" H 1200 1700 50  0001 C CNN
F 3 "~" H 1200 1700 50  0001 C CNN
	1    1200 1700
	-1   0    0    1   
$EndComp
$Comp
L power1:VCC #PWR0102
U 1 1 60F7C351
P 1550 1550
F 0 "#PWR0102" H 1550 1400 50  0001 C CNN
F 1 "VCC" H 1550 1700 50  0000 C CNN
F 2 "" H 1550 1550 50  0000 C CNN
F 3 "" H 1550 1550 50  0000 C CNN
	1    1550 1550
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR0103
U 1 1 60F7C877
P 1550 1750
F 0 "#PWR0103" H 1550 1500 50  0001 C CNN
F 1 "GND" H 1550 1600 50  0000 C CNN
F 2 "" H 1550 1750 50  0000 C CNN
F 3 "" H 1550 1750 50  0000 C CNN
	1    1550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1600 1550 1600
Wire Wire Line
	1550 1600 1550 1550
Wire Wire Line
	1400 1700 1550 1700
Wire Wire Line
	1550 1700 1550 1750
NoConn ~ 6350 7350
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 60F795A6
P 6550 7350
F 0 "J9" H 6630 7392 50  0000 L CNN
F 1 "LOGO3" H 6630 7299 50  0000 L CNN
F 2 "REInnovationGraphics:lapseomatic logo" H 6550 7350 50  0001 C CNN
F 3 "~" H 6550 7350 50  0001 C CNN
	1    6550 7350
	1    0    0    -1  
$EndComp
NoConn ~ 6350 7550
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 60F7DA72
P 6550 7550
F 0 "J11" H 6630 7592 50  0000 L CNN
F 1 "LOGO4" H 6630 7499 50  0000 L CNN
F 2 "REInnovationGraphics:lapseomatic logo_20x6mm" H 6550 7550 50  0001 C CNN
F 3 "~" H 6550 7550 50  0001 C CNN
	1    6550 7550
	1    0    0    -1  
$EndComp
Text Label 6300 2750 0    60   ~ 0
FLASH
Wire Wire Line
	6300 2750 6750 2750
Text Label 1000 3850 0    60   ~ 0
FLASH
Wire Wire Line
	5100 2900 5100 3100
Wire Wire Line
	5100 3950 5550 3950
Wire Wire Line
	5550 2350 5550 3250
Wire Wire Line
	5550 2350 6750 2350
Wire Wire Line
	5550 3550 5550 3950
Connection ~ 5550 3950
Wire Wire Line
	5550 3950 5800 3950
$EndSCHEMATC