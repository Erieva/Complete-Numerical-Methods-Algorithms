%Homework 5: Question 1: Machine Epsilon
%Created On: 9/15/19
%Created By: Katie Evans
%Description: The machine epsilon of a computer is essentially the smallest
%number than when added to one gives a number greater than one. Using the
%algorithm:
%   Step 1: set e = 1
%   Step 2: If e+1 os less than or equal to 1, go to step 5. If not, go to
%   step 3.
%   Step 3: e = e/2
%   Step 4: return to step 2
%   Step 5: e= e*2
%Write a M-file to determine the machine epsilon. 

clc;
clear;

%Determine the Machine epsilon by following the steps provided in question
e = 1; %step 1
while true
    if 1+e <= 1 %Step 2
        break
    else        %Step 2 (continued)
        e=e/2;  %Step 3
    end
   %The while break loop creates step 4 until the if statement becomes true
end
  e = e*2;  %Step 5
fprintf(' The Machine Epsilon is %e. \n', e) %final answer
