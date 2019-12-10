# FalsePosition Algorithm

## What the Algorithm is:
This function finds the root of a function using the false position method.

## Inputs:
func = function in which you are finding the root for
xl = lower interval limit
xu = upper interval limit 
es = desired relative error, default to 0.0001%
maxit = maximum number of interations, default to 200
varargin = additional parameters

## Outputs:
root = estimated root location
fx = value of estimated root
ea = relative error
iter = number of iterations preformed 

## Limitations:
Only uses the false position method.
Know the limitations of False position method before chosing interval bounds. 

## Notes: 
In future, create algorithms for other root finding methods. 
