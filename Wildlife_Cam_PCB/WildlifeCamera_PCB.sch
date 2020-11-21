EESchema Schematic File Version 4
LIBS:WildlifeCamera_PCB-cache
EELAYER 29 0
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
P 5400 1600
F 0 "BT1" H 5500 1700 50  0000 L CNN
F 1 "18650 LiIon Cell" V 5700 1350 50  0000 L CNN
F 2 "REInnovationFootprint:TH_LiIon_Holder" V 5400 1660 50  0001 C CNN
F 3 "" V 5400 1660 50  0000 C CNN
F 4 "~" H 5400 1600 60  0000 C CNN "Notes"
F 5 "18650 PCB mount holder" H 5400 1600 60  0001 C CNN "Description"
F 6 "~" H 5400 1600 60  0001 C CNN "Manufacturer"
F 7 "~" H 5400 1600 60  0001 C CNN "Manufacturer Part No"
F 8 "eBay" H 5400 1600 60  0001 C CNN "Supplier 1"
F 9 "http://www.ebay.co.uk/itm/122466718109" H 5400 1600 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.50" H 5400 1600 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5400 1600 60  0001 C CNN "Supplier 2"
F 12 "~" H 5400 1600 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5400 1600 60  0001 C CNN "Supplier 2 Cost"
	1    5400 1600
	1    0    0    -1  
$EndComp
$Comp
L device:Solar_Cells SC1
U 1 1 58B31275
P 850 1450
F 0 "SC1" H 950 1550 50  0000 L CNN
F 1 "PV_IN" V 600 1350 50  0000 L CNN
F 2 "REInnovationFootprint:SIL_2_screw_+_JST_2mm" V 850 1510 50  0001 C CNN
F 3 "" V 850 1510 50  0000 C CNN
F 4 "~" H 850 1450 60  0000 C CNN "Notes"
F 5 "1-2W solar PV module" H 850 1450 60  0001 C CNN "Description"
F 6 "~" H 850 1450 60  0001 C CNN "Manufacturer"
F 7 "~" H 850 1450 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 850 1450 60  0001 C CNN "Supplier 1"
F 9 "~" H 850 1450 60  0001 C CNN "Supplier 1 Part No"
F 10 "2.5" H 850 1450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 850 1450 60  0001 C CNN "Supplier 2"
F 12 "~" H 850 1450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 850 1450 60  0001 C CNN "Supplier 2 Cost"
	1    850  1450
	1    0    0    -1  
$EndComp
$Comp
L SolarCharger2017-rescue:BQ24210-RESCUE-SolarCharger2017 U2
U 1 1 58B3146F
P 2900 1350
F 0 "U2" H 3100 800 60  0000 C CNN
F 1 "BQ24210" H 2950 1800 60  0000 C CNN
F 2 "REInnovationFootprint:SM_WSON-10-2x3" H 2900 1350 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/bq24210.pdf" H 2900 1350 60  0001 C CNN
F 4 "~" H 2900 1350 60  0001 C CNN "Notes"
F 5 "LiIon Charger 800mA PV Input" H 2900 1350 60  0001 C CNN "Description"
F 6 "Texas Instruments" H 2900 1350 60  0001 C CNN "Manufacturer"
F 7 "BQ24210" H 2900 1350 60  0001 C CNN "Manufacturer Part No"
F 8 "RS" H 2900 1350 60  0001 C CNN "Supplier 1"
F 9 "742-2836" H 2900 1350 60  0001 C CNN "Supplier 1 Part No"
F 10 "2.88" H 2900 1350 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2900 1350 60  0001 C CNN "Supplier 2"
F 12 "~" H 2900 1350 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2900 1350 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 2900 1350 60  0001 C CNN "Cost"
	1    2900 1350
	1    0    0    -1  
$EndComp
$Comp
L SolarCharger2017-rescue:LED-RESCUE-SolarCharger2017 D2
U 1 1 58B3183D
P 3950 1750
F 0 "D2" H 3950 1850 50  0000 C CNN
F 1 "CHG" H 3950 1650 50  0000 C CNN
F 2 "REInnovationFootprint:TH_LED-5MM_larg_pad" H 3950 1750 50  0001 C CNN
F 3 "" H 3950 1750 50  0000 C CNN
F 4 "~" H 3950 1750 60  0000 C CNN "Notes"
F 5 "~" H 3950 1750 60  0001 C CNN "Description"
F 6 "~" H 3950 1750 60  0001 C CNN "Manufacturer"
F 7 "~" H 3950 1750 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 3950 1750 60  0001 C CNN "Supplier 1"
F 9 "~" H 3950 1750 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.05" H 3950 1750 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3950 1750 60  0001 C CNN "Supplier 2"
F 12 "~" H 3950 1750 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3950 1750 60  0001 C CNN "Supplier 2 Cost"
	1    3950 1750
	0    -1   -1   0   
$EndComp
$Comp
L SolarCharger2017-rescue:LED-RESCUE-SolarCharger2017 D3
U 1 1 58B31888
P 4250 1750
F 0 "D3" H 4250 1850 50  0000 C CNN
F 1 "PG" H 4250 1650 50  0000 C CNN
F 2 "REInnovationFootprint:TH_LED-5MM_larg_pad" H 4250 1750 50  0001 C CNN
F 3 "" H 4250 1750 50  0000 C CNN
F 4 "~" H 4250 1750 60  0000 C CNN "Notes"
F 5 "~" H 4250 1750 60  0001 C CNN "Description"
F 6 "~" H 4250 1750 60  0001 C CNN "Manufacturer"
F 7 "~" H 4250 1750 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4250 1750 60  0001 C CNN "Supplier 1"
F 9 "~" H 4250 1750 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.05" H 4250 1750 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4250 1750 60  0001 C CNN "Supplier 2"
F 12 "~" H 4250 1750 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4250 1750 60  0001 C CNN "Supplier 2 Cost"
	1    4250 1750
	0    -1   -1   0   
$EndComp
$Comp
L device:R R5
U 1 1 58B318C0
P 3950 1350
F 0 "R5" V 4030 1350 50  0000 C CNN
F 1 "2.2k" V 3950 1350 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 3880 1350 50  0001 C CNN
F 3 "" H 3950 1350 50  0000 C CNN
F 4 "~" H 3950 1350 60  0000 C CNN "Notes"
F 5 "~" H 3950 1350 60  0001 C CNN "Description"
F 6 "~" H 3950 1350 60  0001 C CNN "Manufacturer"
F 7 "~" H 3950 1350 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 3950 1350 60  0001 C CNN "Supplier 1"
F 9 "~" H 3950 1350 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 3950 1350 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3950 1350 60  0001 C CNN "Supplier 2"
F 12 "~" H 3950 1350 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3950 1350 60  0001 C CNN "Supplier 2 Cost"
	1    3950 1350
	1    0    0    -1  
$EndComp
$Comp
L device:R R7
U 1 1 58B31907
P 4250 1350
F 0 "R7" V 4330 1350 50  0000 C CNN
F 1 "2.2k" V 4250 1350 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 4180 1350 50  0001 C CNN
F 3 "" H 4250 1350 50  0000 C CNN
F 4 "~" H 4250 1350 60  0000 C CNN "Notes"
F 5 "~" H 4250 1350 60  0001 C CNN "Description"
F 6 "~" H 4250 1350 60  0001 C CNN "Manufacturer"
F 7 "~" H 4250 1350 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4250 1350 60  0001 C CNN "Supplier 1"
F 9 "~" H 4250 1350 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 4250 1350 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4250 1350 60  0001 C CNN "Supplier 2"
F 12 "~" H 4250 1350 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4250 1350 60  0001 C CNN "Supplier 2 Cost"
	1    4250 1350
	1    0    0    -1  
$EndComp
$Comp
L device:CP C2
U 1 1 58B319C0
P 1650 1450
F 0 "C2" H 1675 1550 50  0000 L CNN
F 1 "1uF" H 1675 1350 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 1688 1300 50  0001 C CNN
F 3 "" H 1650 1450 50  0000 C CNN
F 4 "~" H 1650 1450 60  0000 C CNN "Notes"
F 5 "~" H 1650 1450 60  0001 C CNN "Description"
F 6 "~" H 1650 1450 60  0001 C CNN "Manufacturer"
F 7 "~" H 1650 1450 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1650 1450 60  0001 C CNN "Supplier 1"
F 9 "~" H 1650 1450 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.1" H 1650 1450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1650 1450 60  0001 C CNN "Supplier 2"
F 12 "~" H 1650 1450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1650 1450 60  0001 C CNN "Supplier 2 Cost"
	1    1650 1450
	1    0    0    -1  
$EndComp
$Comp
L device:CP C4
U 1 1 58B31A6D
P 4800 1550
F 0 "C4" H 4825 1650 50  0000 L CNN
F 1 "1uF" H 4825 1450 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 4838 1400 50  0001 C CNN
F 3 "" H 4800 1550 50  0000 C CNN
F 4 "~" H 4800 1550 60  0000 C CNN "Notes"
F 5 "~" H 4800 1550 60  0001 C CNN "Description"
F 6 "~" H 4800 1550 60  0001 C CNN "Manufacturer"
F 7 "~" H 4800 1550 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4800 1550 60  0001 C CNN "Supplier 1"
F 9 "~" H 4800 1550 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.10" H 4800 1550 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4800 1550 60  0001 C CNN "Supplier 2"
F 12 "~" H 4800 1550 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4800 1550 60  0001 C CNN "Supplier 2 Cost"
	1    4800 1550
	1    0    0    -1  
$EndComp
$Comp
L device:R R3
U 1 1 58B31BC6
P 1900 2150
F 0 "R3" V 1980 2150 50  0000 C CNN
F 1 "1k" V 1900 2150 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1830 2150 50  0001 C CNN
F 3 "" H 1900 2150 50  0000 C CNN
F 4 "~" H 1900 2150 60  0000 C CNN "Notes"
F 5 "~" H 1900 2150 60  0001 C CNN "Description"
F 6 "~" H 1900 2150 60  0001 C CNN "Manufacturer"
F 7 "~" H 1900 2150 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1900 2150 60  0001 C CNN "Supplier 1"
F 9 "~" H 1900 2150 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1900 2150 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1900 2150 60  0001 C CNN "Supplier 2"
F 12 "~" H 1900 2150 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1900 2150 60  0001 C CNN "Supplier 2 Cost"
	1    1900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1150 3950 1150
Wire Wire Line
	3950 1200 3950 1150
Connection ~ 3950 1150
Wire Wire Line
	4250 1200 4250 1150
Connection ~ 4250 1150
Wire Wire Line
	3950 1550 3950 1500
Wire Wire Line
	4250 1550 4250 1500
Wire Wire Line
	3800 1450 3800 2050
Wire Wire Line
	3800 1450 3400 1450
Wire Wire Line
	3400 1750 3550 1750
Wire Wire Line
	3750 1750 3750 2150
$Comp
L power1:GND #PWR09
U 1 1 58B32042
P 2050 1500
F 0 "#PWR09" H 2050 1250 50  0001 C CNN
F 1 "GND" H 2050 1350 50  0000 C CNN
F 2 "" H 2050 1500 50  0000 C CNN
F 3 "" H 2050 1500 50  0000 C CNN
	1    2050 1500
	1    0    0    -1  
$EndComp
$Comp
L power1:PWR_FLAG #FLG01
U 1 1 58B32070
P 4650 1150
F 0 "#FLG01" H 4650 1245 50  0001 C CNN
F 1 "PWR_FLAG" H 4650 1330 50  0000 C CNN
F 2 "" H 4650 1150 50  0000 C CNN
F 3 "" H 4650 1150 50  0000 C CNN
	1    4650 1150
	1    0    0    -1  
$EndComp
$Comp
L power1:VCC #PWR019
U 1 1 58B3209E
P 5000 1150
F 0 "#PWR019" H 5000 1000 50  0001 C CNN
F 1 "VCC" H 5000 1300 50  0000 C CNN
F 2 "" H 5000 1150 50  0000 C CNN
F 3 "" H 5000 1150 50  0000 C CNN
	1    5000 1150
	1    0    0    -1  
$EndComp
Connection ~ 4650 1150
$Comp
L power1:GND #PWR08
U 1 1 58B32372
P 1900 2450
F 0 "#PWR08" H 1900 2200 50  0001 C CNN
F 1 "GND" H 1900 2300 50  0000 C CNN
F 2 "" H 1900 2450 50  0000 C CNN
F 3 "" H 1900 2450 50  0000 C CNN
	1    1900 2450
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR011
U 1 1 58B323A4
P 2950 2150
F 0 "#PWR011" H 2950 1900 50  0001 C CNN
F 1 "GND" H 2950 2000 50  0000 C CNN
F 2 "" H 2950 2150 50  0000 C CNN
F 3 "" H 2950 2150 50  0000 C CNN
	1    2950 2150
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR06
U 1 1 58B32581
P 1650 1700
F 0 "#PWR06" H 1650 1450 50  0001 C CNN
F 1 "GND" H 1650 1550 50  0000 C CNN
F 2 "" H 1650 1700 50  0000 C CNN
F 3 "" H 1650 1700 50  0000 C CNN
	1    1650 1700
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR04
U 1 1 58B325B3
P 850 1750
F 0 "#PWR04" H 850 1500 50  0001 C CNN
F 1 "GND" H 850 1600 50  0000 C CNN
F 2 "" H 850 1750 50  0000 C CNN
F 3 "" H 850 1750 50  0000 C CNN
	1    850  1750
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR017
U 1 1 58B325E5
P 4800 1800
F 0 "#PWR017" H 4800 1550 50  0001 C CNN
F 1 "GND" H 4800 1650 50  0000 C CNN
F 2 "" H 4800 1800 50  0000 C CNN
F 3 "" H 4800 1800 50  0000 C CNN
	1    4800 1800
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR020
U 1 1 58B32617
P 5400 1800
F 0 "#PWR020" H 5400 1550 50  0001 C CNN
F 1 "GND" H 5400 1650 50  0000 C CNN
F 2 "" H 5400 1800 50  0000 C CNN
F 3 "" H 5400 1800 50  0000 C CNN
	1    5400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1150 850  1250
Wire Wire Line
	2050 1450 2500 1450
Wire Wire Line
	2050 1450 2050 1500
Wire Wire Line
	1900 2000 1900 1300
Wire Wire Line
	1900 1300 2500 1300
Wire Wire Line
	1900 2450 1900 2300
Wire Wire Line
	1650 1700 1650 1600
Wire Wire Line
	1650 1300 1650 1150
Connection ~ 1650 1150
Wire Wire Line
	850  1750 850  1650
Wire Wire Line
	2950 2150 2950 2050
Wire Wire Line
	5400 1150 5400 1400
Connection ~ 5000 1150
Wire Wire Line
	4800 1400 4800 1150
Connection ~ 4800 1150
Wire Wire Line
	4800 1700 4800 1800
Wire Wire Line
	5400 1700 5400 1800
Text Notes 700  1050 0    60   ~ 0
Solar PV Input\n<800mA\n<20V DC
Text Notes 5000 850  0    60   ~ 0
LiIon Cell 18650
Wire Wire Line
	3800 2050 3950 2050
Wire Wire Line
	3950 2050 3950 1950
Wire Wire Line
	3750 2150 4250 2150
Wire Wire Line
	4250 2150 4250 1950
$Comp
L device:R R4
U 1 1 58B6EAFF
P 2350 1950
F 0 "R4" V 2430 1950 50  0000 C CNN
F 1 "100k" V 2350 1950 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2280 1950 50  0001 C CNN
F 3 "" H 2350 1950 50  0000 C CNN
F 4 "~" H 2350 1950 60  0000 C CNN "Notes"
F 5 "~" H 2350 1950 60  0001 C CNN "Description"
F 6 "~" H 2350 1950 60  0001 C CNN "Manufacturer"
F 7 "~" H 2350 1950 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2350 1950 60  0001 C CNN "Supplier 1"
F 9 "~" H 2350 1950 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 2350 1950 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2350 1950 60  0001 C CNN "Supplier 2"
F 12 "~" H 2350 1950 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2350 1950 60  0001 C CNN "Supplier 2 Cost"
	1    2350 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1750 2350 1750
Wire Wire Line
	2350 1750 2350 1800
Wire Wire Line
	2350 2100 2350 2200
Wire Wire Line
	2350 2200 2250 2200
Wire Wire Line
	2250 2200 2250 1600
Wire Wire Line
	2250 1600 2500 1600
NoConn ~ 3400 1300
Wire Wire Line
	3400 1600 3550 1600
Wire Wire Line
	3550 1600 3550 1750
Connection ~ 3550 1750
Wire Wire Line
	3950 1150 4250 1150
Wire Wire Line
	4250 1150 4650 1150
Wire Wire Line
	4650 1150 4800 1150
Wire Wire Line
	5000 1150 5400 1150
Wire Wire Line
	4800 1150 5000 1150
Wire Wire Line
	3550 1750 3750 1750
Wire Wire Line
	1650 1150 2500 1150
Wire Wire Line
	850  1150 1650 1150
Text Notes 6000 2350 0    60   ~ 0
Ts pulled high for solar charing applications\nLimited current mode to ensure battery temperature OK\nPull high with 100k \n\nVDPM\nKept open for load tracking, such as solar PV \nVDPM to ground using\nRVDPM= (VBUS_DPM–VBUS_DPM_1)/KVBUS_DPM\n= (4.6 V - 3.5 V) / ( 0.15V/kΩ) \n= 7.333kΩ → 7.32kΩ closest 1% resistor\n\nIset\n2W of solar PV gives 400mA maximum\nRiset = Kiset/Iout Iout = 400mA. \nKiset = 395Aohm. Riset = 987.5. Close to 1k\n\nEN tied to PG as load mode never used
$Comp
L matts_components:ESP32_CAM U3
U 1 1 5F431B0D
P 7750 3800
F 0 "U3" H 7675 3995 60  0000 C CNN
F 1 "ESP32_CAM" H 7675 3885 60  0000 C CNN
F 2 "REInnovationFootprint:ESP32_CAM" H 7750 3800 60  0001 C CNN
F 3 "" H 7750 3800 60  0001 C CNN
	1    7750 3800
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Q_NPN_BCE-Device Q1
U 1 1 5F433637
P 2400 6800
F 0 "Q1" H 2590 6847 50  0000 L CNN
F 1 "2N3904" H 2590 6754 50  0000 L CNN
F 2 "REInnovationFootprint:TO92-EBC_large_pad" H 2600 6900 50  0001 C CNN
F 3 "~" H 2400 6800 50  0001 C CNN
	1    2400 6800
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R10
U 1 1 5F433F45
P 5750 5350
F 0 "R10" H 5820 5397 50  0000 L CNN
F 1 "10k" H 5820 5304 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5680 5350 50  0001 C CNN
F 3 "~" H 5750 5350 50  0001 C CNN
	1    5750 5350
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R1
U 1 1 5F4345CF
P 1550 6800
F 0 "R1" V 1340 6800 50  0000 C CNN
F 1 "1k" V 1433 6800 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1480 6800 50  0001 C CNN
F 3 "~" H 1550 6800 50  0001 C CNN
	1    1550 6800
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x03-Connector_Generic J1
U 1 1 5F434B25
P 850 6800
F 0 "J1" V 767 6470 50  0000 C CNN
F 1 "PIR" H 767 6563 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_lg_pad" H 850 6800 50  0001 C CNN
F 3 "~" H 850 6800 50  0001 C CNN
	1    850  6800
	-1   0    0    1   
$EndComp
$Comp
L power1:GND #PWR03
U 1 1 5F43612D
P 1300 7150
F 0 "#PWR03" H 1300 6900 50  0001 C CNN
F 1 "GND" H 1300 7000 50  0000 C CNN
F 2 "" H 1300 7150 50  0000 C CNN
F 3 "" H 1300 7150 50  0000 C CNN
	1    1300 7150
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR022
U 1 1 5F4386F1
P 9000 4650
F 0 "#PWR022" H 9000 4400 50  0001 C CNN
F 1 "GND" H 9000 4500 50  0000 C CNN
F 2 "" H 9000 4650 50  0000 C CNN
F 3 "" H 9000 4650 50  0000 C CNN
	1    9000 4650
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR02
U 1 1 5F4389FE
P 1300 6400
F 0 "#PWR02" H 1300 6250 50  0001 C CNN
F 1 "+3.3V" H 1315 6576 50  0000 C CNN
F 2 "" H 1300 6400 50  0001 C CNN
F 3 "" H 1300 6400 50  0001 C CNN
	1    1300 6400
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR07
U 1 1 5F439209
P 2500 7150
F 0 "#PWR07" H 2500 6900 50  0001 C CNN
F 1 "GND" H 2500 7000 50  0000 C CNN
F 2 "" H 2500 7150 50  0000 C CNN
F 3 "" H 2500 7150 50  0000 C CNN
	1    2500 7150
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR018
U 1 1 5F43E1BA
P 5550 4050
F 0 "#PWR018" H 5550 3800 50  0001 C CNN
F 1 "GND" H 5550 3900 50  0000 C CNN
F 2 "" H 5550 4050 50  0000 C CNN
F 3 "" H 5550 4050 50  0000 C CNN
	1    5550 4050
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR023
U 1 1 5F43E4F8
P 9150 4200
F 0 "#PWR023" H 9150 3950 50  0001 C CNN
F 1 "GND" H 9150 4050 50  0000 C CNN
F 2 "" H 9150 4200 50  0000 C CNN
F 3 "" H 9150 4200 50  0000 C CNN
	1    9150 4200
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR021
U 1 1 5F43E8AB
P 9000 3850
F 0 "#PWR021" H 9000 3700 50  0001 C CNN
F 1 "+3.3V" H 9015 4026 50  0000 C CNN
F 2 "" H 9000 3850 50  0001 C CNN
F 3 "" H 9000 3850 50  0001 C CNN
	1    9000 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3900 9000 3850
Wire Wire Line
	9000 4600 9000 4650
Wire Wire Line
	5550 4000 5550 4050
Wire Wire Line
	5750 5500 5750 5600
Wire Wire Line
	2500 7000 2500 7150
Wire Wire Line
	1050 6700 1300 6700
Wire Wire Line
	1300 6700 1300 6400
Wire Wire Line
	1050 6800 1400 6800
Wire Wire Line
	1050 6900 1300 6900
Wire Wire Line
	1300 6900 1300 7150
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x03-Connector_Generic J2
U 1 1 5F455A97
P 3900 6950
F 0 "J2" V 3817 6620 50  0000 C CNN
F 1 "TRIG" H 3817 6713 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-3_screw_terminal" H 3900 6950 50  0001 C CNN
F 3 "~" H 3900 6950 50  0001 C CNN
	1    3900 6950
	-1   0    0    1   
$EndComp
$Comp
L matts_components:SPST SW1
U 1 1 5F462D31
P 8900 1700
F 0 "SW1" H 8900 1970 50  0000 C CNN
F 1 "ON/OFF" H 8900 1877 50  0000 C CNN
F 2 "REInnovationFootprint:SW_SPDT_R_Angle_ALIEX" H 8900 1700 50  0001 C CNN
F 3 "" H 8900 1700 50  0000 C CNN
	1    8900 1700
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR01
U 1 1 5F463920
P 8650 2200
F 0 "#PWR01" H 8650 2050 50  0001 C CNN
F 1 "VCC" H 8650 2350 50  0000 C CNN
F 2 "" H 8650 2200 50  0000 C CNN
F 3 "" H 8650 2200 50  0000 C CNN
	1    8650 2200
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR010
U 1 1 5F463CF4
P 9850 2000
F 0 "#PWR010" H 9850 1750 50  0001 C CNN
F 1 "GND" H 9850 1850 50  0000 C CNN
F 2 "" H 9850 2000 50  0000 C CNN
F 3 "" H 9850 2000 50  0000 C CNN
	1    9850 2000
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR012
U 1 1 5F467366
P 10800 1150
F 0 "#PWR012" H 10800 1000 50  0001 C CNN
F 1 "+3.3V" H 10815 1326 50  0000 C CNN
F 2 "" H 10800 1150 50  0001 C CNN
F 3 "" H 10800 1150 50  0001 C CNN
	1    10800 1150
	1    0    0    -1  
$EndComp
$Comp
L device:CP C1
U 1 1 5F46966A
P 9200 1500
F 0 "C1" H 9320 1547 50  0000 L CNN
F 1 "1uf" H 9320 1454 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 9238 1350 50  0001 C CNN
F 3 "~" H 9200 1500 50  0001 C CNN
	1    9200 1500
	1    0    0    -1  
$EndComp
$Comp
L device:CP C3
U 1 1 5F469C49
P 10550 1500
F 0 "C3" H 10670 1547 50  0000 L CNN
F 1 "1uf" H 10670 1454 50  0000 L CNN
F 2 "REInnovationFootprint:C_1V7_TH" H 10588 1350 50  0001 C CNN
F 3 "~" H 10550 1500 50  0001 C CNN
	1    10550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 1200 10550 1200
Wire Wire Line
	10800 1200 10800 1150
Wire Wire Line
	10550 1350 10550 1200
Connection ~ 10550 1200
Wire Wire Line
	10550 1200 10800 1200
Wire Wire Line
	8900 1200 9200 1200
Wire Wire Line
	9200 1200 9200 1350
Wire Wire Line
	9200 1650 9200 1800
Wire Wire Line
	9200 1800 9850 1800
Wire Wire Line
	10550 1800 10550 1650
Wire Wire Line
	9850 1500 9850 1800
Connection ~ 9850 1800
Wire Wire Line
	9850 1800 10550 1800
Wire Wire Line
	9850 1800 9850 2000
Wire Wire Line
	9200 1200 9450 1200
Connection ~ 9200 1200
$Comp
L WildlifeCamera_PCB-rescue:LED-device D4
U 1 1 5F4D026C
P 5300 4900
F 0 "D4" V 5340 4780 50  0000 R CNN
F 1 "TRIG?" V 5247 4780 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 5300 4900 50  0001 C CNN
F 3 "~" H 5300 4900 50  0001 C CNN
	1    5300 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 6800 1950 6800
$Comp
L WildlifeCamera_PCB-rescue:SW_Push-Switch SW2
U 1 1 5F4DA4DE
P 4950 6550
F 0 "SW2" V 4997 6500 50  0000 R CNN
F 1 "TRIGGER" V 4904 6500 50  0000 R CNN
F 2 "REInnovationFootprint:SW_PUSH_SMALL_lg_pad" H 4950 6750 50  0001 C CNN
F 3 "~" H 4950 6750 50  0001 C CNN
	1    4950 6550
	0    -1   -1   0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R6
U 1 1 5F4DF1E6
P 5100 6950
F 0 "R6" V 4890 6950 50  0000 C CNN
F 1 "1k" V 4983 6950 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5030 6950 50  0001 C CNN
F 3 "~" H 5100 6950 50  0001 C CNN
	1    5100 6950
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Q_NPN_BCE-Device Q2
U 1 1 5F4DF59B
P 5700 6950
F 0 "Q2" H 5890 6997 50  0000 L CNN
F 1 "2N3904" H 5890 6904 50  0000 L CNN
F 2 "REInnovationFootprint:TO92-EBC_large_pad" H 5900 7050 50  0001 C CNN
F 3 "~" H 5700 6950 50  0001 C CNN
	1    5700 6950
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R9
U 1 1 5F4DFB70
P 5300 5350
F 0 "R9" H 5370 5397 50  0000 L CNN
F 1 "330" H 5370 5304 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5230 5350 50  0001 C CNN
F 3 "~" H 5300 5350 50  0001 C CNN
	1    5300 5350
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR015
U 1 1 5F4E0074
P 5300 4550
F 0 "#PWR015" H 5300 4400 50  0001 C CNN
F 1 "+3.3V" H 5315 4726 50  0000 C CNN
F 2 "" H 5300 4550 50  0001 C CNN
F 3 "" H 5300 4550 50  0001 C CNN
	1    5300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4550 5300 4750
Wire Wire Line
	5300 5050 5300 5200
Wire Wire Line
	5300 5500 5300 5600
Wire Wire Line
	5300 5600 5750 5600
Connection ~ 5750 5600
$Comp
L power1:GND #PWR016
U 1 1 5F4E6DB4
P 5700 7550
F 0 "#PWR016" H 5700 7300 50  0001 C CNN
F 1 "GND" H 5700 7400 50  0000 C CNN
F 2 "" H 5700 7550 50  0000 C CNN
F 3 "" H 5700 7550 50  0000 C CNN
	1    5700 7550
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR014
U 1 1 5F4E713C
P 4300 7150
F 0 "#PWR014" H 4300 6900 50  0001 C CNN
F 1 "GND" H 4300 7000 50  0000 C CNN
F 2 "" H 4300 7150 50  0000 C CNN
F 3 "" H 4300 7150 50  0000 C CNN
	1    4300 7150
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR013
U 1 1 5F4E76B0
P 4300 6150
F 0 "#PWR013" H 4300 6000 50  0001 C CNN
F 1 "+3.3V" H 4315 6326 50  0000 C CNN
F 2 "" H 4300 6150 50  0001 C CNN
F 3 "" H 4300 6150 50  0001 C CNN
	1    4300 6150
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R2
U 1 1 5F4E7ABA
P 1950 7050
F 0 "R2" H 2020 7097 50  0000 L CNN
F 1 "10k" H 2020 7004 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1880 7050 50  0001 C CNN
F 3 "~" H 1950 7050 50  0001 C CNN
	1    1950 7050
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR05
U 1 1 5F4E7F19
P 1950 7300
F 0 "#PWR05" H 1950 7050 50  0001 C CNN
F 1 "GND" H 1950 7150 50  0000 C CNN
F 2 "" H 1950 7300 50  0000 C CNN
F 3 "" H 1950 7300 50  0000 C CNN
	1    1950 7300
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R8
U 1 1 5F4E826D
P 5400 7200
F 0 "R8" H 5470 7247 50  0000 L CNN
F 1 "10k" H 5470 7154 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5330 7200 50  0001 C CNN
F 3 "~" H 5400 7200 50  0001 C CNN
	1    5400 7200
	1    0    0    -1  
$EndComp
Text Label 6000 5600 0    60   ~ 0
TRIG
Wire Wire Line
	5750 5600 6000 5600
Text Label 5800 6450 0    60   ~ 0
TRIG
Wire Wire Line
	5800 6750 5800 6450
Wire Wire Line
	4100 6850 4300 6850
Wire Wire Line
	5250 6950 5400 6950
Wire Wire Line
	5400 7350 5400 7450
Wire Wire Line
	5400 7450 5700 7450
Wire Wire Line
	5800 7450 5800 7150
Wire Wire Line
	5700 7550 5700 7450
Connection ~ 5700 7450
Wire Wire Line
	5700 7450 5800 7450
Wire Wire Line
	5400 7050 5400 6950
Connection ~ 5400 6950
Wire Wire Line
	5400 6950 5500 6950
Wire Wire Line
	4100 7050 4300 7050
Wire Wire Line
	4300 7050 4300 7150
Wire Wire Line
	1950 6900 1950 6800
Connection ~ 1950 6800
Wire Wire Line
	1950 6800 2200 6800
Wire Wire Line
	1950 7200 1950 7300
Text Label 2500 6450 0    60   ~ 0
TRIG
Wire Wire Line
	2500 6600 2500 6450
Wire Wire Line
	5750 4200 5750 5200
Text Notes 1650 6250 0    60   ~ 0
PIR Trigger
Text Notes 4750 6100 0    60   ~ 0
EXTERNAL Trigger
Text Notes 7200 2900 0    60   ~ 0
ESP32_CAM Pinout
Text Notes 9200 800  0    60   ~ 0
Power Supply 3.3V 1A
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x06-Connector_Generic J4
U 1 1 5F50D962
P 10350 3800
F 0 "J4" H 10430 3792 50  0000 L CNN
F 1 "PROG" H 10430 3699 50  0000 L CNN
F 2 "REInnovationFootprint:TH_6x1_CONN" H 10350 3800 50  0001 C CNN
F 3 "~" H 10350 3800 50  0001 C CNN
	1    10350 3800
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Conn_01x02-Connector_Generic J5
U 1 1 5F50EC3E
P 10350 4350
F 0 "J5" H 10430 4342 50  0000 L CNN
F 1 "PROG_EN" H 10430 4249 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Pin_Header_Straight_1x02" H 10350 4350 50  0001 C CNN
F 3 "~" H 10350 4350 50  0001 C CNN
	1    10350 4350
	1    0    0    -1  
$EndComp
Text Notes 9950 3200 0    60   ~ 0
Programming
Text Label 8900 4100 0    60   ~ 0
PROG_EN
Text Label 9650 4350 0    60   ~ 0
PROG_EN
$Comp
L power1:GND #PWR025
U 1 1 5F53D671
P 9650 4550
F 0 "#PWR025" H 9650 4300 50  0001 C CNN
F 1 "GND" H 9650 4400 50  0000 C CNN
F 2 "" H 9650 4550 50  0000 C CNN
F 3 "" H 9650 4550 50  0000 C CNN
	1    9650 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4350 10150 4350
Wire Wire Line
	10150 4450 9650 4450
Wire Wire Line
	9650 4450 9650 4550
$Comp
L power1:GND #PWR026
U 1 1 5F547C35
P 9900 3500
F 0 "#PWR026" H 9900 3250 50  0001 C CNN
F 1 "GND" H 9900 3350 50  0000 C CNN
F 2 "" H 9900 3500 50  0000 C CNN
F 3 "" H 9900 3500 50  0000 C CNN
	1    9900 3500
	1    0    0    -1  
$EndComp
Text Label 5950 3900 0    60   ~ 0
5V_PWR
Text Label 9600 3800 0    60   ~ 0
5V_PWR
Wire Wire Line
	10150 3800 9600 3800
Wire Wire Line
	9900 3500 10050 3500
Wire Wire Line
	10050 3500 10050 3600
Wire Wire Line
	10050 3600 10150 3600
Text Label 8850 4400 0    60   ~ 0
U0R
Text Label 8850 4500 0    60   ~ 0
U0T
Text Label 9700 3900 0    60   ~ 0
U0R
Text Label 9700 4000 0    60   ~ 0
U0T
Wire Wire Line
	10150 4000 9700 4000
Wire Wire Line
	9700 3900 10150 3900
Text Label 5950 4600 0    60   ~ 0
I2C_CLK
Text Label 5950 4500 0    60   ~ 0
I2C_DAT
Text Notes 9750 5150 0    60   ~ 0
RTC DS3231
Text Notes 6650 3400 0    60   ~ 0
SD Card is changed from 4 bit write to 1 bit write.\nThis frees up 3 x GPIO.\n1 is for External Interrupt\n2 are form I2C - connect to RTC.
$Comp
L matts_components:ZENER D1
U 1 1 5F4F0673
P 4550 7250
F 0 "D1" V 4503 7330 50  0000 L CNN
F 1 "ZENER" V 4596 7330 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Diode_3" H 4550 7250 50  0001 C CNN
F 3 "" H 4550 7250 50  0000 C CNN
	1    4550 7250
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 6350 4950 6250
Wire Wire Line
	4300 6250 4300 6850
Wire Wire Line
	4300 6250 4300 6150
Connection ~ 4300 6250
Wire Wire Line
	4950 6750 4950 6950
Connection ~ 4950 6950
NoConn ~ 10150 3700
NoConn ~ 10150 4100
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
	8400 4000 8450 4000
Wire Wire Line
	8400 4300 8450 4300
Wire Wire Line
	6950 4400 6850 4400
Wire Wire Line
	6950 4300 6850 4300
Wire Wire Line
	6950 4100 6850 4100
$Comp
L matts_components:MCP1826S-3302 U1
U 1 1 5F5E56C3
P 9850 1250
F 0 "U1" H 9850 1595 60  0000 C CNN
F 1 "MCP1826S-3302" H 9850 1485 60  0000 C CNN
F 2 "REInnovationFootprint:TO220_MCP1826S" H 9850 1250 60  0001 C CNN
F 3 "http://docs-europe.electrocomponents.com/webdocs/137e/0900766b8137eda2.pdf" H 9850 1485 60  0001 C CNN
	1    9850 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3900 9000 3900
Wire Wire Line
	8400 4100 8900 4100
Wire Wire Line
	8400 4200 9150 4200
Wire Wire Line
	8400 4400 8850 4400
Wire Wire Line
	8400 4500 8850 4500
Wire Wire Line
	8400 4600 9000 4600
Wire Wire Line
	5950 4500 6950 4500
Wire Wire Line
	5950 4600 6950 4600
Wire Wire Line
	5750 4200 6950 4200
Wire Wire Line
	5550 4000 6950 4000
Wire Wire Line
	5950 3900 6950 3900
NoConn ~ 6850 4100
NoConn ~ 6850 4300
NoConn ~ 6850 4400
NoConn ~ 8450 4000
NoConn ~ 8450 4300
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
Text Label 600  3550 0    60   ~ 0
I2C_CLK
$Comp
L WildlifeCamera_PCB-rescue:R-Device R11
U 1 1 5F5439ED
P 1150 3550
F 0 "R11" V 940 3550 50  0000 C CNN
F 1 "1k" V 1033 3550 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1080 3550 50  0001 C CNN
F 3 "~" H 1150 3550 50  0001 C CNN
	1    1150 3550
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:Q_NPN_BCE-Device Q3
U 1 1 5F5439F7
P 1750 3550
F 0 "Q3" H 1940 3597 50  0000 L CNN
F 1 "BD135" H 1940 3504 50  0000 L CNN
F 2 "REInnovationFootprint:TO220_BD135" H 1950 3650 50  0001 C CNN
F 3 "~" H 1750 3550 50  0001 C CNN
	1    1750 3550
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR028
U 1 1 5F543A01
P 1750 4150
F 0 "#PWR028" H 1750 3900 50  0001 C CNN
F 1 "GND" H 1750 4000 50  0000 C CNN
F 2 "" H 1750 4150 50  0000 C CNN
F 3 "" H 1750 4150 50  0000 C CNN
	1    1750 4150
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R12
U 1 1 5F543A0B
P 1450 3800
F 0 "R12" H 1520 3847 50  0000 L CNN
F 1 "10k" H 1520 3754 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1380 3800 50  0001 C CNN
F 3 "~" H 1450 3800 50  0001 C CNN
	1    1450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3350 1850 3050
Wire Wire Line
	1300 3550 1450 3550
Wire Wire Line
	1450 3950 1450 4050
Wire Wire Line
	1450 4050 1750 4050
Wire Wire Line
	1850 4050 1850 3750
Wire Wire Line
	1750 4150 1750 4050
Connection ~ 1750 4050
Wire Wire Line
	1750 4050 1850 4050
Wire Wire Line
	1450 3650 1450 3550
Connection ~ 1450 3550
Wire Wire Line
	1450 3550 1550 3550
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR029
U 1 1 5F54F9CF
P 3350 2950
F 0 "#PWR029" H 3350 2800 50  0001 C CNN
F 1 "+3.3V" H 3365 3126 50  0000 C CNN
F 2 "" H 3350 2950 50  0001 C CNN
F 3 "" H 3350 2950 50  0001 C CNN
	1    3350 2950
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D5
U 1 1 5F5503F1
P 2900 3050
F 0 "D5" V 2940 2930 50  0000 R CNN
F 1 "FLASH" V 2847 2930 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 2900 3050 50  0001 C CNN
F 3 "~" H 2900 3050 50  0001 C CNN
	1    2900 3050
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D6
U 1 1 5F550E8E
P 2900 3450
F 0 "D6" V 2940 3330 50  0000 R CNN
F 1 "FLASH" V 2847 3330 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 2900 3450 50  0001 C CNN
F 3 "~" H 2900 3450 50  0001 C CNN
	1    2900 3450
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D7
U 1 1 5F5511AB
P 2900 3850
F 0 "D7" V 2940 3730 50  0000 R CNN
F 1 "FLASH" V 2847 3730 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 2900 3850 50  0001 C CNN
F 3 "~" H 2900 3850 50  0001 C CNN
	1    2900 3850
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:LED-device D8
U 1 1 5F55161A
P 2900 4250
F 0 "D8" V 2940 4130 50  0000 R CNN
F 1 "FLASH" V 2847 4130 50  0000 R CNN
F 2 "REInnovationFootprint:TH_LED-5MM" H 2900 4250 50  0001 C CNN
F 3 "~" H 2900 4250 50  0001 C CNN
	1    2900 4250
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R13
U 1 1 5F557941
P 2500 3050
F 0 "R13" H 2570 3097 50  0000 L CNN
F 1 "100" H 2570 3004 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2430 3050 50  0001 C CNN
F 3 "~" H 2500 3050 50  0001 C CNN
	1    2500 3050
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R14
U 1 1 5F5580BC
P 2500 3450
F 0 "R14" H 2570 3497 50  0000 L CNN
F 1 "100" H 2570 3404 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2430 3450 50  0001 C CNN
F 3 "~" H 2500 3450 50  0001 C CNN
	1    2500 3450
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R15
U 1 1 5F558344
P 2500 3850
F 0 "R15" H 2570 3897 50  0000 L CNN
F 1 "100" H 2570 3804 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2430 3850 50  0001 C CNN
F 3 "~" H 2500 3850 50  0001 C CNN
	1    2500 3850
	0    1    1    0   
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:R-Device R16
U 1 1 5F5586EA
P 2500 4250
F 0 "R16" H 2570 4297 50  0000 L CNN
F 1 "100" H 2570 4204 50  0000 L CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2430 4250 50  0001 C CNN
F 3 "~" H 2500 4250 50  0001 C CNN
	1    2500 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 4250 3350 4250
Wire Wire Line
	3350 4250 3350 3850
Wire Wire Line
	1850 3050 2250 3050
Wire Wire Line
	2250 3050 2250 3450
Wire Wire Line
	2250 4250 2350 4250
Wire Wire Line
	2250 3050 2350 3050
Connection ~ 2250 3050
Wire Wire Line
	2650 3050 2750 3050
Wire Wire Line
	3050 3050 3350 3050
Connection ~ 3350 3050
Wire Wire Line
	3350 3050 3350 2950
Wire Wire Line
	2350 3450 2250 3450
Connection ~ 2250 3450
Wire Wire Line
	2250 3450 2250 3850
Wire Wire Line
	2350 3850 2250 3850
Connection ~ 2250 3850
Wire Wire Line
	2250 3850 2250 4250
Wire Wire Line
	2650 3450 2750 3450
Wire Wire Line
	2650 3850 2750 3850
Wire Wire Line
	2650 4250 2750 4250
Wire Wire Line
	3050 3850 3350 3850
Connection ~ 3350 3850
Wire Wire Line
	3350 3850 3350 3450
Wire Wire Line
	3050 3450 3350 3450
Connection ~ 3350 3450
Wire Wire Line
	3350 3450 3350 3050
Wire Wire Line
	600  3550 1000 3550
Text Notes 1200 3050 0    60   ~ 0
LED Control
Wire Wire Line
	8650 2200 8650 2250
Wire Wire Line
	8650 2250 8900 2250
Wire Wire Line
	8900 2250 8900 2200
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 5F9E542B
P 10300 5700
F 0 "J3" H 10380 5742 50  0000 L CNN
F 1 "RTC_DS3231" H 10380 5651 50  0000 L CNN
F 2 "REInnovationFootprint:TH_RTC_MODULE_SM" H 10300 5700 50  0001 C CNN
F 3 "~" H 10300 5700 50  0001 C CNN
	1    10300 5700
	1    0    0    -1  
$EndComp
$Comp
L WildlifeCamera_PCB-rescue:+3.3V-power #PWR024
U 1 1 5F9E59FA
P 9950 5500
F 0 "#PWR024" H 9950 5350 50  0001 C CNN
F 1 "+3.3V" H 9965 5676 50  0000 C CNN
F 2 "" H 9950 5500 50  0001 C CNN
F 3 "" H 9950 5500 50  0001 C CNN
	1    9950 5500
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR027
U 1 1 5F9E5C64
P 9950 5900
F 0 "#PWR027" H 9950 5650 50  0001 C CNN
F 1 "GND" H 9950 5750 50  0000 C CNN
F 2 "" H 9950 5900 50  0000 C CNN
F 3 "" H 9950 5900 50  0000 C CNN
	1    9950 5900
	1    0    0    -1  
$EndComp
Text Label 9550 5700 0    60   ~ 0
I2C_CLK
Text Label 9550 5600 0    60   ~ 0
I2C_DAT
NoConn ~ 10100 5800
Wire Wire Line
	10100 5900 9950 5900
Wire Wire Line
	9950 5500 10100 5500
Wire Wire Line
	10100 5600 9550 5600
Wire Wire Line
	9550 5700 10100 5700
Wire Wire Line
	4100 6950 4550 6950
Wire Wire Line
	4300 6250 4950 6250
Wire Wire Line
	4550 7050 4550 6950
Connection ~ 4550 6950
Wire Wire Line
	4550 6950 4950 6950
$Comp
L power1:GND #PWR0101
U 1 1 5FA7F2FD
P 4550 7550
F 0 "#PWR0101" H 4550 7300 50  0001 C CNN
F 1 "GND" H 4550 7400 50  0000 C CNN
F 2 "" H 4550 7550 50  0000 C CNN
F 3 "" H 4550 7550 50  0000 C CNN
	1    4550 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 7550 4550 7450
$EndSCHEMATC
