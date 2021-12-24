function [L,U,I]=slu(A)%A를 입력받아서 L,U를 구합니다. pivot이 0일때 행을 바꾸는데 I는 곱해서 행을 바꿔주는 행렬입니다.
[n,n]=size(A);%[n,n]에 A행렬의 행과 열의 갯수를 저장합니다.
tol=1.e-6;%tol은 10의 -6승입니다.
I=eye(n,n);%elimination하긴전에 바꾼행 행을 바꾼 정보를 저장하는 행렬입니다(slv에서 b를 치환해주는데 사용됩니다.
for k=1:n% k=1부터 n까지 반복합니다.
    if abs(A(k,k))<tol%A(k,k)의 절댓값이 10의-6승보다 작으면 (A(k,k)가 0이면) if문 안으로 들어갑니다.
        for i=k+1:n%i=k+1부터 n까지 반복합니다
            if A(i,k)~=0%만약 A행렬의 i행,k열 요소가 0이 아니면 행을 바꿉니다.
                temp=A(k,1:n);%temp에 A의 k행 값을 저장합니다. 
                A(k,1:n)=A(i,1:n);%A의 k행에 i행 값을 저장합니다
                A(i,1:n)=temp;%A의 i행에 temp(바뀌기전 A의 k행)값을 저장합니다.
                
                temp=I(k,1:n);%temp에 I의 k행 값을 저장합니다.
                I(k,1:n)=I(i,1:n);%I의 k행에 i행 값을 저장합니다
                I(i,1:n)=temp;%I의 i행에 temp(바뀌기전 I의 k행)값을 저장합니다.
                break;%A와 I의 k행과 i행을 바꾸고 반복문을 빠져나갑니다.
            end%if A(i,1)~=0를 끝냅니다.
        end%  for i=2:n을 끝냅니다.
    end%if abs(A(k,k))<tol을 끝냅니다.
    
   L(k,k)=1;%k행 k열 자리에 1을 넣어줍니다.(결과적으로 대각성분에 1이 저장됩니다.)
   
    for i=k+1:n%i=k+1부터 n까지 반복합니다.
        L(i,k)=A(i,k)/A(k,k);%A의 i행 k열의 mutiplier[A(i,k)/A(k,k)]를 L에 i행 k열에 저장합니다.
        for j=k+1:n%j=k+1부터 n까지 반복합니다.
            A(i,j)=A(i,j)-L(i,k)*A(k,j);%A행렬에 elimination을 해주는 코드입니다.(A에 multiplier를 곱한 뒤 A에 빼줍니다. )
        end%for j=k+1:n을 끝냅니다.
    end%for i=k+1:n을 끝냅니다.
    for j=k:n%j=k부터 n까지 반복합니다.
        U(k,j)=A(k,j);%A행렬을 elimination하고 생긴 행렬을 U에 저장합니다.
    end%for j=k:n을 끝냅니다.
end%for k=1:n을 끝냅니다.
end%slu함수를 끝냅니다.

