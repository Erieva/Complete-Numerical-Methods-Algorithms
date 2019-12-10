function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%Created By: Katie Evans
%Created On: 10/5/2019
%Description: This function finds the root of a function between the intial
%guess values by using the false position method and repeatedly bisecting
%an interval and then selecting a subinterval in which a root must lie for
%further processing. 
%  
%Inputs: 
%   func: the function you are finding the root for 
%   xl: lower interval limit
%   xu: upper interval limit
%   es:desired relative error, defaults to 0.0001% if not included
%   maxit: maximum number of iterations tp use, defaults to 200 if not
%   included
%   varargin: any additional parameters used by the function

%Outputs: 
%   root: the estimated root location
%   fx: function evaluated at the root location
%   ea: approcimate relative error in percent
%   iter: how many interations were performed

%Error Checks:
if nargin<3 %checking the number of arguments and assigning values if no argument put in by user
    error('Necessary to have a minimum of 3 input arguments.')
elseif nargin ==3
      es=0.000001;
      maxit=200;
elseif nargin ==4
      maxit=200;
end

%Initial Sign Check:
if func(xl)*func(xu)>0 %checking if the initial points are not the same sign
    error('Incorrect initial points: sign does not change.')
elseif (xl>xu)
    error('Problem with interval size: incorrect xl and xu.')
end

%Begin Code:
format long

iter=0; %initial number of interations
xr=xl; %giving xr an initial value as it needs to be called before the loop
ea=100; %initial approximate error


while ea>es
    xrprev=xr; %Storing the previous xr value
    iter=iter+1; %interation counter
    xr=xu-(((xu-xl)*func(xu))/(func(xu)-func(xl))); %finding new xr with false position equation
 
    if xr~=0
       ea=abs((xr-xrprev)/xr)*100; %To calculate and convert approximate error into a percent
    else ea=0
    end
    
    if func(xl)*func(xr)<0 %Sign check 
        xu=xr;%Making xr become upper bound
    elseif func(xl)*func(xr)>0
        xl=xr; %Making xr become lower bound
    end
    
    if func(xr)==0
        break
    end
    
    if iter>=maxit %To make sure the interations do not exceed predesired value
        fprintf('Maximum number of interations has occured.%\n')
        break
    end
    
end

%Displaying all of the values for the final answer:
root=xr;
fprintf('The root is %0.9f\n',root)
fx=func(xr);
fprintf('The value at the root is %0.9f\n',fx)
ea=ea;
fprintf('The approximate error is %d percent \n',ea)
iter=iter;
fprintf('The number of interations is %d\n',iter)
end
