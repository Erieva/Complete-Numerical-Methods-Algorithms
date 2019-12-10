function [A] = specialMatrix(n,m)
%specialMatrix.m
%Created On:9/15/2019
%Created By:Katie Evans
%Last Motified: 9/15/2019
%Desciption:This function should return a matrix A which is a n X m matrix
%with the value of each element in the first row being the number of the
%column, the value of each element in the first column being the number of
%the row, and the rest of the elements having a value equal to the sum of
%the element above it and the element to the left. 
% Inputs:
%   n is the number of rows
%   m the number of columns
%Output:
%   A is the matrix n X m with the description stated above

%Error check for specialMatrix 
if nargin > 2 || nargin < 2
    error('Incorrect number of input arguments: specialMatrix requires exactly 2 input arguments. Please see help function is needed.')
end
% First create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);

% Now the real challenge is to fill in the correct values of A

for f = 1:n
    for g = 1:m
        if f == 1   %to set the first row as the number of the column
            A(f,g)=g;
        elseif g == 1 %to set the first column as the number of the row
            A(f,g)= f;
        else            %for all other elements in the matrix
            A(f,g)= A(f,g-1)+A(f-1,g);   %summing by adding element to left first and then the one above 
        end
    end
end

end

% Things beyond here are outside of your function