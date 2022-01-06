function  x=slv(A,b)    %This is a function that takes a matrix A and a vector b and finds x.
[L,U,I]=slu(A); %The L,U,I1,I2 matrices created by putting A into the slu function are returned as L,U,I1,I2.
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
    s=0;    %s를 이용해서 Lc값을 저장하기 때문에 계속 0으로 초기화해줍니다..
    for j=1:k-1
    s=s+L(k,j)*c(j);    %s에 L*c값을 저장합니다.(Lc=b에서 c를 구하기 위해서, L의 한 row에 column별로 c값(아직 정확히 알지 못합니다.)을 곱해서 더한 값을 s에 저장합니다.)
    end
    c(k)=b(k)-s;    %위에서 저장한 L*c를 b에 빼줘 나머지 값이 c 값이 됩니다.(L의 대각선 성분이 1이기 때문에), 즉 b를 elimination한 값을 c에 저장하는것 입니다.
end

for k=n:-1:1
   t=0; %t를 사용해서 Ux값을 저장하기 때문에 계속 0으로 초기화 해줍니다.
    for j=k+1:n 
        t=t+U(k,j)*x(j);    % t에 Ux값을 저장합니다.(Ux=c를 이용해 x를 구하기 위해서, U의 한 행에 열 별로 x를 곱해서 더한 값을 t에 저장합니다.)
    end
    x(k)=(c(k)-t)/U(k,k);   %위에서 c를 구한 방식과 같게 x를 구합니다.(Ux=c를 이용해서 위에서 구한 값을 c에 빼준후 U를 나눠 x값을 구합니다)
 
end
x=x';   %x가 1개의 행에 저장 되어있기 때문에 전치를 해줘야합니다.
end
