%% incomplete code.. doesn't work
function dataOut = fileStitchProtocolMatFile (matFilenameIn)
    datasets = size(matFilenameIn,2);

    i=1;
    str = matFilenameIn(i);
    dumStruc = load (str);
    dataOut = dumStruc               

    for i=2:datasets
        str = filenameIn(i);
        dataDum = readtable(str);
        dataDum{:,1} = dataDum{:,1} + dataOut{end,1};          % timestamp addition from last dataset
        dataOut = [dataOut; dataDum];
    end
    
end