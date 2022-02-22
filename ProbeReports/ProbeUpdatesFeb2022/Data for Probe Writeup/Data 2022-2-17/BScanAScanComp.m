load("Bscan_e1r13_probe.mat","im");
load("R13AvDepth.mat","Averaged_depth");
IG = im2gray(im);

figure; subplot(3,3,[1,4,7]);

imagesc(linspace(0,100,size(IG,2)), (1:300)*2.7, IG(1:300,:)); colormap(gray);
pbaspect([100,300*2.7,1]);
xlabel('y (\mum)')
ylabel('z (\mum)')
hold on; plot([50 50],[0,300*2.7],'r','LineWidth',2);
title('Zoomed B-Scan in ex vivo guinea pig cochlea')

subplot(3,3,[2,5,8]);
plot(10*log10(double(IG(1:300,1875))),(1:300)*2.7);
xlim([10*log10(80),10*log10(256)]);
xlabel('Pixel Intensity (dB)')
ylabel('z (\mum)')
set(gca,'YDir','reverse');
title('Center A-Scan in B-Scan to the left')

subplot(3,3,[3,6,9]);
plot(10*log10(Averaged_depth(1:300)),(1:300)*2.7);
xlim([16,35]);
hold on
scatter(22.6,369.9,'r')
set(gca,'YDir','reverse');
xlabel('Pixel Intensity (dB)')
ylabel('z (\mum)')
set(gca,'YDir','reverse');
title('Averaged A-Scan in M-Scan taken at the center')
