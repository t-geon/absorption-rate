function  x=slv(A,b)  
[L,U,I]=slu(A);
[n,n]=size(A);  %Store the number of rows and columns of matrix A in [n,n].
change=0;   %This is a variable indicating whether or not row conversion has occurred in slu.

for z=1:n 
    if(I(z,z)~=1) 
        change=1;   %If there is a row change where there is no 1 in the diagonal component, change the change to 1.
        break;
    end
end

if change==1
    A=I*A;
    b=I*b;
end

for k=1:n
   L(k,k)=1;    %Put 1 in the place of k rows and k columns. (As a result, 1 is stored in the diagonal component.)
   for i=k+1:n
       L(i,k)=A(i,k)/A(k,k);    %Store the mutiplier in row i k column of A in row i k column in L.
       for j=k+1:n
           A(i,j)=A(i,j)-L(i,k)*A(k,j); %This is the code that performs elimination on matrix A. (Multiplier A by multiplier and subtract from A.)
       end
   end
   for j=k:n
       U(k,j)=A(k,j);   %Eliminate matrix A and store the resulting matrix in U. (Inverted triangle)
   end
end

for k=1:n
    s=0;    %Since the Lc value is stored, it is continuously initialized to 0.
    for j=1:k-1
    s=s+L(k,j)*c(j);   
    end
    c(k)=b(k)-s;    %Subtract from b and the remainder becomes the value of c.
end

for k=n:-1:1
   t=0; %Since the Ux value is stored using t, it is continuously initialized to 0.
    for j=k+1:n 
        t=t+U(k,j)*x(j);    % Store the Ux value in t.
    end
    x(k)=(c(k)-t)/U(k,k);   %Find x in the same way that c was obtained above.
end

x=x';   %Since x is stored in one row, we need to transpose it.
end
