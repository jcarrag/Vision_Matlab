function [CRndVarT2, TRndVarT2] = LineGenDispT2( w, Width, Height )
%[CRndVarT2] = LineGenDispT2( [screen number=w] [,screen width=Width]
%[,screen height=Height] [,control line distance=TRndVarT2])
%Assign the lines' coordinates. Returns [ XTL, XTR, XCL, XCR ].
%XTL/XTR are the x-coordinates of each fixed line, they can be up to 100
%apart (each a max of 50 from the center line, 'XBaseTrue').
%This is also the case for the second, random, pair of lines, XCL/XCR.
%It returns CRndVarT2 for comparison of answers.

%%TRIAL 2%%

XBaseTrue = Width/3; %Get the center line for the control lines
XBaseChange = (Width/3)*2; %Get the center line for the changing lines

%%This block determines the space between the control lines in experiment 
%%T2
TRndVarT2 = 0; %Initial creation of the variable
while TRndVarT2 <= 10; %Make sure the lines aren't 10 or less pixels apart
    TRndVarT2 = randi(50); %Give CRndVar an integer value of 1 to 50
end

%%Control lines' coordinates
XTL = XBaseTrue - TRndVarT2; %Left pair, left line's deviation from center
XTR = XBaseTrue + TRndVarT2; %Left pair, right line's deviation from center

CRndVarT2 = 0; %Initial creation of the variable
while CRndVarT2 <= 10 || CRndVarT2 == TRndVarT2; %Make sure the lines 
    %aren't 10 or less pixels apart, or equal to the control lines
    CRndVarT2 = randi(50); %Give CRndVar an integer value of 1 to 50
end

%%Changing lines' coordinates
XCL = XBaseChange - CRndVarT2; %Right pair, left line's deviation from 
    %center
XCR = XBaseChange + CRndVarT2; %Right pair, right line's deviation from 
    %center

Screen('PutImage', w, 255, [0 0 Width Height]); %Assign a background colour

Screen('Drawline', w, 0, XTL, 200, XTL, 400, 5); %Draw the line to screen
Screen('Drawline', w, 0, XTR, 200, XTR, 400, 5); %Draw the line to screen

Screen('Drawline', w, 0, XCL, 200, XCL, 400, 5); %Draw the line to screen
Screen('Drawline', w, 0, XCR, 200, XCR, 400, 5); %Draw the line to screen

Screen('Flip', w); %Present the assembled screen to display
pause(1); %Pause for 1 second for subject to see both pairs of lines before
    %making a judgment

end