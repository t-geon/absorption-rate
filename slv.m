function  x=slv(A,b)    %A행렬,b벡터를 받아 x를 구하는 함수입니다.
[L,U,I]=slu(A); %slu함수에 A를 넣어 생선된 L,U,I1,I2행렬을 L,U,I1,I2로 반환합니다.
[n,n]=size(A);  %[n,n]에 A행렬의 행과 열의 갯수를 저장합니다.
change=0;   %slu에서 행변환이 일어났는지 아닌지를 표시하는 변수입니다

for z=1:n   %대각선 성분을 검사하기 위해 1부터 n까지 반복하는 반복문입니다.
    if(I(z,z)~=1)   %행변환이 일어나서 I의 대각성분이 1이 아닌 곳이 있으면 if문으로 들어갑니다.
        change=1;   %행변환이 일어나 대각성분에 1이 없는 곳이 있다면 change를 1로 변경합니다.
        break;
    end
end

if change==1
    A=I*A;
    b=I*b;
end

for k=1:n
   L(k,k)=1;    %k행 k열 자리에 1을 넣어줍니다.(결과적으로 대각성분에 1이 저장됩니다.)
   for i=k+1:n
       L(i,k)=A(i,k)/A(k,k);    %A의 i행 k열의 mutiplier를 L에 i행 k열에 저장합니다.
       for j=k+1:n
           A(i,j)=A(i,j)-L(i,k)*A(k,j); %A행렬에 elimination을 해주는 코드입니다.(A에 multiplier를 곱한 뒤 A에빼줍니다. )
       end
   end
   for j=k:n
       U(k,j)=A(k,j);   %A행렬을 elimination하고 생긴 행렬을 U에 저장합니다.(역삼각형)
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
