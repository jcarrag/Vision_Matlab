clear all; %Clear variable history; to avoid interference
clear history; %Clear command history; to avoid interference
clc; %Clear command window

KbName('UnifyKeyNames'); %Standardise keyboard configuration
Screen('Preference', 'SuppressAllWarnings', 1); %Suppress all warnings
Screen('Preference', 'SkipSyncTests', 1); %Speed up code by skipping tests
pause on; %Enable pausing
[SData] = GetData();
ListenChar(2); %Disable keyboard

%%This block opens a screen and presents the question to the display before
%%waiting for a key press to continue
[w ScreenRes] = Screen('OpenWindow', 0, 128, [0 0 800 800]); %Open screen
    %to 800x800 pixels
Width = ScreenRes(3); %Give Width the horizontal pixel count of the screen
Height = ScreenRes(4); %Give Height the vertical pixel count of the screen
Screen('PutImage', w, 255, [0 0 Width Height]); %Assign a background colour
%Display introduction and instructions to screen (line below)
DrawFormattedText(w, 'In the following two experiments\nyou will see two pairs of identical\nlength lines, your task is to \nindicate, using the arrow keys,\nwhich lines are further apart.\nPress return to start.', 'center', 'center', [0 0 255]);
Screen('Flip', w); %Present the assembled screen to display
KbWait([], 2); %Wait for user key press. The [], 2 is there to allow time 
    %between key presses

%%This block is setting all the necessary variables before they are used
RArrow = KbName('RightArrow'); %Number key for the right arrow key (39)
LArrow = KbName('LeftArrow'); %Number key for the left arrow key (37)
CorrectT1 = 0; %The correct answer counter for T1
IncorrectT1 = 0; %The incorrect answer counter for T1
CorrectT2 = 0; %The correct answer counter for T2
IncorrectT2 = 0; %The incorrect answer counter for T2
timeT2 = [ ];
timeT1 = [ ];
thresholdT1 = [ ];
thresholdT2 = [ ];

%%TRIAL 1%%

%%This block determines the space between the control lines in experiment 
%%T1; it is out of the loop as it must remain the same but still be random
TRndVarT1 = 0; %Initial creation of the variable
while TRndVarT1 <= 10; %Make sure the lines aren't 10 or less pixels apart
    TRndVarT1 = randi(50); %Give TRndVar an integer value of 1 to 50
end

%%This is the 'for' loop that in each iteration presents and records the
%%experiment 'T1'
for i = 1:10;
CRndVarT1 = LineGenDispT1(w, Width, Height, TRndVarT1); %Generate lines and
    %display on screen. Assign changing lines width to CRndVarT1

QuestionDisp(w, Width); %Display question
tic; %Start stopwatch

KbWait([], 2); %Wait for user key press. The [], 2 is there to allow time 
    %between key presses
[~, ~, keyCode, ~] = KbCheck(); %Record specific key press as keyCode
ButtonPress = KbName(KbName(keyCode)); %KbName is twice because keyCode is  
    %a 1x256 Boolean array, therefore we change it to a string and then to  
    %a managable digit

%%This is the if condition marking the given answer. If the subject presses
%%right then he made the judgment that the changing lines were wider apart.
%%Therefore their ButtonPress will be equal to RArrow. The second if
%%condition counts this as a correct/incorrect answer. Same visa-versa.
if ButtonPress == RArrow;
    if CRndVarT1 > TRndVarT1;
        CorrectT1 = CorrectT1 + 1;
    else IncorrectT1 = IncorrectT1 + 1;
        tmp = TRndVarT1 - CRndVarT1; %This is the threshold of perception
        thresholdT1 = [thresholdT1 tmp]; %This records the threshold at
        %which the subject was unable to correctly judge the distance
    end
elseif ButtonPress == LArrow;
    if TRndVarT1 > CRndVarT1;
        CorrectT1 = CorrectT1 + 1;
    else IncorrectT1 = IncorrectT1 + 1;
        tmp = CRndVarT1 - TRndVarT1; %This is the threshold of perception
        thresholdT1 = [thresholdT1 tmp];%This records the threshold at
        %which the subject was unable to correctly judge the distance
    end
else
    disp('Press an arrow key'); %In case something other than the left or 
    %right arrow keys are pressed
    IncorrectT1 = IncorrectT1 + 1;
end

tmp = toc; %Stop the stopwatch
timeT1 = [timeT1, tmp]; %Record to variable
end
avgtimeT1 = mean(timeT1);
NoTrialsT1 = CorrectT1 + IncorrectT1;
avgthreshT1 = mean(thresholdT1);
maxthreshT1 = max(thresholdT1);
minthreshT1 = min(thresholdT1);
DataT1 = {NoTrialsT1, CorrectT1, avgtimeT1, avgthreshT1, maxthreshT1, minthreshT1};

%%TRIAL 2%%

%Display introduction and instructions to screen (line below)
DrawFormattedText(w, 'This is now experiment 2,\nthe control lines will be varied.\nPress return to start.', 'center', 'center', [0 0 255]);
Screen('Flip', w); %Present the assembled screen to display
KbWait([], 2); %Wait for user key press. The [], 2 is there to allow time 
    %between key presses

%%This is the 'for' loop that in each iteration presents and records the
%%experiment 'T2'
for j = 1:10;
[CRndVarT2 TRndVarT2] = LineGenDispT2(w, Width, Height); %Generate lines 
    %and display on screen. Assign changing lines width to CRndVarT2

QuestionDisp(w, Width); %Display question
tic; %Start stopwatch

KbWait([], 2); %Wait for user key press. The [], 2 is there to allow time 
    %between key presses
[~, ~, keyCode, ~] = KbCheck(); %Record specific key press as keyCode
ButtonPress = KbName(KbName(keyCode)); %KbName is twice because keyCode is  
    %a 1x256 Boolean array, therefore we change it to a string and then to  
    %a managable digit

%%This is the if condition marking the given answer. If the subject presses
%%right then he made the judgment that the changing lines were wider apart.
%%Therefore their ButtonPress will be equal to RArrow. The second if
%%condition counts this as a correct/incorrect answer. Same visa-versa.
if ButtonPress == RArrow;
    if CRndVarT2 > TRndVarT2;
        CorrectT2 = CorrectT2 + 1;
    else IncorrectT2 = IncorrectT2 + 1;
        tmp = TRndVarT2 - CRndVarT2; %This is the threshold of perception
        thresholdT2 = [thresholdT2 tmp]; %This records the threshold at
        %which the subject was unable to correctly judge the distance
    end
elseif ButtonPress == LArrow;
    if TRndVarT2 > CRndVarT2;
        CorrectT2 = CorrectT2 + 1;
    else IncorrectT2 = IncorrectT2 + 1;
        tmp = CRndVarT2 - TRndVarT2; %This is the threshold of perception
        thresholdT2 = [thresholdT2 tmp]; %This records the threshold at
        %which the subject was unable to correctly judge the distance
    end
else
    disp('Press an arrow key');%In case something other than the left or 
    %right arrow keys are pressed
    IncorrectT2 = IncorrectT2 + 1;
end

tmp = toc; %Stop the stopwatch
timeT2 = [timeT2, tmp]; %Record to variable
end
avgtimeT2 = mean(timeT2);
NoTrialsT2 = CorrectT2 + IncorrectT2;
avgthreshT2 = mean(thresholdT2);
maxthreshT2 = max(thresholdT2);
minthreshT2 = min(thresholdT2);
DataT2 = {NoTrialsT2, CorrectT2, avgtimeT2, avgthreshT2, maxthreshT2, minthreshT2};


Screen('CloseAll'); %Close the display and screen

StoreData(SData, DataT1, DataT2);

pause off; %Disable the pause function
ListenChar(0); %Re-enable the keyboard