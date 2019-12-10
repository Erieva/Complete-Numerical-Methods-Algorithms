function [L, U, P] = luFactor(A)
%luFactor(A)
%LU decomposition with pivotiing
%Created By: Katie Evans
%Created On: 10/28/2019
%Description: This function creates the upper and lower triangluar
%matricies of the matrix A that represents a system of equations through LU factorization while also displaying the pviot matrix. It is important
%that the martix must be square so that the system of equations is not
%ill-conditioned. This function only uses partial pivoting. 
%
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix


%Make sure that the matrix is square:
[m,n]= size(A);

if m~=n
    error('Please input a square matrix in which the number of rows is equal to the number of columns.')
end

%Create the identity matrix of the A matrix:
P=eye(m,m);

%Define the U matrix at the beginning:
U=A;

%Create the lower triangular matrix:
L=eye(m,m);

%Partial pivoting by making the largest absolute number in the first row:
for s=1:n
    if abs(U(s,1))>abs(U(1,1))
        temp = U(1,:);
        U(1,:)=U(s,:);
        U(s,:)= temp;
        
%Updating the pivot matrix to represent how the U matrix was changed      
        temp = P(1,:);
        P(1,:) = P(s,:);
        P(s,:) = temp;
    end 
end
for s=1:n-1
%Complete the LU decomposition of the A matrix:
for j = s:n-1                              %Create loop to go through all of the columns of the matrix
    L_coeff= U(j+1,s)/U(s,s);              %Create the factor to multiply the 'first' row by.
    L(j+1,s)= L_coeff;                     %Put coefficient found into the L matrix
    U(j+1,:)= U(j+1,:)-((U(s,:)).*L_coeff);%Find the value of the U matrix
end

%Go back through to see if the new row in U needs to pivot:
    for w = s+2:n
        if abs(U(w,s+1))>abs(U(s+1,s+1))
        temp = U(s+1,:);
        U(s+1,:)=U(w,:);
        U(w,:)= temp;
        
        %Pivot the pivot matrix as well
        temp = P(s+1,:); 
        P(s+1,:) = P(w,:);
        P(w,:) = temp; 
        
        %Pivot the L matrix as well
        Lchange = L(s+1,1:s); 
        L(s+1,1:s)=L(w,1:s);
        L(w,1:s)= Lchange;
        end
    end
end
%Check to make sure that values are accurate:
%P*A == L*U
P*A == L*U
end
   
    
    

