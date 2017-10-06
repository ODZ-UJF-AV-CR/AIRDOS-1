EESchema Schematic File Version 2
LIBS:MLAB_BATERY
LIBS:MLAB_CONNECTORS
LIBS:MLAB_D
LIBS:MLAB_DISPLAY
LIBS:MLAB_IO
LIBS:MLAB_Jumpers
LIBS:MLAB_SW
LIBS:MLAB_T
LIBS:MLAB_U
LIBS:74xgxx
LIBS:74xx
LIBS:ac-dc
LIBS:actel
LIBS:adc-dac
LIBS:Altera
LIBS:analog_devices
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:brooktre
LIBS:cmos4000
LIBS:cmos_ieee
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:dc-dc
LIBS:device
LIBS:digital-audio
LIBS:diode
LIBS:display
LIBS:dsp
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:intel
LIBS:interface
LIBS:ir
LIBS:Lattice
LIBS:linear
LIBS:logo
LIBS:maxim
LIBS:mechanical
LIBS:memory
LIBS:microchip_dspic33dsc
LIBS:microchip
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:microcontrollers
LIBS:mlab_header
LIBS:mlab_mechanical
LIBS:motor_drivers
LIBS:motorola
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:opto
LIBS:Oscillators
LIBS:philips
LIBS:powerint
LIBS:power
LIBS:Power_Management
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:siliconi
LIBS:stm32
LIBS:stm8
LIBS:supertex
LIBS:switches
LIBS:texas
LIBS:transf
LIBS:transistors
LIBS:ttl_ieee
LIBS:valves
LIBS:video
LIBS:Xicor
LIBS:xilinx
LIBS:Zilog
LIBS:CANDY01A-cache
EELAYER 26 0
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
L HOLE M1
U 1 1 57D299A2
P 10300 750
F 0 "M1" H 10300 850 60  0000 C CNN
F 1 "HOLE" H 10300 650 60  0000 C CNN
F 2 "Mlab_Mechanical:MountingHole_3mm" H 10300 750 60  0001 C CNN
F 3 "" H 10300 750 60  0000 C CNN
	1    10300 750 
	1    0    0    -1  
$EndComp
$Comp
L HOLE M3
U 1 1 57D2A075
P 10700 750
F 0 "M3" H 10700 850 60  0000 C CNN
F 1 "HOLE" H 10700 650 60  0000 C CNN
F 2 "Mlab_Mechanical:MountingHole_3mm" H 10700 750 60  0001 C CNN
F 3 "" H 10700 750 60  0000 C CNN
	1    10700 750 
	1    0    0    -1  
$EndComp
$Comp
L HOLE M2
U 1 1 57D2A387
P 10300 1150
F 0 "M2" H 10300 1250 60  0000 C CNN
F 1 "HOLE" H 10300 1050 60  0000 C CNN
F 2 "Mlab_Mechanical:MountingHole_3mm" H 10300 1150 60  0001 C CNN
F 3 "" H 10300 1150 60  0000 C CNN
	1    10300 1150
	1    0    0    -1  
$EndComp
$Comp
L HOLE M4
U 1 1 57D2A395
P 10700 1150
F 0 "M4" H 10700 1250 60  0000 C CNN
F 1 "HOLE" H 10700 1050 60  0000 C CNN
F 2 "Mlab_Mechanical:MountingHole_3mm" H 10700 1150 60  0001 C CNN
F 3 "" H 10700 1150 60  0000 C CNN
	1    10700 1150
	1    0    0    -1  
$EndComp
$Comp
L HEADER_2x04_PARALLEL J1
U 1 1 58B57579
P 1000 1050
F 0 "J1" H 919 769 60  0000 C CNN
F 1 "HEADER_2x04_PARALLEL" H 919 769 60  0001 C CNN
F 2 "Mlab_Pin_Headers:Straight_2x04" H -3600 -1800 60  0001 C CNN
F 3 "" H -3600 -1800 60  0000 C CNN
	1    1000 1050
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR5
U 1 1 58B57DF1
P 1700 1500
F 0 "#PWR5" H 1700 1250 50  0001 C CNN
F 1 "GND" H 1700 1350 50  0000 C CNN
F 2 "" H 1700 1500 50  0000 C CNN
F 3 "" H 1700 1500 50  0000 C CNN
	1    1700 1500
	1    0    0    -1  
$EndComp
$Comp
L DIODE-RESCUE-CANDY01A D1
U 1 1 58B5881C
P 1700 1250
F 0 "D1" H 1700 1350 40  0000 C CNN
F 1 "M4" H 1700 1150 40  0000 C CNN
F 2 "Mlab_D:Diode-SMA_Standard" H 1700 1250 60  0001 C CNN
F 3 "" H 1700 1250 60  0000 C CNN
	1    1700 1250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1250 900  1400 900 
Wire Wire Line
	1400 900  1400 1500
Wire Wire Line
	1250 1200 1400 1200
Connection ~ 1400 1200
Wire Wire Line
	1250 1000 1700 1000
Wire Wire Line
	1700 800  1700 1050
Wire Wire Line
	1250 1100 1300 1100
Wire Wire Line
	1300 1100 1300 1000
Connection ~ 1300 1000
Connection ~ 1700 1000
$Comp
L GND #PWR3
U 1 1 58B59218
P 1400 1500
F 0 "#PWR3" H 1400 1250 50  0001 C CNN
F 1 "GND" H 1400 1350 50  0000 C CNN
F 2 "" H 1400 1500 50  0000 C CNN
F 3 "" H 1400 1500 50  0000 C CNN
	1    1400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1450 1700 1500
$Comp
L OPA2340 U1
U 1 1 58E364B6
P 3450 3400
F 0 "U1" H 3550 3600 50  0000 L CNN
F 1 "OPA2314" H 3450 3150 50  0000 L CNN
F 2 "" H 1200 200 50  0001 C CNN
F 3 "" H 1300 100 50  0001 C CNN
	1    3450 3400
	1    0    0    1   
$EndComp
$Comp
L Battery_Cell BT1
U 1 1 58E36F6C
P 2200 3550
F 0 "BT1" H 2318 3646 50  0000 L CNN
F 1 "3V" H 2318 3555 50  0000 L CNN
F 2 "" V 700 560 50  0001 C CNN
F 3 "" V 700 560 50  0001 C CNN
	1    2200 3550
	1    0    0    -1  
$EndComp
$Comp
L D_Photo D2
U 1 1 58E3718C
P 2500 3300
F 0 "D2" H 2450 3595 50  0000 C CNN
F 1 "PIN - S2744-09" H 2450 3504 50  0000 C CNN
F 2 "" H 750 350 50  0001 C CNN
F 3 "" H 750 350 50  0001 C CNN
	1    2500 3300
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 58E375CD
P 3000 3750
F 0 "R3" H 3070 3796 50  0000 L CNN
F 1 "0" H 3070 3705 50  0000 L CNN
F 2 "" V 780 250 50  0001 C CNN
F 3 "" H 850 250 50  0001 C CNN
	1    3000 3750
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58E37883
P 3000 4150
F 0 "C4" H 3115 4196 50  0000 L CNN
F 1 "4u7" H 3115 4105 50  0000 L CNN
F 2 "" H 588 350 50  0001 C CNN
F 3 "" H 550 500 50  0001 C CNN
	1    3000 4150
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 58E3893A
P 3400 2600
F 0 "C5" V 3250 2600 50  0000 C CNN
F 1 "1 pF" V 3550 2600 50  0000 C CNN
F 2 "" H 988 -1200 50  0001 C CNN
F 3 "" H 950 -1050 50  0001 C CNN
	1    3400 2600
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 58E391BF
P 3400 2300
F 0 "R4" V 3300 2300 50  0000 C CNN
F 1 "10M" V 3400 2300 50  0000 C CNN
F 2 "" V 1180 -1200 50  0001 C CNN
F 3 "" H 1250 -1200 50  0001 C CNN
	1    3400 2300
	0    1    1    0   
$EndComp
$Comp
L OPA2340 U1
U 2 1 58E3AD53
P 6000 3500
F 0 "U1" H 6100 3700 50  0000 L CNN
F 1 "OPA2314" H 6050 3250 50  0000 L CNN
F 2 "" H 3750 300 50  0001 C CNN
F 3 "" H 3850 200 50  0001 C CNN
	2    6000 3500
	1    0    0    1   
$EndComp
$Comp
L R R7
U 1 1 58E3BCF2
P 5600 3850
F 0 "R7" V 5500 3850 50  0000 C CNN
F 1 "0" V 5600 3850 50  0000 C CNN
F 2 "" V 1330 950 50  0001 C CNN
F 3 "" H 1400 950 50  0001 C CNN
	1    5600 3850
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 58E3BE3A
P 6100 2650
F 0 "R8" V 6000 2650 50  0000 C CNN
F 1 "22k" V 6100 2650 50  0000 C CNN
F 2 "" V 1830 -250 50  0001 C CNN
F 3 "" H 1900 -250 50  0001 C CNN
	1    6100 2650
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 58E3C0E9
P 6100 2300
F 0 "C8" V 5950 2300 50  0000 C CNN
F 1 "2n2" V 6250 2300 50  0000 C CNN
F 2 "" H 3688 -1500 50  0001 C CNN
F 3 "" H 3650 -1350 50  0001 C CNN
	1    6100 2300
	0    1    1    0   
$EndComp
$Comp
L C C7
U 1 1 58E3C16D
P 5600 4250
F 0 "C7" V 5450 4250 50  0000 C CNN
F 1 "4uF" V 5750 4250 50  0000 C CNN
F 2 "" H 3188 450 50  0001 C CNN
F 3 "" H 3150 600 50  0001 C CNN
	1    5600 4250
	1    0    0    -1  
$EndComp
$Comp
L OPA2340 U2
U 1 1 58E3C1FE
P 7250 3400
F 0 "U2" H 7350 3600 50  0000 L CNN
F 1 "OPA2314" H 7300 3150 50  0000 L CNN
F 2 "" H 5000 200 50  0001 C CNN
F 3 "" H 5100 100 50  0001 C CNN
	1    7250 3400
	1    0    0    1   
$EndComp
$Comp
L R R9
U 1 1 58E3C2A4
P 7250 2650
F 0 "R9" V 7150 2650 50  0000 C CNN
F 1 "1k" V 7250 2650 50  0000 C CNN
F 2 "" V 2980 -250 50  0001 C CNN
F 3 "" H 3050 -250 50  0001 C CNN
	1    7250 2650
	0    1    1    0   
$EndComp
$Comp
L D D4
U 1 1 58E3C32A
P 7800 3400
F 0 "D4" H 7800 3184 50  0000 C CNN
F 1 "1N4148" H 7800 3275 50  0000 C CNN
F 2 "" H 2050 1800 50  0001 C CNN
F 3 "" H 2050 1800 50  0001 C CNN
	1    7800 3400
	-1   0    0    1   
$EndComp
$Comp
L R R10
U 1 1 58E3C574
P 8200 3400
F 0 "R10" V 8100 3400 50  0000 C CNN
F 1 "100" V 8200 3400 50  0000 C CNN
F 2 "" V 3930 500 50  0001 C CNN
F 3 "" H 4000 500 50  0001 C CNN
	1    8200 3400
	0    1    1    0   
$EndComp
$Comp
L C C9
U 1 1 58E3C609
P 8450 3600
F 0 "C9" V 8300 3600 50  0000 C CNN
F 1 "1nF" V 8600 3600 50  0000 C CNN
F 2 "" H 6038 -200 50  0001 C CNN
F 3 "" H 6000 -50 50  0001 C CNN
	1    8450 3600
	-1   0    0    1   
$EndComp
$Comp
L OPA2340 U2
U 2 1 58E3C87D
P 9300 3300
F 0 "U2" H 9400 3500 50  0000 L CNN
F 1 "OPA2314" H 9350 3050 50  0000 L CNN
F 2 "" H 7050 100 50  0001 C CNN
F 3 "" H 7150 0   50  0001 C CNN
	2    9300 3300
	1    0    0    1   
$EndComp
Wire Wire Line
	2200 3350 2200 3300
Wire Wire Line
	2200 3300 2300 3300
Wire Wire Line
	2600 3300 3150 3300
Wire Wire Line
	3150 3500 3000 3500
Wire Wire Line
	3000 3500 3000 3600
$Comp
L GND #PWR9
U 1 1 58E3D418
P 3000 4400
F 0 "#PWR9" H 200 350 50  0001 C CNN
F 1 "GND" H 3005 4227 50  0000 C CNN
F 2 "" H 200 600 50  0001 C CNN
F 3 "" H 200 600 50  0001 C CNN
	1    3000 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3900 3000 4000
Wire Wire Line
	3000 4400 3000 4300
Wire Wire Line
	3000 3950 2900 3950
Connection ~ 3000 3950
Connection ~ 3050 3300
Wire Wire Line
	3250 2300 3050 2300
Connection ~ 3800 3400
Wire Wire Line
	3550 2300 3800 2300
Wire Wire Line
	5300 3400 5700 3400
$Comp
L GND #PWR12
U 1 1 58E3F55C
P 5600 4500
F 0 "#PWR12" H 2800 450 50  0001 C CNN
F 1 "GND" H 5605 4327 50  0000 C CNN
F 2 "" H 2800 700 50  0001 C CNN
F 3 "" H 2800 700 50  0001 C CNN
	1    5600 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3700 5600 3600
Wire Wire Line
	5600 3600 5700 3600
Wire Wire Line
	5600 4000 5600 4100
Wire Wire Line
	5600 4500 5600 4400
Wire Wire Line
	5600 4050 5550 4050
Connection ~ 5600 4050
Wire Wire Line
	5650 2300 5650 3400
Wire Wire Line
	3750 3400 3900 3400
Connection ~ 5650 3400
Wire Wire Line
	6300 3500 6950 3500
Wire Wire Line
	6550 2300 6550 3500
Connection ~ 5650 2650
Connection ~ 6550 2650
Wire Wire Line
	5650 2650 5950 2650
Wire Wire Line
	6250 2650 6550 2650
Wire Wire Line
	6250 2300 6550 2300
Wire Wire Line
	5650 2300 5950 2300
Connection ~ 6550 3500
Wire Wire Line
	7100 2650 6850 2650
Wire Wire Line
	6850 2650 6850 3300
Wire Wire Line
	6850 3300 6950 3300
Wire Wire Line
	7400 2650 8000 2650
Wire Wire Line
	7550 3400 7650 3400
Wire Wire Line
	8000 2650 8000 3400
Wire Wire Line
	7950 3400 8050 3400
Connection ~ 8000 3400
Wire Wire Line
	8450 3400 8450 3450
Connection ~ 8450 3400
Wire Wire Line
	8950 3200 8950 2650
Wire Wire Line
	8950 2650 9800 2650
Wire Wire Line
	9800 2650 9800 3300
Wire Wire Line
	9600 3300 10000 3300
Wire Wire Line
	8950 3200 9000 3200
Connection ~ 9800 3300
$Comp
L Q_NMOS_GSD Q1
U 1 1 58E450F2
P 8900 4400
F 0 "Q1" H 9106 4446 50  0000 L CNN
F 1 "BSS138" H 9106 4355 50  0000 L CNN
F 2 "" H 1100 1100 50  0001 C CNN
F 3 "" H 900 1000 50  0001 C CNN
	1    8900 4400
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR18
U 1 1 58E457EC
P 8800 4700
F 0 "#PWR18" H 8850 4750 50  0001 C CNN
F 1 "GND" H 8805 4527 50  0000 C CNN
F 2 "" H 1250 1100 50  0001 C CNN
F 3 "" H 1250 1100 50  0001 C CNN
	1    8800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4600 8800 4700
$Comp
L R R12
U 1 1 58E46236
P 9300 4400
F 0 "R12" V 9200 4400 50  0000 C CNN
F 1 "10k" V 9300 4400 50  0000 C CNN
F 2 "" V 5030 1500 50  0001 C CNN
F 3 "" H 5100 1500 50  0001 C CNN
	1    9300 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 4400 9150 4400
Wire Wire Line
	9400 4400 10000 4400
$Comp
L GND #PWR17
U 1 1 58E4A519
P 8450 3800
F 0 "#PWR17" H 8500 3850 50  0001 C CNN
F 1 "GND" H 8455 3627 50  0000 C CNN
F 2 "" H 900 200 50  0001 C CNN
F 3 "" H 900 200 50  0001 C CNN
	1    8450 3800
	1    0    0    -1  
$EndComp
Text Label 10000 3300 0    60   ~ 0
PEAK
Text Label 10000 4400 0    60   ~ 0
RESET
Wire Wire Line
	8450 3800 8450 3750
Wire Wire Line
	2200 3650 2200 3750
Wire Wire Line
	2200 3750 2300 3750
Text Label 2300 3750 0    60   ~ 0
REF
Text Label 2900 3950 2    60   ~ 0
REF
Text Label 5550 4050 2    60   ~ 0
REF
$Comp
L GND #PWR11
U 1 1 58E4E797
P 3350 3750
F 0 "#PWR11" H 3400 3800 50  0001 C CNN
F 1 "GND" H 3355 3577 50  0000 C CNN
F 2 "" H -4200 150 50  0001 C CNN
F 3 "" H -4200 150 50  0001 C CNN
	1    3350 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR14
U 1 1 58E4EC70
P 5900 3850
F 0 "#PWR14" H 5950 3900 50  0001 C CNN
F 1 "GND" H 5905 3677 50  0000 C CNN
F 2 "" H -1650 250 50  0001 C CNN
F 3 "" H -1650 250 50  0001 C CNN
	1    5900 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR16
U 1 1 58E4F059
P 7150 3750
F 0 "#PWR16" H 7200 3800 50  0001 C CNN
F 1 "GND" H 7155 3577 50  0000 C CNN
F 2 "" H -400 150 50  0001 C CNN
F 3 "" H -400 150 50  0001 C CNN
	1    7150 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR20
U 1 1 58E4F2DA
P 9200 3650
F 0 "#PWR20" H 9250 3700 50  0001 C CNN
F 1 "GND" H 9205 3477 50  0000 C CNN
F 2 "" H 1650 50  50  0001 C CNN
F 3 "" H 1650 50  50  0001 C CNN
	1    9200 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3650 9200 3600
Wire Wire Line
	7150 3750 7150 3700
Wire Wire Line
	3350 3750 3350 3700
$Comp
L +3.3V #PWR10
U 1 1 58E508F5
P 3350 3050
F 0 "#PWR10" H -1250 -1150 50  0001 C CNN
F 1 "+3.3V" H 3365 3223 50  0000 C CNN
F 2 "" H -1250 -1000 50  0001 C CNN
F 3 "" H -1250 -1000 50  0001 C CNN
	1    3350 3050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR13
U 1 1 58E50CA9
P 5900 3150
F 0 "#PWR13" H 1300 -1050 50  0001 C CNN
F 1 "+3.3V" H 5915 3323 50  0000 C CNN
F 2 "" H 1300 -900 50  0001 C CNN
F 3 "" H 1300 -900 50  0001 C CNN
	1    5900 3150
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR15
U 1 1 58E50EEE
P 7150 3050
F 0 "#PWR15" H 2550 -1150 50  0001 C CNN
F 1 "+3.3V" H 7165 3223 50  0000 C CNN
F 2 "" H 2550 -1000 50  0001 C CNN
F 3 "" H 2550 -1000 50  0001 C CNN
	1    7150 3050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR19
U 1 1 58E512B9
P 9200 2950
F 0 "#PWR19" H 4600 -1250 50  0001 C CNN
F 1 "+3.3V" H 9215 3123 50  0000 C CNN
F 2 "" H 4600 -1100 50  0001 C CNN
F 3 "" H 4600 -1100 50  0001 C CNN
	1    9200 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3000 9200 2950
Wire Wire Line
	7150 3100 7150 3050
Wire Wire Line
	5900 3200 5900 3150
Wire Wire Line
	3350 3100 3350 3050
$Comp
L CP C1
U 1 1 58E53D28
P 1100 6600
F 0 "C1" H 1218 6646 50  0000 L CNN
F 1 "47uF" H 1218 6555 50  0000 L CNN
F 2 "" H -2962 1150 50  0001 C CNN
F 3 "" H -3000 1300 50  0001 C CNN
	1    1100 6600
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 58E53E07
P 1800 6600
F 0 "C2" H 1918 6646 50  0000 L CNN
F 1 "47uF" H 1918 6555 50  0000 L CNN
F 2 "" H -2262 1150 50  0001 C CNN
F 3 "" H -2300 1300 50  0001 C CNN
	1    1800 6600
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 58E5487D
P 2350 6600
F 0 "C3" H 2465 6646 50  0000 L CNN
F 1 "100nF" H 2465 6555 50  0000 L CNN
F 2 "" H -62 2800 50  0001 C CNN
F 3 "" H -100 2950 50  0001 C CNN
	1    2350 6600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR1
U 1 1 58E5691E
P 700 6250
F 0 "#PWR1" H -3900 2050 50  0001 C CNN
F 1 "+3.3V" H 715 6423 50  0000 C CNN
F 2 "" H -3900 2200 50  0001 C CNN
F 3 "" H -3900 2200 50  0001 C CNN
	1    700  6250
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58E57379
P 1500 6400
F 0 "R1" V 1400 6400 50  0000 C CNN
F 1 "10" V 1500 6400 50  0000 C CNN
F 2 "" V -720 2900 50  0001 C CNN
F 3 "" H -650 2900 50  0001 C CNN
	1    1500 6400
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 58E58009
P 2900 6600
F 0 "R2" V 2800 6600 50  0000 C CNN
F 1 "4k7" V 2900 6600 50  0000 C CNN
F 2 "" V 680 3100 50  0001 C CNN
F 3 "" H 750 3100 50  0001 C CNN
	1    2900 6600
	-1   0    0    1   
$EndComp
$Comp
L REFERENCE D3
U 1 1 58E58A0A
P 2900 7050
F 0 "D3" V 2938 6971 50  0000 R CNN
F 1 "LM4041AIM3-1.2/NOP" V 2854 6971 40  0000 R CNN
F 2 "" H -2500 950 60  0000 C CNN
F 3 "" H -2500 950 60  0000 C CNN
	1    2900 7050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR8
U 1 1 58E5971D
P 2900 7350
F 0 "#PWR8" H 100 3300 50  0001 C CNN
F 1 "GND" H 2905 7177 50  0000 C CNN
F 2 "" H 100 3550 50  0001 C CNN
F 3 "" H 100 3550 50  0001 C CNN
	1    2900 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  6250 700  6400
Wire Wire Line
	700  6400 1350 6400
Wire Wire Line
	1100 6450 1100 6400
Connection ~ 1100 6400
Wire Wire Line
	1650 6400 2900 6400
Wire Wire Line
	2350 6400 2350 6450
Wire Wire Line
	1800 6450 1800 6400
Connection ~ 1800 6400
Wire Wire Line
	2900 6400 2900 6450
Connection ~ 2350 6400
Wire Wire Line
	2900 6750 2900 6850
Wire Wire Line
	2700 6800 2700 7050
Wire Wire Line
	2700 6800 3050 6800
Connection ~ 2900 6800
Wire Wire Line
	2900 7250 2900 7350
$Comp
L GND #PWR2
U 1 1 58E5AF85
P 1100 6800
F 0 "#PWR2" H -1700 2750 50  0001 C CNN
F 1 "GND" H 1105 6627 50  0000 C CNN
F 2 "" H -1700 3000 50  0001 C CNN
F 3 "" H -1700 3000 50  0001 C CNN
	1    1100 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 58E5B2CC
P 1800 6800
F 0 "#PWR6" H -1000 2750 50  0001 C CNN
F 1 "GND" H 1805 6627 50  0000 C CNN
F 2 "" H -1000 3000 50  0001 C CNN
F 3 "" H -1000 3000 50  0001 C CNN
	1    1800 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 58E5B343
P 2350 6800
F 0 "#PWR7" H -450 2750 50  0001 C CNN
F 1 "GND" H 2355 6627 50  0000 C CNN
F 2 "" H -450 3000 50  0001 C CNN
F 3 "" H -450 3000 50  0001 C CNN
	1    2350 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6800 2350 6750
Wire Wire Line
	1800 6800 1800 6750
Wire Wire Line
	1100 6800 1100 6750
Text Label 3050 6800 0    60   ~ 0
REF
$Comp
L +3.3V #PWR4
U 1 1 58E5DFFF
P 1700 800
F 0 "#PWR4" H -2900 -3400 50  0001 C CNN
F 1 "+3.3V" H 1715 973 50  0000 C CNN
F 2 "" H -2900 -3250 50  0001 C CNN
F 3 "" H -2900 -3250 50  0001 C CNN
	1    1700 800 
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 59ADCC84
P 4050 3400
F 0 "C6" V 3900 3400 50  0000 C CNN
F 1 "1 uF" V 4200 3400 50  0000 C CNN
F 2 "" H 1638 -400 50  0001 C CNN
F 3 "" H 1600 -250 50  0001 C CNN
	1    4050 3400
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 59ADDB73
P 4700 3850
F 0 "R5" V 4600 3850 50  0000 C CNN
F 1 "3k3" V 4700 3850 50  0000 C CNN
F 2 "" V 430 950 50  0001 C CNN
F 3 "" H 500 950 50  0001 C CNN
	1    4700 3850
	-1   0    0    1   
$EndComp
Text Label 4650 4200 2    60   ~ 0
REF
$Comp
L R R11
U 1 1 59ADE06B
P 8800 3850
F 0 "R11" V 8593 3850 50  0000 C CNN
F 1 "51" V 8684 3850 50  0000 C CNN
F 2 "" V 4530 950 50  0001 C CNN
F 3 "" H 4600 950 50  0001 C CNN
	1    8800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4200 8800 4000
Wire Wire Line
	8350 3400 9000 3400
Wire Wire Line
	8800 3700 8800 3400
Connection ~ 8800 3400
Wire Wire Line
	3050 2300 3050 3300
Wire Wire Line
	3250 2600 3050 2600
Connection ~ 3050 2600
Wire Wire Line
	3800 2300 3800 3400
Wire Wire Line
	3550 2600 3800 2600
Connection ~ 3800 2600
Wire Wire Line
	4700 4000 4700 4150
Wire Wire Line
	4700 4150 4650 4150
Wire Wire Line
	4700 3700 4700 3400
Connection ~ 4700 3400
$Comp
L R R6
U 1 1 59D66B3F
P 5150 3400
F 0 "R6" V 5050 3400 50  0000 C CNN
F 1 "1k" V 5150 3400 50  0000 C CNN
F 2 "" V 880 500 50  0001 C CNN
F 3 "" H 950 500 50  0001 C CNN
	1    5150 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 3400 5000 3400
Wire Wire Line
	5900 3850 5900 3800
$EndSCHEMATC
