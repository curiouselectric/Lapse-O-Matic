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
L device:Battery_Cell BT1
U 1 1 58B31232
P 5150 -1800
F 0 "BT1" H 5250 -1700 50  0000 L CNN
F 1 "18650 LiIon Cell" V 5450 -2050 50  0000 L CNN
F 2 "REInnovationFootprint:TH_LiIon_Holder" V 5150 -1740 50  0001 C CNN
F 3 "" V 5150 -1740 50  0000 C CNN
F 4 "~" H 5150 -1800 60  0000 C CNN "Notes"
F 5 "18650 PCB mount holder" H 5150 -1800 60  0001 C CNN "Description"
F 6 "~" H 5150 -1800 60  0001 C CNN "Manufacturer"
F 7 "~" H 5150 -1800 60  0001 C CNN "Manufacturer Part No"
F 8 "eBay" H 5150 -1800 60  0001 C CNN "Supplier 1"
F 9 "http://www.ebay.co.uk/itm/122466718109" H 5150 -1800 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.50" H 5150 -1800 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5150 -1800 60  0001 C CNN "Supplier 2"
F 12 "~" H 5150 -1800 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5150 -1800 60  0001 C CNN "Supplier 2 Cost"
	1    5150 -1800
	1    0    0    -1  
$EndComp
$Comp
L device:Solar_Cells SC1
U 1 1 58B31275
P 600 -1950
F 0 "SC1" H 700 -1850 50  0000 L CNN
F 1 "PV_IN" V 350 -2050 50  0000 L CNN
F 2 "REInnovationFootprint:SIL_2_screw_+_JST_2mm" V 600 -1890 50  0001 C CNN
F 3 "" V 600 -1890 50  0000 C CNN
F 4 "~" H 600 -1950 60  0000 C CNN "Notes"
F 5 "1-2W solar PV module" H 600 -1950 60  0001 C CNN "Description"
F 6 "~" H 600 -1950 60  0001 C CNN "Manufacturer"
F 7 "~" H 600 -1950 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 600 -1950 60  0001 C CNN "Supplier 1"
F 9 "~" H 600 -1950 60  0001 C CNN "Supplier 1 Part No"
F 10 "2.5" H 600 -1950 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 600 -1950 60  0001 C CNN "Supplier 2"
F 12 "~" H 600 -1950 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 600 -1950 60  0001 C CNN "Supplier 2 Cost"
	1    600  -1950
	1    0    0    -1  
$EndComp
$Comp
L SolarCharger2017-rescue:BQ24210-RESCUE-SolarCharger2017 U2
U 1 1 58B3146F
P 2650 -2050
F 0 "U2" H 2850 -2600 60  0000 C CNN
F 1 "BQ24210" H 2700 -1600 60  0000 C CNN
F 2 "REInnovationFootprint:SM_WSON-10-2x3" H 2650 -2050 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/bq24210.pdf" H 2650 -2050 60  0001 C CNN
F 4 "~" H 2650 -2050 60  0001 C CNN "Notes"
F 5 "LiIon Charger 800mA PV Input" H 2650 -2050 60  0001 C CNN "Description"
F 6 "Texas Instruments" H 2650 -2050 60  0001 C CNN "Manufacturer"
F 7 "BQ24210" H 2650 -2050 60  0001 C CNN "Manufacturer Part No"
F 8 "RS" H 2650 -2050 60  0001 C CNN "Supplier 1"
F 9 "742-2836" H 2650 -2050 60  0001 C CNN "Supplier 1 Part No"
F 10 "2.88" H 2650 -2050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2650 -2050 60  0001 C CNN "Supplier 2"
F 12 "~" H 2650 -2050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2650 -2050 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 2650 -2050 60  0001 C CNN "Cost"
	1    2650 -2050
	1    0    0    -1  
$EndComp
$Comp
L SolarCharger2017-rescue:LED-RESCUE-SolarCharger2017 D2
U 1 1 58B3183D
P 3700 -1650
F 0 "D2" H 3700 -1550 50  0000 C CNN
F 1 "CHG" H 3700 -1750 50  0000 C CNN
F 2 "REInnovationFootprint:TH_LED-5MM_larg_pad" H 3700 -1650 50  0001 C CNN
F 3 "" H 3700 -1650 50  0000 C CNN
F 4 "~" H 3700 -1650 60  0000 C CNN "Notes"
F 5 "~" H 3700 -1650 60  0001 C CNN "Description"
F 6 "~" H 3700 -1650 60  0001 C CNN "Manufacturer"
F 7 "~" H 3700 -1650 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 3700 -1650 60  0001 C CNN "Supplier 1"
F 9 "~" H 3700 -1650 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.05" H 3700 -1650 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3700 -1650 60  0001 C CNN "Supplier 2"
F 12 "~" H 3700 -1650 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3700 -1650 60  0001 C CNN "Supplier 2 Cost"
	1    3700 -1650
	0    -1   -1   0   
$EndComp
$Comp
L SolarCharger2017-rescue:LED-RESCUE-SolarCharger2017 D3
U 1 1 58B31888
P 4000 -1650
F 0 "D3" H 4000 -1550 50  0000 C CNN
F 1 "PG" H 4000 -1750 50  0000 C CNN
F 2 "REInnovationFootprint:TH_LED-5MM_larg_pad" H 4000 -1650 50  0001 C CNN
F 3 "" H 4000 -1650 50  0000 C CNN
F 4 "~" H 4000 -1650 60  0000 C CNN "Notes"
F 5 "~" H 4000 -1650 60  0001 C CNN "Description"
F 6 "~" H 4000 -1650 60  0001 C CNN "Manufacturer"
F 7 "~" H 4000 -1650 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4000 -1650 60  0001 C CNN "Supplier 1"
F 9 "~" H 4000 -1650 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.05" H 4000 -1650 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4000 -1650 60  0001 C CNN "Supplier 2"
F 12 "~" H 4000 -1650 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4000 -1650 60  0001 C CNN "Supplier 2 Cost"
	1    4000 -1650
	0    -1   -1   0   
$EndComp
$Comp
L device:R R5
U 1 1 58B318C0
P 3700 -2050
F 0 "R5" V 3780 -2050 50  0000 C CNN
F 1 "2.2k" V 3700 -2050 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 3630 -2050 50  0001 C CNN
F 3 "" H 3700 -2050 50  0000 C CNN
F 4 "~" H 3700 -2050 60  0000 C CNN "Notes"
F 5 "~" H 3700 -2050 60  0001 C CNN "Description"
F 6 "~" H 3700 -2050 60  0001 C CNN "Manufacturer"
F 7 "~" H 3700 -2050 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 3700 -2050 60  0001 C CNN "Supplier 1"
F 9 "~" H 3700 -2050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 3700 -2050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3700 -2050 60  0001 C CNN "Supplier 2"
F 12 "~" H 3700 -2050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3700 -2050 60  0001 C CNN "Supplier 2 Cost"
	1    3700 -2050
	1    0    0    -1  
$EndComp
$Comp
L device:R R7
U 1 1 58B31907
P 4000 -2050
F 0 "R7" V 4080 -2050 50  0000 C CNN
F 1 "2.2k" V 4000 -2050 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 3930 -2050 50  0001 C CNN
F 3 "" H 4000 -2050 50  0000 C CNN
F 4 "~" H 4000 -2050 60  0000 C CNN "Notes"
F 5 "~" H 4000 -2050 60  0001 C CNN "Description"
F 6 "~" H 4000 -2050 60  0001 C CNN "Manufacturer"
F 7 "~" H 4000 -2050 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4000 -2050 60  0001 C CNN "Supplier 1"
F 9 "~" H 4000 -2050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 4000 -2050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4000 -2050 60  0001 C CNN "Supplier 2"
F 12 "~" H 4000 -2050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4000 -2050 60  0001 C CNN "Supplier 2 Cost"
	1    4000 -2050
	1    0    0    -1  
$EndComp
$Comp
L device:CP C2
U 1 1 58B319C0
P 1400 -1950
F 0 "C2" H 1425 -1850 50  0000 L CNN
F 1 "1uF" H 1425 -2050 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 1438 -2100 50  0001 C CNN
F 3 "" H 1400 -1950 50  0000 C CNN
F 4 "~" H 1400 -1950 60  0000 C CNN "Notes"
F 5 "~" H 1400 -1950 60  0001 C CNN "Description"
F 6 "~" H 1400 -1950 60  0001 C CNN "Manufacturer"
F 7 "~" H 1400 -1950 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1400 -1950 60  0001 C CNN "Supplier 1"
F 9 "~" H 1400 -1950 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.1" H 1400 -1950 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1400 -1950 60  0001 C CNN "Supplier 2"
F 12 "~" H 1400 -1950 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1400 -1950 60  0001 C CNN "Supplier 2 Cost"
	1    1400 -1950
	1    0    0    -1  
$EndComp
$Comp
L device:CP C4
U 1 1 58B31A6D
P 4550 -1850
F 0 "C4" H 4575 -1750 50  0000 L CNN
F 1 "1uF" H 4575 -1950 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 4588 -2000 50  0001 C CNN
F 3 "" H 4550 -1850 50  0000 C CNN
F 4 "~" H 4550 -1850 60  0000 C CNN "Notes"
F 5 "~" H 4550 -1850 60  0001 C CNN "Description"
F 6 "~" H 4550 -1850 60  0001 C CNN "Manufacturer"
F 7 "~" H 4550 -1850 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4550 -1850 60  0001 C CNN "Supplier 1"
F 9 "~" H 4550 -1850 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.10" H 4550 -1850 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4550 -1850 60  0001 C CNN "Supplier 2"
F 12 "~" H 4550 -1850 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4550 -1850 60  0001 C CNN "Supplier 2 Cost"
	1    4550 -1850
	1    0    0    -1  
$EndComp
$Comp
L device:R R3
U 1 1 58B31BC6
P 1650 -1250
F 0 "R3" V 1730 -1250 50  0000 C CNN
F 1 "1k" V 1650 -1250 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1580 -1250 50  0001 C CNN
F 3 "" H 1650 -1250 50  0000 C CNN
F 4 "~" H 1650 -1250 60  0000 C CNN "Notes"
F 5 "~" H 1650 -1250 60  0001 C CNN "Description"
F 6 "~" H 1650 -1250 60  0001 C CNN "Manufacturer"
F 7 "~" H 1650 -1250 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1650 -1250 60  0001 C CNN "Supplier 1"
F 9 "~" H 1650 -1250 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1650 -1250 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1650 -1250 60  0001 C CNN "Supplier 2"
F 12 "~" H 1650 -1250 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1650 -1250 60  0001 C CNN "Supplier 2 Cost"
	1    1650 -1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 -2250 3700 -2250
Wire Wire Line
	3700 -2200 3700 -2250
Connection ~ 3700 -2250
Wire Wire Line
	4000 -2200 4000 -2250
Connection ~ 4000 -2250
Wire Wire Line
	3700 -1850 3700 -1900
Wire Wire Line
	4000 -1850 4000 -1900
Wire Wire Line
	3550 -1950 3550 -1350
Wire Wire Line
	3550 -1950 3150 -1950
Wire Wire Line
	3150 -1650 3300 -1650
Wire Wire Line
	3500 -1650 3500 -1250
$Comp
L power1:GND #PWR09
U 1 1 58B32042
P 1800 -1900
F 0 "#PWR09" H 1800 -2150 50  0001 C CNN
F 1 "GND" H 1800 -2050 50  0000 C CNN
F 2 "" H 1800 -1900 50  0000 C CNN
F 3 "" H 1800 -1900 50  0000 C CNN
	1    1800 -1900
	1    0    0    -1  
$EndComp
$Comp
L power1:PWR_FLAG #FLG01
U 1 1 58B32070
P 4400 -2250
F 0 "#FLG01" H 4400 -2155 50  0001 C CNN
F 1 "PWR_FLAG" H 4400 -2070 50  0000 C CNN
F 2 "" H 4400 -2250 50  0000 C CNN
F 3 "" H 4400 -2250 50  0000 C CNN
	1    4400 -2250
	1    0    0    -1  
$EndComp
$Comp
L power1:VCC #PWR019
U 1 1 58B3209E
P 4750 -2250
F 0 "#PWR019" H 4750 -2400 50  0001 C CNN
F 1 "VCC" H 4750 -2100 50  0000 C CNN
F 2 "" H 4750 -2250 50  0000 C CNN
F 3 "" H 4750 -2250 50  0000 C CNN
	1    4750 -2250
	1    0    0    -1  
$EndComp
Connection ~ 4400 -2250
$Comp
L power1:GND #PWR08
U 1 1 58B32372
P 1650 -950
F 0 "#PWR08" H 1650 -1200 50  0001 C CNN
F 1 "GND" H 1650 -1100 50  0000 C CNN
F 2 "" H 1650 -950 50  0000 C CNN
F 3 "" H 1650 -950 50  0000 C CNN
	1    1650 -950
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR011
U 1 1 58B323A4
P 2700 -1250
F 0 "#PWR011" H 2700 -1500 50  0001 C CNN
F 1 "GND" H 2700 -1400 50  0000 C CNN
F 2 "" H 2700 -1250 50  0000 C CNN
F 3 "" H 2700 -1250 50  0000 C CNN
	1    2700 -1250
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR06
U 1 1 58B32581
P 1400 -1700
F 0 "#PWR06" H 1400 -1950 50  0001 C CNN
F 1 "GND" H 1400 -1850 50  0000 C CNN
F 2 "" H 1400 -1700 50  0000 C CNN
F 3 "" H 1400 -1700 50  0000 C CNN
	1    1400 -1700
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR04
U 1 1 58B325B3
P 600 -1650
F 0 "#PWR04" H 600 -1900 50  0001 C CNN
F 1 "GND" H 600 -1800 50  0000 C CNN
F 2 "" H 600 -1650 50  0000 C CNN
F 3 "" H 600 -1650 50  0000 C CNN
	1    600  -1650
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR017
U 1 1 58B325E5
P 4550 -1600
F 0 "#PWR017" H 4550 -1850 50  0001 C CNN
F 1 "GND" H 4550 -1750 50  0000 C CNN
F 2 "" H 4550 -1600 50  0000 C CNN
F 3 "" H 4550 -1600 50  0000 C CNN
	1    4550 -1600
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR020
U 1 1 58B32617
P 5150 -1600
F 0 "#PWR020" H 5150 -1850 50  0001 C CNN
F 1 "GND" H 5150 -1750 50  0000 C CNN
F 2 "" H 5150 -1600 50  0000 C CNN
F 3 "" H 5150 -1600 50  0000 C CNN
	1    5150 -1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  -2250 600  -2150
Wire Wire Line
	1800 -1950 2250 -1950
Wire Wire Line
	1800 -1950 1800 -1900
Wire Wire Line
	1650 -1400 1650 -2100
Wire Wire Line
	1650 -2100 2250 -2100
Wire Wire Line
	1650 -950 1650 -1100
Wire Wire Line
	1400 -1700 1400 -1800
Wire Wire Line
	1400 -2100 1400 -2250
Connection ~ 1400 -2250
Wire Wire Line
	600  -1650 600  -1750
Wire Wire Line
	2700 -1250 2700 -1350
Wire Wire Line
	5150 -2250 5150 -2000
Connection ~ 4750 -2250
Wire Wire Line
	4550 -2000 4550 -2250
Connection ~ 4550 -2250
Wire Wire Line
	4550 -1700 4550 -1600
Wire Wire Line
	5150 -1700 5150 -1600
Text Notes 450  -2350 0    60   ~ 0
Solar PV Input\n<800mA\n<20V DC
Text Notes 4750 -2550 0    60   ~ 0
LiIon Cell 18650
Wire Wire Line
	3550 -1350 3700 -1350
Wire Wire Line
	3700 -1350 3700 -1450
Wire Wire Line
	3500 -1250 4000 -1250
Wire Wire Line
	4000 -1250 4000 -1450
$Comp
L device:R R4
U 1 1 58B6EAFF
P 2100 -1450
F 0 "R4" V 2180 -1450 50  0000 C CNN
F 1 "100k" V 2100 -1450 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2030 -1450 50  0001 C CNN
F 3 "" H 2100 -1450 50  0000 C CNN
F 4 "~" H 2100 -1450 60  0000 C CNN "Notes"
F 5 "~" H 2100 -1450 60  0001 C CNN "Description"
F 6 "~" H 2100 -1450 60  0001 C CNN "Manufacturer"
F 7 "~" H 2100 -1450 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2100 -1450 60  0001 C CNN "Supplier 1"
F 9 "~" H 2100 -1450 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 2100 -1450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2100 -1450 60  0001 C CNN "Supplier 2"
F 12 "~" H 2100 -1450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2100 -1450 60  0001 C CNN "Supplier 2 Cost"
	1    2100 -1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 -1650 2100 -1650
Wire Wire Line
	2100 -1650 2100 -1600
Wire Wire Line
	2100 -1300 2100 -1200
Wire Wire Line
	2100 -1200 2000 -1200
Wire Wire Line
	2000 -1200 2000 -1800
Wire Wire Line
	2000 -1800 2250 -1800
NoConn ~ 3150 -2100
Wire Wire Line
	3150 -1800 3300 -1800
Wire Wire Line
	3300 -1800 3300 -1650
Connection ~ 3300 -1650
Wire Wire Line
	3700 -2250 4000 -2250
Wire Wire Line
	4000 -2250 4400 -2250
Wire Wire Line
	4400 -2250 4550 -2250
Wire Wire Line
	4750 -2250 5150 -2250
Wire Wire Line
	4550 -2250 4750 -2250
Wire Wire Line
	3300 -1650 3500 -1650
Wire Wire Line
	1400 -2250 2250 -2250
Wire Wire Line
	600  -2250 1400 -2250
Text Notes 5900 -1000 0    60   ~ 0
Ts pulled high for solar charing applications\nLimited current mode to ensure battery temperature OK\nPull high with 100k \n\nVDPM\nKept open for load tracking, such as solar PV \nVDPM to ground using\nRVDPM= (VBUS_DPM–VBUS_DPM_1)/KVBUS_DPM\n= (4.6 V - 3.5 V) / ( 0.15V/kΩ) \n= 7.333kΩ → 7.32kΩ closest 1% resistor\n\nIset\n2W of solar PV gives 400mA maximum\nRiset = Kiset/Iout Iout = 400mA. \nKiset = 395Aohm. Riset = 987.5. Close to 1k\n\nEN tied to PG as load mode never used
$Comp
L WildlifeCamera_PCB-rescue:R-Device R10
U 1 1 5F433F45
P 5750 3500
F 0 "R10" H 5820 3547 50  0000 L CNN
F 1 "10k" H 5820 3454 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5680 3500 50  0001 C CNN
F 3 "~" H 5750 3500 50  0001 C CNN
	1    5750 3500
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R1
U 1 1 5F4345CF
P 1800 6300
F 0 "R1" V 1590 6300 50  0000 C CNN
F 1 "1k" V 1683 6300 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1730 6300 50  0001 C CNN
F 3 "~" H 1800 6300 50  0001 C CNN
	1    1800 6300
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x03-Connector_Generic J1
U 1 1 5F434B25
P 1100 6300
F 0 "J1" V 1017 5970 50  0000 C CNN
F 1 "PIR" H 1017 6063 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_PIR_SENSOR" H 1100 6300 50  0001 C CNN
F 3 "~" H 1100 6300 50  0001 C CNN
	1    1100 6300
	-1   0    0    1   
$EndComp
$Comp
L power1:GND #PWR03
U 1 1 5F43612D
P 1550 6650
F 0 "#PWR03" H 1550 6400 50  0001 C CNN
F 1 "GND" H 1550 6500 50  0000 C CNN
F 2 "" H 1550 6650 50  0000 C CNN
F 3 "" H 1550 6650 50  0000 C CNN
	1    1550 6650
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR022
U 1 1 5F4386F1
P 9000 2800
F 0 "#PWR022" H 9000 2550 50  0001 C CNN
F 1 "GND" H 9000 2650 50  0000 C CNN
F 2 "" H 9000 2800 50  0000 C CNN
F 3 "" H 9000 2800 50  0000 C CNN
	1    9000 2800
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR02
U 1 1 5F4389FE
P 1550 5900
F 0 "#PWR02" H 1550 5750 50  0001 C CNN
F 1 "+3.3V" H 1565 6076 50  0000 C CNN
F 2 "" H 1550 5900 50  0001 C CNN
F 3 "" H 1550 5900 50  0001 C CNN
	1    1550 5900
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR07
U 1 1 5F439209
P 2750 6650
F 0 "#PWR07" H 2750 6400 50  0001 C CNN
F 1 "GND" H 2750 6500 50  0000 C CNN
F 2 "" H 2750 6650 50  0000 C CNN
F 3 "" H 2750 6650 50  0000 C CNN
	1    2750 6650
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR018
U 1 1 5F43E1BA
P 5550 2200
F 0 "#PWR018" H 5550 1950 50  0001 C CNN
F 1 "GND" H 5550 2050 50  0000 C CNN
F 2 "" H 5550 2200 50  0000 C CNN
F 3 "" H 5550 2200 50  0000 C CNN
	1    5550 2200
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR023
U 1 1 5F43E4F8
P 9150 2350
F 0 "#PWR023" H 9150 2100 50  0001 C CNN
F 1 "GND" H 9150 2200 50  0000 C CNN
F 2 "" H 9150 2350 50  0000 C CNN
F 3 "" H 9150 2350 50  0000 C CNN
	1    9150 2350
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR021
U 1 1 5F43E8AB
P 9000 2000
F 0 "#PWR021" H 9000 1850 50  0001 C CNN
F 1 "+3.3V" H 9015 2176 50  0000 C CNN
F 2 "" H 9000 2000 50  0001 C CNN
F 3 "" H 9000 2000 50  0001 C CNN
	1    9000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 2050 9000 2000
Wire Wire Line
	9000 2750 9000 2800
Wire Wire Line
	5550 2150 5550 2200
Wire Wire Line
	5750 3650 5750 3750
Wire Wire Line
	2750 6500 2750 6650
Wire Wire Line
	1300 6200 1550 6200
Wire Wire Line
	1550 6200 1550 5900
Wire Wire Line
	1300 6300 1650 6300
Wire Wire Line
	1300 6400 1550 6400
Wire Wire Line
	1550 6400 1550 6650
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x03-Connector_Generic J2
U 1 1 5F455A97
P 3700 6400
F 0 "J2" V 3617 6070 50  0000 C CNN
F 1 "TRIG" H 3617 6163 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_screw_terminal" H 3700 6400 50  0001 C CNN
F 3 "~" H 3700 6400 50  0001 C CNN
	1    3700 6400
	-1   0    0    1   
$EndComp
$Comp
L matts_components:SPST SW1
U 1 1 5F462D31
P 2350 1850
F 0 "SW1" H 2350 2120 50  0000 C CNN
F 1 "POWER" H 2350 2027 50  0000 C CNN
F 2 "REInnovationFootprint:SW_SPDT_R_Angle_ALIEX" H 2350 1850 50  0001 C CNN
F 3 "" H 2350 1850 50  0000 C CNN
	1    2350 1850
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR01
U 1 1 5F463920
P 2100 2350
F 0 "#PWR01" H 2100 2200 50  0001 C CNN
F 1 "VCC" H 2100 2500 50  0000 C CNN
F 2 "" H 2100 2350 50  0000 C CNN
F 3 "" H 2100 2350 50  0000 C CNN
	1    2100 2350
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR010
U 1 1 5F463CF4
P 3300 2150
F 0 "#PWR010" H 3300 1900 50  0001 C CNN
F 1 "GND" H 3300 2000 50  0000 C CNN
F 2 "" H 3300 2150 50  0000 C CNN
F 3 "" H 3300 2150 50  0000 C CNN
	1    3300 2150
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR012
U 1 1 5F467366
P 4250 1300
F 0 "#PWR012" H 4250 1150 50  0001 C CNN
F 1 "+3.3V" H 4265 1476 50  0000 C CNN
F 2 "" H 4250 1300 50  0001 C CNN
F 3 "" H 4250 1300 50  0001 C CNN
	1    4250 1300
	1    0    0    -1  
$EndComp
$Comp
L device:CP C1
U 1 1 5F46966A
P 2650 1650
F 0 "C1" H 2770 1697 50  0000 L CNN
F 1 "1uf" H 2770 1604 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 2688 1500 50  0001 C CNN
F 3 "~" H 2650 1650 50  0001 C CNN
	1    2650 1650
	1    0    0    -1  
$EndComp
$Comp
L device:CP C3
U 1 1 5F469C49
P 4000 1650
F 0 "C3" H 4120 1697 50  0000 L CNN
F 1 "1uf" H 4120 1604 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 4038 1500 50  0001 C CNN
F 3 "~" H 4000 1650 50  0001 C CNN
	1    4000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1350 4000 1350
Wire Wire Line
	4250 1350 4250 1300
Wire Wire Line
	4000 1500 4000 1350
Connection ~ 4000 1350
Wire Wire Line
	4000 1350 4250 1350
Wire Wire Line
	2350 1350 2650 1350
Wire Wire Line
	2650 1350 2650 1500
Wire Wire Line
	2650 1800 2650 1950
Wire Wire Line
	2650 1950 3300 1950
Wire Wire Line
	4000 1950 4000 1800
Wire Wire Line
	3300 1650 3300 1950
Connection ~ 3300 1950
Wire Wire Line
	3300 1950 4000 1950
Wire Wire Line
	3300 1950 3300 2150
Wire Wire Line
	2650 1350 2900 1350
Connection ~ 2650 1350
$Comp
L WildlifeCamera_PCB-rescue:LED-device D4
U 1 1 5F4D026C
P 5300 3050
F 0 "D4" V 5340 2930 50  0000 R CNN
F 1 "TRIG?" V 5247 2930 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 5300 3050 50  0001 C CNN
F 3 "~" H 5300 3050 50  0001 C CNN
	1    5300 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 6300 2200 6300
$Comp
L WildlifeCamera_PCB-rescue:SW_Push-Switch SW2
U 1 1 5F4DA4DE
P 4750 6000
F 0 "SW2" V 4797 5950 50  0000 R CNN
F 1 "TRIGGER" V 4704 5950 50  0000 R CNN
F 2 "REInnovationFootprint:SW_PUSH_SMALL_lg_pad" H 4750 6200 50  0001 C CNN
F 3 "~" H 4750 6200 50  0001 C CNN
	1    4750 6000
	0    -1   -1   0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R6
U 1 1 5F4DF1E6
P 4900 6400
F 0 "R6" V 4690 6400 50  0000 C CNN
F 1 "1k" V 4783 6400 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 4830 6400 50  0001 C CNN
F 3 "~" H 4900 6400 50  0001 C CNN
	1    4900 6400
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R9
U 1 1 5F4DFB70
P 5300 3500
F 0 "R9" H 5370 3547 50  0000 L CNN
F 1 "330" H 5370 3454 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5230 3500 50  0001 C CNN
F 3 "~" H 5300 3500 50  0001 C CNN
	1    5300 3500
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR015
U 1 1 5F4E0074
P 5300 2700
F 0 "#PWR015" H 5300 2550 50  0001 C CNN
F 1 "+3.3V" H 5315 2876 50  0000 C CNN
F 2 "" H 5300 2700 50  0001 C CNN
F 3 "" H 5300 2700 50  0001 C CNN
	1    5300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2700 5300 2900
Wire Wire Line
	5300 3200 5300 3350
Wire Wire Line
	5300 3650 5300 3750
Wire Wire Line
	5300 3750 5750 3750
Connection ~ 5750 3750
$Comp
L power1:GND #PWR016
U 1 1 5F4E6DB4
P 5500 7000
F 0 "#PWR016" H 5500 6750 50  0001 C CNN
F 1 "GND" H 5500 6850 50  0000 C CNN
F 2 "" H 5500 7000 50  0000 C CNN
F 3 "" H 5500 7000 50  0000 C CNN
	1    5500 7000
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR014
U 1 1 5F4E713C
P 4100 6600
F 0 "#PWR014" H 4100 6350 50  0001 C CNN
F 1 "GND" H 4100 6450 50  0000 C CNN
F 2 "" H 4100 6600 50  0000 C CNN
F 3 "" H 4100 6600 50  0000 C CNN
	1    4100 6600
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR013
U 1 1 5F4E76B0
P 4100 5600
F 0 "#PWR013" H 4100 5450 50  0001 C CNN
F 1 "+3.3V" H 4115 5776 50  0000 C CNN
F 2 "" H 4100 5600 50  0001 C CNN
F 3 "" H 4100 5600 50  0001 C CNN
	1    4100 5600
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R2
U 1 1 5F4E7ABA
P 2200 6550
F 0 "R2" H 2270 6597 50  0000 L CNN
F 1 "10k" H 2270 6504 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2130 6550 50  0001 C CNN
F 3 "~" H 2200 6550 50  0001 C CNN
	1    2200 6550
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR05
U 1 1 5F4E7F19
P 2200 6800
F 0 "#PWR05" H 2200 6550 50  0001 C CNN
F 1 "GND" H 2200 6650 50  0000 C CNN
F 2 "" H 2200 6800 50  0000 C CNN
F 3 "" H 2200 6800 50  0000 C CNN
	1    2200 6800
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R8
U 1 1 5F4E826D
P 5200 6650
F 0 "R8" H 5270 6697 50  0000 L CNN
F 1 "10k" H 5270 6604 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5130 6650 50  0001 C CNN
F 3 "~" H 5200 6650 50  0001 C CNN
	1    5200 6650
	1    0    0    -1  
$EndComp
Text Label 6000 3750 0    60   ~ 0
TRIG
Wire Wire Line
	5750 3750 6000 3750
Text Label 5600 5900 0    60   ~ 0
TRIG
Wire Wire Line
	5600 6200 5600 5900
Wire Wire Line
	3900 6300 4100 6300
Wire Wire Line
	5050 6400 5200 6400
Wire Wire Line
	5200 6800 5200 6900
Wire Wire Line
	5200 6900 5500 6900
Wire Wire Line
	5600 6900 5600 6600
Wire Wire Line
	5500 7000 5500 6900
Connection ~ 5500 6900
Wire Wire Line
	5500 6900 5600 6900
Wire Wire Line
	5200 6500 5200 6400
Connection ~ 5200 6400
Wire Wire Line
	5200 6400 5300 6400
Wire Wire Line
	3900 6500 4100 6500
Wire Wire Line
	4100 6500 4100 6600
Wire Wire Line
	2200 6400 2200 6300
Connection ~ 2200 6300
Wire Wire Line
	2200 6300 2450 6300
Wire Wire Line
	2200 6700 2200 6800
Text Label 2750 5950 0    60   ~ 0
TRIG
Wire Wire Line
	2750 6100 2750 5950
Wire Wire Line
	5750 2350 5750 3350
Text Notes 1900 5750 0    60   ~ 0
PIR Trigger
Text Notes 4450 5500 0    60   ~ 0
EXTERNAL Trigger
Text Notes 7200 1050 0    60   ~ 0
ESP32_CAM Pinout
Text Notes 2650 950  0    60   ~ 0
Power Supply 3.3V 1A
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x06-Connector_Generic J4
U 1 1 5F50D962
P 10350 1950
F 0 "J4" H 10430 1942 50  0000 L CNN
F 1 "PROG" H 10430 1849 50  0000 L CNN
F 2 "REInnovationFootprint:TH_6x1_CONN" H 10350 1950 50  0001 C CNN
F 3 "~" H 10350 1950 50  0001 C CNN
	1    10350 1950
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x02-Connector_Generic J5
U 1 1 5F50EC3E
P 10350 2500
F 0 "J5" H 10430 2492 50  0000 L CNN
F 1 "PROG_EN" H 10430 2399 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Pin_Header_Straight_1x02" H 10350 2500 50  0001 C CNN
F 3 "~" H 10350 2500 50  0001 C CNN
	1    10350 2500
	1    0    0    -1  
$EndComp
Text Notes 9950 1350 0    60   ~ 0
Programming
Text Label 8900 2250 0    60   ~ 0
PROG_EN
Text Label 9650 2500 0    60   ~ 0
PROG_EN
$Comp
L power1:GND #PWR025
U 1 1 5F53D671
P 9650 2700
F 0 "#PWR025" H 9650 2450 50  0001 C CNN
F 1 "GND" H 9650 2550 50  0000 C CNN
F 2 "" H 9650 2700 50  0000 C CNN
F 3 "" H 9650 2700 50  0000 C CNN
	1    9650 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2500 10150 2500
Wire Wire Line
	10150 2600 9650 2600
Wire Wire Line
	9650 2600 9650 2700
$Comp
L power1:GND #PWR026
U 1 1 5F547C35
P 9900 1650
F 0 "#PWR026" H 9900 1400 50  0001 C CNN
F 1 "GND" H 9900 1500 50  0000 C CNN
F 2 "" H 9900 1650 50  0000 C CNN
F 3 "" H 9900 1650 50  0000 C CNN
	1    9900 1650
	1    0    0    -1  
$EndComp
Text Label 5950 2050 0    60   ~ 0
5V_PWR
Text Label 9600 1950 0    60   ~ 0
5V_PWR
Wire Wire Line
	10150 1950 9600 1950
Wire Wire Line
	9900 1650 10050 1650
Wire Wire Line
	10050 1650 10050 1750
Wire Wire Line
	10050 1750 10150 1750
Text Label 8850 2550 0    60   ~ 0
U0R
Text Label 8850 2650 0    60   ~ 0
U0T
Text Label 9700 2050 0    60   ~ 0
U0R
Text Label 9700 2150 0    60   ~ 0
U0T
Wire Wire Line
	10150 2150 9700 2150
Wire Wire Line
	9700 2050 10150 2050
Text Label 5950 2450 0    60   ~ 0
I2C_CLK
Text Label 5950 2550 0    60   ~ 0
I2C_DAT
Text Notes 9750 3300 0    60   ~ 0
RTC DS3231
Text Notes 6650 1550 0    60   ~ 0
SD Card is changed from 4 bit write to 1 bit write.\nThis frees up 3 x GPIO.\n1 is for External Interrupt\n2 are form I2C - connect to RTC.
$Comp
L matts_components:ZENER D1
U 1 1 5F4F0673
P 4350 6700
F 0 "D1" V 4303 6780 50  0000 L CNN
F 1 "ZENER" V 4396 6780 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Diode_3" H 4350 6700 50  0001 C CNN
F 3 "" H 4350 6700 50  0000 C CNN
	1    4350 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 5800 4750 5700
Wire Wire Line
	4100 5700 4100 6300
Wire Wire Line
	4100 5700 4100 5600
Connection ~ 4100 5700
Wire Wire Line
	4750 6200 4750 6400
Connection ~ 4750 6400
NoConn ~ 10150 1850
NoConn ~ 10150 2250
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 5F562F8B
P 6600 6900
F 0 "J7" H 6680 6942 50  0000 L CNN
F 1 "LOGO2" H 6680 6849 50  0000 L CNN
F 2 "CuriousElectric3:2019_011_16_CuriousElectricCompany_Logo_Round_Logo_No_words_KiCAD_10mm_PCBLogo" H 6600 6900 50  0001 C CNN
F 3 "~" H 6600 6900 50  0001 C CNN
	1    6600 6900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 5F5632BE
P 6600 7150
F 0 "J8" H 6680 7192 50  0000 L CNN
F 1 "PCB" H 6680 7099 50  0000 L CNN
F 2 "REInnovationFootprint:PCB_Wildlife_Cam" H 6600 7150 50  0001 C CNN
F 3 "~" H 6600 7150 50  0001 C CNN
	1    6600 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 5F56380B
P 6600 7400
F 0 "J9" H 6680 7442 50  0000 L CNN
F 1 "PV" H 6680 7349 50  0000 L CNN
F 2 "" H 6600 7400 50  0001 C CNN
F 3 "~" H 6600 7400 50  0001 C CNN
	1    6600 7400
	1    0    0    -1  
$EndComp
NoConn ~ 6400 6700
NoConn ~ 6400 6900
NoConn ~ 6400 7150
NoConn ~ 6400 7400
Wire Wire Line
	8400 2150 8450 2150
Wire Wire Line
	8400 2450 8450 2450
Wire Wire Line
	6950 2250 6850 2250
$Comp
L matts_components:MCP1826S-3302 U1
U 1 1 5F5E56C3
P 3300 1400
F 0 "U1" H 3300 1745 60  0000 C CNN
F 1 "MCP1826S-3302" H 3300 1635 60  0000 C CNN
F 2 "REInnovationFootprint:TO220_MCP1826S" H 3300 1400 60  0001 C CNN
F 3 "http://docs-europe.electrocomponents.com/webdocs/137e/0900766b8137eda2.pdf" H 3300 1635 60  0001 C CNN
	1    3300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2050 9000 2050
Wire Wire Line
	8400 2250 8900 2250
Wire Wire Line
	8400 2350 9150 2350
Wire Wire Line
	8400 2550 8850 2550
Wire Wire Line
	8400 2650 8850 2650
Wire Wire Line
	8400 2750 9000 2750
Wire Wire Line
	5750 2350 6950 2350
Wire Wire Line
	5550 2150 6950 2150
Wire Wire Line
	5950 2050 6950 2050
NoConn ~ 6850 2250
NoConn ~ 6850 2750
NoConn ~ 6850 2650
NoConn ~ 8450 2150
NoConn ~ 8450 2450
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 5F562AB4
P 6600 6700
F 0 "J6" H 6680 6742 50  0000 L CNN
F 1 "LOGO1" H 6680 6649 50  0000 L CNN
F 2 "CuriousElectric3:TCEC_Words_13mm" H 6600 6700 50  0001 C CNN
F 3 "~" H 6600 6700 50  0001 C CNN
	1    6600 6700
	1    0    0    -1  
$EndComp
Text Label 1150 3700 0    60   ~ 0
I2C_CLK
$Comp
L WildlifeCamera_PCB-rescue:R-Device R11
U 1 1 5F5439ED
P 1700 3700
F 0 "R11" V 1490 3700 50  0000 C CNN
F 1 "1k" V 1583 3700 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1630 3700 50  0001 C CNN
F 3 "~" H 1700 3700 50  0001 C CNN
	1    1700 3700
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Q_NPN_BCE-Device Q3
U 1 1 5F5439F7
P 2300 3700
F 0 "Q3" H 2490 3747 50  0000 L CNN
F 1 "BD135" H 2490 3654 50  0000 L CNN
F 2 "REInnovationFootprint:TO220_BD135" H 2500 3800 50  0001 C CNN
F 3 "~" H 2300 3700 50  0001 C CNN
	1    2300 3700
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR028
U 1 1 5F543A01
P 2300 4300
F 0 "#PWR028" H 2300 4050 50  0001 C CNN
F 1 "GND" H 2300 4150 50  0000 C CNN
F 2 "" H 2300 4300 50  0000 C CNN
F 3 "" H 2300 4300 50  0000 C CNN
	1    2300 4300
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R12
U 1 1 5F543A0B
P 2000 3950
F 0 "R12" H 2070 3997 50  0000 L CNN
F 1 "10k" H 2070 3904 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1930 3950 50  0001 C CNN
F 3 "~" H 2000 3950 50  0001 C CNN
	1    2000 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3500 2400 3200
Wire Wire Line
	1850 3700 2000 3700
Wire Wire Line
	2000 4100 2000 4200
Wire Wire Line
	2000 4200 2300 4200
Wire Wire Line
	2400 4200 2400 3900
Wire Wire Line
	2300 4300 2300 4200
Connection ~ 2300 4200
Wire Wire Line
	2300 4200 2400 4200
Wire Wire Line
	2000 3800 2000 3700
Connection ~ 2000 3700
Wire Wire Line
	2000 3700 2100 3700
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR029
U 1 1 5F54F9CF
P 3900 3100
F 0 "#PWR029" H 3900 2950 50  0001 C CNN
F 1 "+3.3V" H 3915 3276 50  0000 C CNN
F 2 "" H 3900 3100 50  0001 C CNN
F 3 "" H 3900 3100 50  0001 C CNN
	1    3900 3100
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D5
U 1 1 5F5503F1
P 3450 3200
F 0 "D5" V 3490 3080 50  0000 R CNN
F 1 "FLASH" V 3397 3080 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3450 3200 50  0001 C CNN
F 3 "~" H 3450 3200 50  0001 C CNN
	1    3450 3200
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D6
U 1 1 5F550E8E
P 3450 3600
F 0 "D6" V 3490 3480 50  0000 R CNN
F 1 "FLASH" V 3397 3480 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3450 3600 50  0001 C CNN
F 3 "~" H 3450 3600 50  0001 C CNN
	1    3450 3600
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D7
U 1 1 5F5511AB
P 3450 4000
F 0 "D7" V 3490 3880 50  0000 R CNN
F 1 "FLASH" V 3397 3880 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3450 4000 50  0001 C CNN
F 3 "~" H 3450 4000 50  0001 C CNN
	1    3450 4000
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D8
U 1 1 5F55161A
P 3450 4400
F 0 "D8" V 3490 4280 50  0000 R CNN
F 1 "FLASH" V 3397 4280 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 3450 4400 50  0001 C CNN
F 3 "~" H 3450 4400 50  0001 C CNN
	1    3450 4400
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R13
U 1 1 5F557941
P 3050 3200
F 0 "R13" H 3120 3247 50  0000 L CNN
F 1 "100" H 3120 3154 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2980 3200 50  0001 C CNN
F 3 "~" H 3050 3200 50  0001 C CNN
	1    3050 3200
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R14
U 1 1 5F5580BC
P 3050 3600
F 0 "R14" H 3120 3647 50  0000 L CNN
F 1 "100" H 3120 3554 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2980 3600 50  0001 C CNN
F 3 "~" H 3050 3600 50  0001 C CNN
	1    3050 3600
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R15
U 1 1 5F558344
P 3050 4000
F 0 "R15" H 3120 4047 50  0000 L CNN
F 1 "100" H 3120 3954 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2980 4000 50  0001 C CNN
F 3 "~" H 3050 4000 50  0001 C CNN
	1    3050 4000
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R16
U 1 1 5F5586EA
P 3050 4400
F 0 "R16" H 3120 4447 50  0000 L CNN
F 1 "100" H 3120 4354 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2980 4400 50  0001 C CNN
F 3 "~" H 3050 4400 50  0001 C CNN
	1    3050 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 4400 3900 4400
Wire Wire Line
	3900 4400 3900 4000
Wire Wire Line
	2400 3200 2800 3200
Wire Wire Line
	2800 3200 2800 3600
Wire Wire Line
	2800 4400 2900 4400
Wire Wire Line
	2800 3200 2900 3200
Connection ~ 2800 3200
Wire Wire Line
	3200 3200 3300 3200
Wire Wire Line
	3600 3200 3900 3200
Connection ~ 3900 3200
Wire Wire Line
	3900 3200 3900 3100
Wire Wire Line
	2900 3600 2800 3600
Connection ~ 2800 3600
Wire Wire Line
	2800 3600 2800 4000
Wire Wire Line
	2900 4000 2800 4000
Connection ~ 2800 4000
Wire Wire Line
	2800 4000 2800 4400
Wire Wire Line
	3200 3600 3300 3600
Wire Wire Line
	3200 4000 3300 4000
Wire Wire Line
	3200 4400 3300 4400
Wire Wire Line
	3600 4000 3900 4000
Connection ~ 3900 4000
Wire Wire Line
	3900 4000 3900 3600
Wire Wire Line
	3600 3600 3900 3600
Connection ~ 3900 3600
Wire Wire Line
	3900 3600 3900 3200
Wire Wire Line
	1150 3700 1550 3700
Text Notes 1750 3200 0    60   ~ 0
LED Control
Wire Wire Line
	2100 2350 2100 2400
Wire Wire Line
	2100 2400 2350 2400
Wire Wire Line
	2350 2400 2350 2350
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 5F9E542B
P 10300 3850
F 0 "J3" H 10380 3892 50  0000 L CNN
F 1 "RTC_DS3231" H 10380 3801 50  0000 L CNN
F 2 "REInnovationFootprint:TH_RTC_MODULE_SM" H 10300 3850 50  0001 C CNN
F 3 "~" H 10300 3850 50  0001 C CNN
	1    10300 3850
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR024
U 1 1 5F9E59FA
P 9950 3650
F 0 "#PWR024" H 9950 3500 50  0001 C CNN
F 1 "+3.3V" H 9965 3826 50  0000 C CNN
F 2 "" H 9950 3650 50  0001 C CNN
F 3 "" H 9950 3650 50  0001 C CNN
	1    9950 3650
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR027
U 1 1 5F9E5C64
P 9950 4050
F 0 "#PWR027" H 9950 3800 50  0001 C CNN
F 1 "GND" H 9950 3900 50  0000 C CNN
F 2 "" H 9950 4050 50  0000 C CNN
F 3 "" H 9950 4050 50  0000 C CNN
	1    9950 4050
	1    0    0    -1  
$EndComp
Text Label 9550 3850 0    60   ~ 0
I2C_CLK
Text Label 9550 3750 0    60   ~ 0
I2C_DAT
NoConn ~ 10100 3950
Wire Wire Line
	10100 4050 9950 4050
Wire Wire Line
	9950 3650 10100 3650
Wire Wire Line
	3900 6400 4350 6400
Wire Wire Line
	4100 5700 4750 5700
Wire Wire Line
	4350 6500 4350 6400
Connection ~ 4350 6400
Wire Wire Line
	4350 6400 4750 6400
$Comp
L power1:GND #PWR0101
U 1 1 5FA7F2FD
P 4350 7000
F 0 "#PWR0101" H 4350 6750 50  0001 C CNN
F 1 "GND" H 4350 6850 50  0000 C CNN
F 2 "" H 4350 7000 50  0000 C CNN
F 3 "" H 4350 7000 50  0000 C CNN
	1    4350 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 7000 4350 6900
$Comp
L matts_components:NPN Q1
U 1 1 5FCCCC31
P 2650 6300
F 0 "Q1" H 2840 6347 50  0000 L CNN
F 1 "2N3904" H 2840 6254 50  0000 L CNN
F 2 "REInnovationFootprint:NPN_BC337" H 2650 6300 60  0001 C CNN
F 3 "transistors/bipolar/*.*" H 2840 6207 60  0001 L CNN
	1    2650 6300
	1    0    0    -1  
$EndComp
$Comp
L matts_components:NPN Q2
U 1 1 5FCD0A57
P 5500 6400
F 0 "Q2" H 5690 6447 50  0000 L CNN
F 1 "2N3904" H 5690 6354 50  0000 L CNN
F 2 "REInnovationFootprint:NPN_BC337" H 5500 6400 60  0001 C CNN
F 3 "transistors/bipolar/*.*" H 5690 6307 60  0001 L CNN
	1    5500 6400
	1    0    0    -1  
$EndComp
Text Notes 7100 3950 0    60   ~ 0
GPIO12 = HS2_DATA2\nGPIO12 = HS2_DATA2\nGPIO15 = HS2_DATA3\nGPIO14 = HS2_CLK\nGPIO2 = HS2_DATA0\nGPIO4 = HS2_DATA1/Flash\n
Wire Wire Line
	6950 2750 6850 2750
Wire Wire Line
	6950 2650 6850 2650
Wire Wire Line
	5950 2550 6950 2550
Wire Wire Line
	5950 2450 6950 2450
$Comp
L matts_components:ESP32_CAM U3
U 1 1 5F431B0D
P 7750 1950
F 0 "U3" H 7675 2145 60  0000 C CNN
F 1 "ESP32_CAM" H 7675 2035 60  0000 C CNN
F 2 "REInnovationFootprint:ESP32_CAM" H 7750 1950 60  0001 C CNN
F 3 "" H 7750 1950 60  0001 C CNN
	1    7750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3750 10100 3750
Wire Wire Line
	10100 3850 9550 3850
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 60F7BB91
P 1150 1500
F 0 "J?" H 1068 1175 50  0000 C CNN
F 1 "POWER" H 1068 1266 50  0000 C CNN
F 2 "" H 1150 1500 50  0001 C CNN
F 3 "~" H 1150 1500 50  0001 C CNN
	1    1150 1500
	-1   0    0    1   
$EndComp
$Comp
L power1:VCC #PWR?
U 1 1 60F7C351
P 1500 1350
F 0 "#PWR?" H 1500 1200 50  0001 C CNN
F 1 "VCC" H 1500 1500 50  0000 C CNN
F 2 "" H 1500 1350 50  0000 C CNN
F 3 "" H 1500 1350 50  0000 C CNN
	1    1500 1350
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR?
U 1 1 60F7C877
P 1500 1550
F 0 "#PWR?" H 1500 1300 50  0001 C CNN
F 1 "GND" H 1500 1400 50  0000 C CNN
F 2 "" H 1500 1550 50  0000 C CNN
F 3 "" H 1500 1550 50  0000 C CNN
	1    1500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1400 1500 1400
Wire Wire Line
	1500 1400 1500 1350
Wire Wire Line
	1350 1500 1500 1500
Wire Wire Line
	1500 1500 1500 1550
$EndSCHEMATC
