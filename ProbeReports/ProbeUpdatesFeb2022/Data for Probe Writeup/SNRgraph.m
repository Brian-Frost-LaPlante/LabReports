load("Data 1-31-2022.mat")
figure;

ff = linspace(fs/(2*52224),fs/8,52224/4);

subplot(3,2,1);
semilogy(ff,TelA1(1:52224/4));
xlabel("Frequency (Hz)")
ylabel("Displacement (nm)")
title("Telesto Bulk Optics in Air, Piezo at 1V")

subplot(3,2,3);
semilogy(ff,D6airA1(1:52224/4));
xlabel("Frequency (Hz)")
ylabel("Displacement (nm)")
title("Probe in Air, Piezo at 1V")

subplot(3,2,5);
semilogy(ff,D6waterA1(1:52224/4));
xlabel("Frequency (Hz)")
ylabel("Displacement (nm)")
title("Probe in Water, Piezo at 1V")

subplot(3,2,2);
small_f = (ff>6400)&(ff<6600);
smaller_f = ((ff<6500)|(ff>6505))&(ff>6400)&(ff<6600);
NTel = mean(TelA1(smaller_f));
plot(ff(small_f),10*log10(TelA1(small_f)/NTel));
ylabel("Displacement re Noise (dB)");
xlabel("Frequency (Hz)");
title(["SNR of Telesto in air: " num2str(max(10*log10(TelA1(small_f)/NTel)))]);

subplot(3,2,4);
NPA = mean(D6airA1(smaller_f));
plot(ff(small_f),10*log10(D6airA1(small_f)/NPA));
ylabel("Displacement re Noise (dB)");
xlabel("Frequency (Hz)");
title(["SNR of probe in air: " num2str(max(10*log10(D6airA1(small_f)/NPA)))]);

subplot(3,2,6);
small_f = (ff>6400)&(ff<6600);
smaller_f = ((ff<6500)|(ff>6505))&(ff>6400)&(ff<6600);
NPW = mean(D6waterA1(smaller_f));
plot(ff(small_f),10*log10(D6waterA1(small_f)/NPW));
ylabel("Displacement re Noise (dB)");
xlabel("Frequency (Hz)");
title(["SNR of Telesto in water: " num2str(max(10*log10(D6waterA1(small_f)/NPW)))]);
