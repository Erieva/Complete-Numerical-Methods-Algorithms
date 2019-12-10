function [I] = Simpson(x, y)
%function [I] = Simpson (x,y)
%Created By:Katie Evans
%Created On:11/14/2019
%Last Updated: 11/14/2019
%Description: Numerical evaluation of integral by Simpson's 1/3 Rule over
%even intervals. If an extra extra interval is present, then the
%trapezoidal rule is used on the last interval.
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%Error Check that the input vectors are the same length
if length(x) ~= length(y)
    error('The x vector and corresponding y vector neeed to be the same length.')
end
%Error check that the x vector is equally spaced
n=length (x); %length of x vector
fv = x(1,1); %first value of x vector
lv = x(1,n);  %last value of x vector 

check = linspace(fv,lv,n); %Creates equally spaced vector betwee the first value of x and last value of x
if isequal(check,x) == 0 
    error('For the x vector: The spacing between values must be equal.')
end

%If number of intervals is less than 2, display error
if n<3
    warning('There must be at least two intervals, 3 data points to use Simpsons. Only trapezoidal rule will be used.')
end

if n<3
    trap = ((lv-fv)/2)*(y(1,1)+y(1,n));
    I=trap;
else
    
%Warning that the trapezoidal rule was used
if rem(n-1,2)~=0
    warning('As there was an odd number of invertals, a single iteration of the trapeziodal method was used.')
end


%Simpson's 1/3rd Rule

%To calculate the integral when there is an equal number of intervals in
%the x vector:
if rem(n-1,2) == 0 
    I = y(1,1)+y(1,n); %automatically adding in the first and last value the answer

    for s = 2:2:n-1     %multiples the desired function values by 4 and added final value to answer
        I = I+(4*y(1,s));
    end
    for r = 3:2:n-2     %multiples desired values by 2 and adds final value to the answer
        I = I+(2*y(1,r));   
    end
I= ((lv-fv)/(3*(n-1)))*I;   %multiplies the final value by the coeffcient in the 1/3rd rule which is the stepsize/3
end

%To calculate the integral when there is not an equal number of intervals in
%the x vector:
if rem(n-1,2)~= 0 
    I = y(1,1)+y(1,n-1); %automatically adding in the first and second to last value to the answer
    vector_adj = x(1,n-1);
    
   for t = 2:2:n-2     %multiples the desired function values by 4 and added final value to answer
        I = I+(4*y(1,t));
    end
    for q = 3:2:n-3     %multiples desired values by 2 and adds final value to the answer
        I = I+(2*y(1,q));   
    end

I= ((vector_adj-fv)/(3*(n-2)))*I;   %multiplies the final value by the coeffcient in the 1/3rd rule which is the stepsize/3

%Adding in the trapezoidal rule for final interval:
trap= ((lv-vector_adj)/2)*(y(1,n-1)+y(1,n)); %calculates the single application of the trapezoidal rule

%Final intergral value:
I= I+trap;
end
end 

end