function StoreData( SData, DataT1, DataT2 )
%StoreData([Stored subject data=SData] [, Data for trial 1=DataT1] 
%[, Data for trial 2=DataT2] [, mean threshold=avgthresh])
%  This function takes as input the variable SData and write it to an excel
    %file.

%%This block is the preparation of various titles for excel formatting
Name = SData{1}; %Take subject's name
DFile = sprintf('%s_Excel_File', Name); %Specifically name the excel file
VTitles = {'Name' 'Age' 'Gender' '' 'No. of trials' 'No. correct' 'Mean time to answer (secs)' 'Mean Just Noticeable Difference (pixels)' 'Maximum JND (pixels)' 'Minumum JND(pixels)'};
    %Subject titles
HTitles = {'Trial 1' 'Trial 2'}; %Trial headings

%%This block is the creation and writing to, an excel file
xlswrite(DFile, VTitles', 1, 'A1'); %Write the vertical headings to excel
xlswrite(DFile, SData', 1, 'B1'); %Write personal data to excel
xlswrite(DFile, HTitles, 1, 'B4'); %Write column heading's to excel
xlswrite(DFile, DataT1', 1, 'B5'); %Write Trial 2's data to excel
xlswrite(DFile, DataT2', 1, 'C5'); %Write Trial 2's data to excel

end