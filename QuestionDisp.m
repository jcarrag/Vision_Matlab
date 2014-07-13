function QuestionDisp( w, Width )
%QuestionDisp([screen number=w][, screen width=Width])
%This function assembles a screen, and displays it to the already opened
%screen (MUST ALREADY HAVE SCREEN OPEN). The text displayed is proportional
%to the size of the screen (Width/40).

%%This block is the preparation for displaying the question in each
%%iteration
Screen('TextFont', w, 'Courier New'); %Assign text font
Screen('TextSize', w, round(Width/40)); %Assign text size
Screen('TextStyle', w, 3); %Assign text style

%Display question to screen (line below)
DrawFormattedText(w, 'Which of the two pairs\n of lines were further apart.\n Press the Left or Right Key respectively', 'center', 'center', [0 0 255]);

Screen('Flip', w); %Present the assembled screen to display

end