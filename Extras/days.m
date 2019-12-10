function [nd] = days(mo,da,leap)
%days.m
%Created On:9/1/0/19
%Created By: Katie Evans
%Last Motified: 9/10/19
%Description: This function determnes the elapsed days in a year and
%requires an input of the month, day and whehter it is a leap year or not.
%Inputs:
%   mo - the month (1-12)
%   da - the day (1-31)
%   leap - leap year (0 for non-leap year and 1 for leap year)
%Outputs:
%   nd- elapsed days in a year

if da<1 || da>31 %day error
    error('Please put an appropriate day date (1-31).')
end
if mo <1 || mo > 12 % month error
    error(' Please enter an appropriate number 1-12 to correspond with the correct month.') 
end

if leap >1 || leap < 0 % leap year error 
    error('Please input a 0 for non-leap year or 1 for leap year.')
elseif leap ==1 %leap year
    if mo ==1 %Jan
        nd=da;
    elseif mo==2 %Feb
        if da>29
            error('Please pick appropriate value of days(1-29)in February during a leap year.')
        else
            nd=31+da;
        end
    elseif mo==3 %March
        nd=31+29+da;
    elseif mo==4 %April
        nd=31+29+31+da;
    elseif mo==5 %May
        nd=31+29+31+30+da;
    elseif mo==6 %June
        nd=31+29+31+30+31+da;
    elseif mo==7 %July
        nd=31+29+31+30+31+30+da;
    elseif mo==8 %Aug
        nd=31+29+31+30+31+30+31+da;
    elseif mo==9 %Sept
        nd=31+29+31+30+31+30+31+31+da;
    elseif mo==10 %Oct
        nd=31+29+31+30+31+30+31+31+30+da;
    elseif mo==11 %November
        nd=31+29+31+30+31+30+31+31+30+31+da;
    elseif mo==12 %December 
        nd=31+29+31+30+31+30+31+31+30+31+30+da;
    end
else 
    if mo ==1
        nd=da;
    elseif mo==2 
        if da>28
            error('Please pick appropriate value of days(1-28)in February.')
        else
            nd=31+da;
        end
    elseif mo==3
        nd=31+28+da;
    elseif mo==4
        nd=31+28+31+da;
    elseif mo==5
        nd=31+28+31+30+da;
    elseif mo==6
        nd=31+28+31+30+31+da;
    elseif mo==7
        nd=31+28+31+30+31+30+da;
    elseif mo==8
        nd=31+28+31+30+31+30+31+da;
    elseif mo==9
        nd=31+28+31+30+31+30+31+31+da;
    elseif mo==10
        nd=31+28+31+30+31+30+31+31+30+da;
    elseif mo==11
        nd=31+28+31+30+31+30+31+31+30+31+da;
    elseif mo==12
        nd=31+28+31+30+31+30+31+31+30+31+30+da;
    end

end

