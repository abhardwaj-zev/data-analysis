function dataOut = fileStitchProtocol (filenameIn)
    datasets = size(filenameIn,2);

    i=1;
    str = filenameIn(i);
    dataOut = readtable(str);                

    for i=2:datasets
        str = filenameIn(i);
        dataDum = readtable(str);
        dataDum{:,1} = dataDum{:,1} + dataOut{end,1};          % timestamp addition from last dataset
        dataOut = [dataOut; dataDum];
    end
    
end