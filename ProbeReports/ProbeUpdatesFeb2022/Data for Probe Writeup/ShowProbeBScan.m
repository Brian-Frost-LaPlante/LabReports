willSave = input("Would you like to save the B-Scan? (y/n): ",'s');
if (willSave == 'y')||(willSave == 'Y')
    runNum = input("Input the run number: ");
    filename = ['Bscan_e1r',num2str(runNum),'_probe'];
end
WorA = input("Water or Air? (W/A): ",'s');
if (WorA == 'w' || WorA == 'W')
    pxsize = 2.7;
else
    pxsize = 3.51;
end
FOV = input("FOV in um: ");
keepGoing=1;
while keepGoing
    im = imread('C:\Users\FolwerLab\Documents\MatLab OCT Computer\Scanning Probe SDOCT Files\BScanUpdate.png');
    F = figure;
    ImFilt = medfilt2(rgb2gray(im),[3,3]);
    % ADD CONTRAST ENHANCEMENT
    imagesc(linspace(0,FOV,floor(FOV/0.04)),linspace(0,pxsize*1024,1024),ImFilt)
    pbaspect([FOV,2.7*1024,1])
    colormap('gray')
    hold on
    plot([FOV/2,FOV/2],[0,pxsize*1024],'r-')
    hold off
    xlabel('scanning axis (microns)');
    ylabel ('depth (microns)');
    title('Bscan');
    
    if (willSave == 'y')||(willSave == 'Y')
        save(filename, 'im');
        savefig(F,filename);
    end
    
    choice = input("Type 0 to stop, enter to perform again: ");
    if choice == 0
        keepGoing = 0;
    else
        close(F)
    end
end