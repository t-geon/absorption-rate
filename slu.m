function [L,U,I]=slu(A) %Take A as input and get L and U
[n,n]=size(A);  %Store the number of rows and columns of matrix A in [n,n].
tol=1.e-6;  %tol is 10 to the -6 power.
I=eye(n,n); %This is a matrix that stores the information changed before elimination (used to replace b in slv).
for k=1:n
    if abs(A(k,k))<tol
        for i=k+1:n
            if A(i,k)~=0    %If the elements of row i and column k of matrix A are not 0, the row is replaced.
                temp=A(k,1:n);  
                A(k,1:n)=A(i,1:n);  
                A(i,1:n)=temp;  
                
                temp=I(k,1:n); 
                I(k,1:n)=I(i,1:n);  %Store the value of row i in row k of I
                I(i,1:n)=temp;  %Stores the value of temp (k row of I before being replaced) in row i of I.
                break; 
            end 
        end 
    end 
    
   L(k,k)=1;    %Put 1 in the place of k rows and k columns. (As a result, 1 is stored in the diagonal component.)
   
    for i=k+1:n
        L(i,k)=A(i,k)/A(k,k);   %Store the mutiplier[A(i,k)/A(k,k)] in row i k column of A in row i k column.
        for j=k+1:n
            A(i,j)=A(i,j)-L(i,k)*A(k,j);    %Elimination is performed on matrix A.
        end
    end
    for j=k:n
        U(k,j)=A(k,j);  %Eliminate matrix A and store the resulting matrix in U.
    end 
end
end

