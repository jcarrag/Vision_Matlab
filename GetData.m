function [ SData ] = GetData()
%[ name age gender ] = GetData()
%   This function prompts the subject for details in the command window.
% The name and gender are returned in string format, age in number.

%%This block is requesting the subject's personal information
SData{1} = input('Please enter your name and press return: ', 's'); %Ask the
    %subject's name - returns a string
SData{2} = input('Please enter your age and press return: '); %Ask the subject's
    %age - returns a number
SData{3} = input('Please enter in either M or F as your gender and then press return: ', 's');
    %Ask the subject's gender - returns a string

clc; %Clear the window

disp('Thank you, the experiment will begin now'); %Explain to the subject
    %what will happen
pause(2); %Pause to let the subject read the previous print out
clc; %Clear the window

end

