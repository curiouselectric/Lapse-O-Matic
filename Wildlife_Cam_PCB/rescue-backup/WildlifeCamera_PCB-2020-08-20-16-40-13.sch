EESchema Schematic File Version 2
LIBS:SolarCharger2017-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:matts_components
LIBS:SolarCharger2017-cache
EELAYER 25 0
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
L Battery_Cell BT1
U 1 1 58B31232
P 7050 3300
F 0 "BT1" H 7150 3400 50  0000 L CNN
F 1 "18650 LiIon Cell" H 7150 3300 50  0000 L CNN
F 2 "REInnovationFootprint:TH_LiIon_Holder" V 7050 3360 50  0001 C CNN
F 3 "" V 7050 3360 50  0000 C CNN
F 4 "~" H 7050 3300 60  0000 C CNN "Notes"
F 5 "18650 PCB mount holder" H 7050 3300 60  0001 C CNN "Description"
F 6 "~" H 7050 3300 60  0001 C CNN "Manufacturer"
F 7 "~" H 7050 3300 60  0001 C CNN "Manufacturer Part No"
F 8 "eBay" H 7050 3300 60  0001 C CNN "Supplier 1"
F 9 "http://www.ebay.co.uk/itm/122466718109" H 7050 3300 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.50" H 7050 3300 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 7050 3300 60  0001 C CNN "Supplier 2"
F 12 "~" H 7050 3300 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 7050 3300 60  0001 C CNN "Supplier 2 Cost"
	1    7050 3300
	1    0    0    -1  
$EndComp
$Comp
L Solar_Cells SC1
U 1 1 58B31275
P 2000 3150
F 0 "SC1" H 2100 3250 50  0000 L CNN
F 1 "PV <2W 5.5V" H 2100 3150 50  0000 L CNN
F 2 "REInnovationFootprint:PV_130mmx65mm_NoOutline" V 2000 3210 50  0001 C CNN
F 3 "" V 2000 3210 50  0000 C CNN
F 4 "~" H 2000 3150 60  0000 C CNN "Notes"
F 5 "1-2W solar PV module" H 2000 3150 60  0001 C CNN "Description"
F 6 "~" H 2000 3150 60  0001 C CNN "Manufacturer"
F 7 "~" H 2000 3150 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 2000 3150 60  0001 C CNN "Supplier 1"
F 9 "~" H 2000 3150 60  0001 C CNN "Supplier 1 Part No"
F 10 "2.5" H 2000 3150 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2000 3150 60  0001 C CNN "Supplier 2"
F 12 "~" H 2000 3150 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2000 3150 60  0001 C CNN "Supplier 2 Cost"
	1    2000 3150
	1    0    0    -1  
$EndComp
$Comp
L DC-DC_GENERIC DCDC1
U 1 1 58B3136F
P 5050 4950
F 0 "DCDC1" H 4850 5150 50  0000 C CNN
F 1 "DC-DC" H 5250 4600 50  0000 C CNN
F 2 "REInnovationFootprint:TH_DCDC_Converter_USB" H 5050 4950 60  0001 C CNN
F 3 "" H 5050 4950 60  0000 C CNN
F 4 "~" H 5050 4950 60  0000 C CNN "Notes"
F 5 "~" H 5050 4950 60  0001 C CNN "Description"
F 6 "~" H 5050 4950 60  0001 C CNN "Manufacturer"
F 7 "~" H 5050 4950 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 5050 4950 60  0001 C CNN "Supplier 1"
F 9 "~" H 5050 4950 60  0001 C CNN "Supplier 1 Part No"
F 10 "1.5" H 5050 4950 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5050 4950 60  0001 C CNN "Supplier 2"
F 12 "~" H 5050 4950 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5050 4950 60  0001 C CNN "Supplier 2 Cost"
	1    5050 4950
	1    0    0    -1  
$EndComp
$Comp
L BQ24210-RESCUE-SolarCharger2017 U1
U 1 1 58B3146F
P 4550 3050
F 0 "U1" H 4750 2500 60  0000 C CNN
F 1 "BQ24210" H 4600 3500 60  0000 C CNN
F 2 "REInnovationFootprint:SM_WSON-10-2x3" H 4550 3050 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/bq24210.pdf" H 4550 3050 60  0001 C CNN
F 4 "~" H 4550 3050 60  0001 C CNN "Notes"
F 5 "LiIon Charger 800mA PV Input" H 4550 3050 60  0001 C CNN "Description"
F 6 "Texas Instruments" H 4550 3050 60  0001 C CNN "Manufacturer"
F 7 "BQ24210" H 4550 3050 60  0001 C CNN "Manufacturer Part No"
F 8 "RS" H 4550 3050 60  0001 C CNN "Supplier 1"
F 9 "742-2836" H 4550 3050 60  0001 C CNN "Supplier 1 Part No"
F 10 "2.88" H 4550 3050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4550 3050 60  0001 C CNN "Supplier 2"
F 12 "~" H 4550 3050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4550 3050 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 4550 3050 60  0001 C CNN "Cost"
	1    4550 3050
	1    0    0    -1  
$EndComp
$Comp
L LED-RESCUE-SolarCharger2017 D2
U 1 1 58B3183D
P 5600 3450
F 0 "D2" H 5600 3550 50  0000 C CNN
F 1 "CHG" H 5600 3350 50  0000 C CNN
F 2 "REInnovationFootprint:TH_LED-5MM_larg_pad" H 5600 3450 50  0001 C CNN
F 3 "" H 5600 3450 50  0000 C CNN
F 4 "~" H 5600 3450 60  0000 C CNN "Notes"
F 5 "~" H 5600 3450 60  0001 C CNN "Description"
F 6 "~" H 5600 3450 60  0001 C CNN "Manufacturer"
F 7 "~" H 5600 3450 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 5600 3450 60  0001 C CNN "Supplier 1"
F 9 "~" H 5600 3450 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.05" H 5600 3450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5600 3450 60  0001 C CNN "Supplier 2"
F 12 "~" H 5600 3450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5600 3450 60  0001 C CNN "Supplier 2 Cost"
	1    5600 3450
	0    -1   -1   0   
$EndComp
$Comp
L LED-RESCUE-SolarCharger2017 D3
U 1 1 58B31888
P 5900 3450
F 0 "D3" H 5900 3550 50  0000 C CNN
F 1 "PG" H 5900 3350 50  0000 C CNN
F 2 "REInnovationFootprint:TH_LED-5MM_larg_pad" H 5900 3450 50  0001 C CNN
F 3 "" H 5900 3450 50  0000 C CNN
F 4 "~" H 5900 3450 60  0000 C CNN "Notes"
F 5 "~" H 5900 3450 60  0001 C CNN "Description"
F 6 "~" H 5900 3450 60  0001 C CNN "Manufacturer"
F 7 "~" H 5900 3450 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 5900 3450 60  0001 C CNN "Supplier 1"
F 9 "~" H 5900 3450 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.05" H 5900 3450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5900 3450 60  0001 C CNN "Supplier 2"
F 12 "~" H 5900 3450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5900 3450 60  0001 C CNN "Supplier 2 Cost"
	1    5900 3450
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 58B318C0
P 5600 3050
F 0 "R3" V 5680 3050 50  0000 C CNN
F 1 "2.2k" V 5600 3050 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5530 3050 50  0001 C CNN
F 3 "" H 5600 3050 50  0000 C CNN
F 4 "~" H 5600 3050 60  0000 C CNN "Notes"
F 5 "~" H 5600 3050 60  0001 C CNN "Description"
F 6 "~" H 5600 3050 60  0001 C CNN "Manufacturer"
F 7 "~" H 5600 3050 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 5600 3050 60  0001 C CNN "Supplier 1"
F 9 "~" H 5600 3050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 5600 3050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5600 3050 60  0001 C CNN "Supplier 2"
F 12 "~" H 5600 3050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5600 3050 60  0001 C CNN "Supplier 2 Cost"
	1    5600 3050
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58B31907
P 5900 3050
F 0 "R4" V 5980 3050 50  0000 C CNN
F 1 "2.2k" V 5900 3050 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5830 3050 50  0001 C CNN
F 3 "" H 5900 3050 50  0000 C CNN
F 4 "~" H 5900 3050 60  0000 C CNN "Notes"
F 5 "~" H 5900 3050 60  0001 C CNN "Description"
F 6 "~" H 5900 3050 60  0001 C CNN "Manufacturer"
F 7 "~" H 5900 3050 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 5900 3050 60  0001 C CNN "Supplier 1"
F 9 "~" H 5900 3050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 5900 3050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5900 3050 60  0001 C CNN "Supplier 2"
F 12 "~" H 5900 3050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5900 3050 60  0001 C CNN "Supplier 2 Cost"
	1    5900 3050
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 58B319C0
P 2800 3150
F 0 "C1" H 2825 3250 50  0000 L CNN
F 1 "1uF" H 2825 3050 50  0000 L CNN
F 2 "matts_components:C1V7_lg_pad_lg_hole" H 2838 3000 50  0001 C CNN
F 3 "" H 2800 3150 50  0000 C CNN
F 4 "~" H 2800 3150 60  0000 C CNN "Notes"
F 5 "~" H 2800 3150 60  0001 C CNN "Description"
F 6 "~" H 2800 3150 60  0001 C CNN "Manufacturer"
F 7 "~" H 2800 3150 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2800 3150 60  0001 C CNN "Supplier 1"
F 9 "~" H 2800 3150 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.1" H 2800 3150 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2800 3150 60  0001 C CNN "Supplier 2"
F 12 "~" H 2800 3150 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2800 3150 60  0001 C CNN "Supplier 2 Cost"
	1    2800 3150
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 58B31A6D
P 6450 3250
F 0 "C2" H 6475 3350 50  0000 L CNN
F 1 "1uF" H 6475 3150 50  0000 L CNN
F 2 "matts_components:C1V7_lg_pad_lg_hole" H 6488 3100 50  0001 C CNN
F 3 "" H 6450 3250 50  0000 C CNN
F 4 "~" H 6450 3250 60  0000 C CNN "Notes"
F 5 "~" H 6450 3250 60  0001 C CNN "Description"
F 6 "~" H 6450 3250 60  0001 C CNN "Manufacturer"
F 7 "~" H 6450 3250 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 6450 3250 60  0001 C CNN "Supplier 1"
F 9 "~" H 6450 3250 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.10" H 6450 3250 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6450 3250 60  0001 C CNN "Supplier 2"
F 12 "~" H 6450 3250 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6450 3250 60  0001 C CNN "Supplier 2 Cost"
	1    6450 3250
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58B31BC6
P 3050 3850
F 0 "R1" V 3130 3850 50  0000 C CNN
F 1 "1k" V 3050 3850 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2980 3850 50  0001 C CNN
F 3 "" H 3050 3850 50  0000 C CNN
F 4 "~" H 3050 3850 60  0000 C CNN "Notes"
F 5 "~" H 3050 3850 60  0001 C CNN "Description"
F 6 "~" H 3050 3850 60  0001 C CNN "Manufacturer"
F 7 "~" H 3050 3850 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 3050 3850 60  0001 C CNN "Supplier 1"
F 9 "~" H 3050 3850 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 3050 3850 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3050 3850 60  0001 C CNN "Supplier 2"
F 12 "~" H 3050 3850 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3050 3850 60  0001 C CNN "Supplier 2 Cost"
	1    3050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2850 7050 2850
Wire Wire Line
	5600 2900 5600 2850
Connection ~ 5600 2850
Wire Wire Line
	5900 2900 5900 2850
Connection ~ 5900 2850
Wire Wire Line
	5600 3250 5600 3200
Wire Wire Line
	5900 3250 5900 3200
Wire Wire Line
	5450 3150 5450 3750
Wire Wire Line
	5450 3150 5050 3150
Wire Wire Line
	5050 3450 5400 3450
Wire Wire Line
	5400 3450 5400 3850
$Comp
L GND #PWR01
U 1 1 58B32042
P 3200 3200
F 0 "#PWR01" H 3200 2950 50  0001 C CNN
F 1 "GND" H 3200 3050 50  0000 C CNN
F 2 "" H 3200 3200 50  0000 C CNN
F 3 "" H 3200 3200 50  0000 C CNN
	1    3200 3200
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 58B32070
P 6300 2850
F 0 "#FLG02" H 6300 2945 50  0001 C CNN
F 1 "PWR_FLAG" H 6300 3030 50  0000 C CNN
F 2 "" H 6300 2850 50  0000 C CNN
F 3 "" H 6300 2850 50  0000 C CNN
	1    6300 2850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 58B3209E
P 6650 2850
F 0 "#PWR03" H 6650 2700 50  0001 C CNN
F 1 "VCC" H 6650 3000 50  0000 C CNN
F 2 "" H 6650 2850 50  0000 C CNN
F 3 "" H 6650 2850 50  0000 C CNN
	1    6650 2850
	1    0    0    -1  
$EndComp
Connection ~ 6300 2850
$Comp
L GND #PWR04
U 1 1 58B32372
P 3050 4150
F 0 "#PWR04" H 3050 3900 50  0001 C CNN
F 1 "GND" H 3050 4000 50  0000 C CNN
F 2 "" H 3050 4150 50  0000 C CNN
F 3 "" H 3050 4150 50  0000 C CNN
	1    3050 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 58B323A4
P 4600 3850
F 0 "#PWR05" H 4600 3600 50  0001 C CNN
F 1 "GND" H 4600 3700 50  0000 C CNN
F 2 "" H 4600 3850 50  0000 C CNN
F 3 "" H 4600 3850 50  0000 C CNN
	1    4600 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58B32581
P 2800 3400
F 0 "#PWR06" H 2800 3150 50  0001 C CNN
F 1 "GND" H 2800 3250 50  0000 C CNN
F 2 "" H 2800 3400 50  0000 C CNN
F 3 "" H 2800 3400 50  0000 C CNN
	1    2800 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 58B325B3
P 2000 3450
F 0 "#PWR07" H 2000 3200 50  0001 C CNN
F 1 "GND" H 2000 3300 50  0000 C CNN
F 2 "" H 2000 3450 50  0000 C CNN
F 3 "" H 2000 3450 50  0000 C CNN
	1    2000 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 58B325E5
P 6450 3500
F 0 "#PWR08" H 6450 3250 50  0001 C CNN
F 1 "GND" H 6450 3350 50  0000 C CNN
F 2 "" H 6450 3500 50  0000 C CNN
F 3 "" H 6450 3500 50  0000 C CNN
	1    6450 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 58B32617
P 7050 3500
F 0 "#PWR09" H 7050 3250 50  0001 C CNN
F 1 "GND" H 7050 3350 50  0000 C CNN
F 2 "" H 7050 3500 50  0000 C CNN
F 3 "" H 7050 3500 50  0000 C CNN
	1    7050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2850 2000 2850
Wire Wire Line
	2000 2850 2000 2950
Wire Wire Line
	3200 3150 4150 3150
Wire Wire Line
	3200 3150 3200 3200
Wire Wire Line
	3050 3700 3050 3000
Wire Wire Line
	3050 3000 4150 3000
Wire Wire Line
	3050 4150 3050 4000
Wire Wire Line
	2800 3400 2800 3300
Wire Wire Line
	2800 3000 2800 2850
Connection ~ 2800 2850
Wire Wire Line
	2000 3450 2000 3350
Wire Wire Line
	4600 3850 4600 3750
Wire Wire Line
	7050 2850 7050 3100
Connection ~ 6650 2850
Wire Wire Line
	6450 3100 6450 2850
Connection ~ 6450 2850
Wire Wire Line
	6450 3400 6450 3500
Wire Wire Line
	7050 3400 7050 3500
$Comp
L CONN_01X02 P2
U 1 1 58B33011
P 9050 3050
F 0 "P2" H 9050 3200 50  0000 C CNN
F 1 "LiIon Cell V" V 9150 3050 50  0000 C CNN
F 2 "REInnovationFootprint:SIL_2_screw_+_JST_2mm" H 9050 3050 50  0001 C CNN
F 3 "" H 9050 3050 50  0000 C CNN
	1    9050 3050
	1    0    0    -1  
$EndComp
Text Notes 1750 2700 0    60   ~ 0
Solar PV Input
Text Notes 7250 3050 0    60   ~ 0
LiIon Cell 18650
Text Notes 4650 4600 0    60   ~ 0
DC-DC Output
$Comp
L SPST SW1
U 1 1 58B33CC6
P 3450 5150
F 0 "SW1" H 3450 5250 50  0000 C CNN
F 1 "5V ON" H 3450 5050 50  0000 C CNN
F 2 "REInnovationFootprint:SW_SPDT_R_Angle_ALIEX" H 3450 5150 50  0001 C CNN
F 3 "" H 3450 5150 50  0000 C CNN
F 4 "~" H 3450 5150 60  0000 C CNN "Notes"
F 5 "~" H 3450 5150 60  0001 C CNN "Description"
F 6 "~" H 3450 5150 60  0001 C CNN "Manufacturer"
F 7 "~" H 3450 5150 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 3450 5150 60  0001 C CNN "Supplier 1"
F 9 "~" H 3450 5150 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.2" H 3450 5150 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3450 5150 60  0001 C CNN "Supplier 2"
F 12 "~" H 3450 5150 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3450 5150 60  0001 C CNN "Supplier 2 Cost"
	1    3450 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 58B33E16
P 3900 4750
F 0 "#PWR010" H 3900 4500 50  0001 C CNN
F 1 "GND" H 3900 4600 50  0000 C CNN
F 2 "" H 3900 4750 50  0000 C CNN
F 3 "" H 3900 4750 50  0000 C CNN
	1    3900 4750
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR011
U 1 1 58B33E51
P 2750 5100
F 0 "#PWR011" H 2750 4950 50  0001 C CNN
F 1 "VCC" H 2750 5250 50  0000 C CNN
F 2 "" H 2750 5100 50  0000 C CNN
F 3 "" H 2750 5100 50  0000 C CNN
	1    2750 5100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 58B33E8C
P 8650 2900
F 0 "#PWR012" H 8650 2750 50  0001 C CNN
F 1 "VCC" H 8650 3050 50  0000 C CNN
F 2 "" H 8650 2900 50  0000 C CNN
F 3 "" H 8650 2900 50  0000 C CNN
	1    8650 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 58B33EC7
P 8650 3200
F 0 "#PWR013" H 8650 2950 50  0001 C CNN
F 1 "GND" H 8650 3050 50  0000 C CNN
F 2 "" H 8650 3200 50  0000 C CNN
F 3 "" H 8650 3200 50  0000 C CNN
	1    8650 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4650 3900 4750
Wire Wire Line
	2950 5150 2750 5150
Wire Wire Line
	2750 5150 2750 5100
Wire Wire Line
	8850 3100 8650 3100
Wire Wire Line
	8650 3100 8650 3200
Wire Wire Line
	8850 3000 8650 3000
Wire Wire Line
	8650 3000 8650 2900
Wire Wire Line
	5450 3750 5600 3750
Wire Wire Line
	5600 3750 5600 3650
Wire Wire Line
	5400 3850 5900 3850
Wire Wire Line
	5900 3850 5900 3650
$Comp
L R R2
U 1 1 58B6EAFF
P 4000 3650
F 0 "R2" V 4080 3650 50  0000 C CNN
F 1 "100k" V 4000 3650 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 3930 3650 50  0001 C CNN
F 3 "" H 4000 3650 50  0000 C CNN
F 4 "~" H 4000 3650 60  0000 C CNN "Notes"
F 5 "~" H 4000 3650 60  0001 C CNN "Description"
F 6 "~" H 4000 3650 60  0001 C CNN "Manufacturer"
F 7 "~" H 4000 3650 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4000 3650 60  0001 C CNN "Supplier 1"
F 9 "~" H 4000 3650 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 4000 3650 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4000 3650 60  0001 C CNN "Supplier 2"
F 12 "~" H 4000 3650 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4000 3650 60  0001 C CNN "Supplier 2 Cost"
	1    4000 3650
	1    0    0    -1  
$EndComp
Text Notes 3850 2350 0    60   ~ 0
Ts pulled high for solar charing applications\nLimited current mode to ensure battery temperature OK\nPull high with 100k \n\nVDPM\nKept open for load tracking, such as solar PV \nVDPM to ground using\nRVDPM= (VBUS_DPM–VBUS_DPM_1)/KVBUS_DPM= (4.6 V - 3.5 V) / ( 0.15V/kΩ) = 7.333kΩ → 7.32kΩ closest 1% resistor\n\nIset\n2W of solar PV gives 400mA maximum\nRiset = Kiset/Iout Iout = 400mA. Kiset = 395Aohm. Riset = 987.5. Close to 1k\n\nEN tied to PG as load mode never used
Wire Wire Line
	4150 3450 4000 3450
Wire Wire Line
	4000 3450 4000 3500
Wire Wire Line
	4000 3800 4000 3900
Wire Wire Line
	4000 3900 3900 3900
Wire Wire Line
	3900 3900 3900 3300
Wire Wire Line
	3900 3300 4150 3300
NoConn ~ 5050 3000
Wire Wire Line
	5050 3300 5200 3300
Wire Wire Line
	5200 3300 5200 3450
Connection ~ 5200 3450
$Comp
L CONN_01X01 LG1
U 1 1 58B70530
P 7350 5100
F 0 "LG1" H 7350 5200 50  0000 C CNN
F 1 "LOGO1" V 7450 5100 50  0000 C CNN
F 2 "CuriousElectric3:CEC_Globe_10mm_FCU" H 7350 5100 50  0001 C CNN
F 3 "" H 7350 5100 50  0000 C CNN
	1    7350 5100
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 LG2
U 1 1 58B705E9
P 7350 5400
F 0 "LG2" H 7350 5500 50  0000 C CNN
F 1 "LOGO2" V 7450 5400 50  0000 C CNN
F 2 "CuriousElectric3:TCEC_Words_13mm" H 7350 5400 50  0001 C CNN
F 3 "" H 7350 5400 50  0000 C CNN
	1    7350 5400
	1    0    0    -1  
$EndComp
NoConn ~ 7150 5100
NoConn ~ 7150 5400
$Comp
L CONN_01X02 P1
U 1 1 58C13EEE
P 6050 5050
F 0 "P1" H 6050 5200 50  0000 C CNN
F 1 "5V OUT" V 6150 5050 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-2_screw_terminal" H 6050 5050 50  0001 C CNN
F 3 "" H 6050 5050 50  0000 C CNN
	1    6050 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4900 5450 5000
Wire Wire Line
	5450 5000 5850 5000
Wire Wire Line
	5450 5150 5450 5100
Wire Wire Line
	5450 5100 5850 5100
$Comp
L CONN_01X02 P3
U 1 1 58C1454D
P 2800 2150
F 0 "P3" H 2800 2300 50  0000 C CNN
F 1 "PV IN 1" V 2900 2150 50  0000 C CNN
F 2 "REInnovationFootprint:SIL_2_screw_+_JST_2mm" H 2800 2150 50  0001 C CNN
F 3 "" H 2800 2150 50  0000 C CNN
	1    2800 2150
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 58C14612
P 3400 2150
F 0 "P4" H 3400 2300 50  0000 C CNN
F 1 "PV IN 2" V 3500 2150 50  0000 C CNN
F 2 "REInnovationFootprint:SIL_2_screw_+_JST_2mm" H 3400 2150 50  0001 C CNN
F 3 "" H 3400 2150 50  0000 C CNN
	1    3400 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2100 3000 2100
Wire Wire Line
	3000 2100 3000 2850
Connection ~ 3000 2850
Wire Wire Line
	2600 2100 2450 2100
Wire Wire Line
	2450 2100 2450 2850
Connection ~ 2450 2850
$Comp
L GND #PWR014
U 1 1 58C14780
P 2550 2450
F 0 "#PWR014" H 2550 2200 50  0001 C CNN
F 1 "GND" H 2550 2300 50  0000 C CNN
F 2 "" H 2550 2450 50  0000 C CNN
F 3 "" H 2550 2450 50  0000 C CNN
	1    2550 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 58C147CB
P 3100 2450
F 0 "#PWR015" H 3100 2200 50  0001 C CNN
F 1 "GND" H 3100 2300 50  0000 C CNN
F 2 "" H 3100 2450 50  0000 C CNN
F 3 "" H 3100 2450 50  0000 C CNN
	1    3100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2200 3100 2200
Wire Wire Line
	3100 2200 3100 2450
Wire Wire Line
	2600 2200 2550 2200
Wire Wire Line
	2550 2200 2550 2450
$Comp
L CONN_01X01 PCB1
U 1 1 58C14FC1
P 7350 5800
F 0 "PCB1" H 7350 5900 50  0000 C CNN
F 1 "PCB" V 7450 5800 50  0000 C CNN
F 2 "REInnovationFootprint:PCB_65x90mm" H 7350 5800 50  0001 C CNN
F 3 "" H 7350 5800 50  0000 C CNN
	1    7350 5800
	1    0    0    -1  
$EndComp
NoConn ~ 7150 5800
$Comp
L DC-DC_GENERIC DCDC2
U 1 1 593E8BD7
P 5050 5850
F 0 "DCDC2" H 4850 6050 50  0000 C CNN
F 1 "DC-DC" H 5250 5500 50  0000 C CNN
F 2 "REInnovationFootprint:TH_DCDC_Converter_NoUSB" H 5050 5850 60  0001 C CNN
F 3 "" H 5050 5850 60  0000 C CNN
F 4 "~" H 5050 5850 60  0000 C CNN "Notes"
F 5 "~" H 5050 5850 60  0001 C CNN "Description"
F 6 "~" H 5050 5850 60  0001 C CNN "Manufacturer"
F 7 "~" H 5050 5850 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 5050 5850 60  0001 C CNN "Supplier 1"
F 9 "~" H 5050 5850 60  0001 C CNN "Supplier 1 Part No"
F 10 "1" H 5050 5850 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5050 5850 60  0001 C CNN "Supplier 2"
F 12 "~" H 5050 5850 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5050 5850 60  0001 C CNN "Supplier 2 Cost"
	1    5050 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5800 5750 5800
Wire Wire Line
	5750 5800 5750 5000
Connection ~ 5750 5000
Wire Wire Line
	5450 6050 5800 6050
Wire Wire Line
	5800 6050 5800 5100
Connection ~ 5800 5100
$Comp
L CONN_01X02 P5
U 1 1 593EA2E6
P 9050 3600
F 0 "P5" H 9050 3750 50  0000 C CNN
F 1 "LiIon Cell V" V 9150 3600 50  0000 C CNN
F 2 "REInnovationFootprint:SIL_2_screw_+_JST_2mm" H 9050 3600 50  0001 C CNN
F 3 "" H 9050 3600 50  0000 C CNN
	1    9050 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3550 8800 3550
Wire Wire Line
	8800 3550 8800 3000
Connection ~ 8800 3000
Wire Wire Line
	8850 3650 8750 3650
Wire Wire Line
	8750 3650 8750 3100
Connection ~ 8750 3100
Wire Wire Line
	4450 4900 4200 4900
Wire Wire Line
	4200 4650 4200 5800
Wire Wire Line
	4200 4650 3900 4650
Wire Wire Line
	3950 5150 4450 5150
Wire Wire Line
	4450 6050 4300 6050
Wire Wire Line
	4300 6050 4300 5150
Connection ~ 4300 5150
Wire Wire Line
	4200 5800 4450 5800
Connection ~ 4200 4900
$Comp
L USB_A P7
U 1 1 5A036CD8
P 6100 6600
F 0 "P7" H 6300 6400 50  0000 C CNN
F 1 "USB_A" H 6050 6800 50  0000 C CNN
F 2 "Connectors:USB_A" V 6050 6500 50  0001 C CNN
F 3 "" V 6050 6500 50  0000 C CNN
	1    6100 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 6400 5650 6400
Wire Wire Line
	5650 6400 5650 5800
Connection ~ 5650 5800
Wire Wire Line
	5550 6050 5550 6700
Wire Wire Line
	5550 6700 5800 6700
Connection ~ 5550 6050
NoConn ~ 5800 6500
NoConn ~ 5800 6600
Wire Wire Line
	6200 6900 6200 7000
Wire Wire Line
	6200 7000 5650 7000
Wire Wire Line
	5650 7000 5650 6700
Connection ~ 5650 6700
$EndSCHEMATC
