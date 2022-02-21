1-31-2022 test was with D6 using PIEZO at 1, 3 and 5 V.
2022-2-17 is in a dead GP cochlea. Run 13 B- vs A-Scan shows that SNR in B/A-Scan are not so different, despite looking so.
Screenshots: quality of life changes
Changed ThorImage to scan at Medium high sensitivity (28kHz)

In SpectralRadar SDK, function is:
		// We first set the sampling rate of the device to 28 kHz
		setDevicePreset(Dev, 0, Probe, Proc, 3);
Index 0 is the index of the scan rate parameter. the second index (here 3) controls the speed. They are in the order listed in ThorImage.
0 = Default -- set to 76 kHz
1 = 146 kHz
2 = 76 kHz (again, strange but it is listed twice in ThorImage too because the 0 index default can be changed in config files)
3 = 28 kHz (used here)
4 = 10 kHz

I suggest nobody ever uses index zero, as it is not fixed. Indeces 1-4 are safer.

Discuss "Fake Background Method"

Discuss potentiometer values for changing offset voltages.