t=0.01:0.01:0.2;    %t는 시간을 나타내며 0.01초부터 0.01초씩 0.2초가 될 때까지 증가하는 값을 갖습니다. 
freq=11:30; %freq은 11부터 30까지 1씩증가하는 값을 같습니다.

for i=1:20  %입력 값으로 20x20의 배열이 생성됩니다. 0.01초에 20개의 정현파를 쏘는데 0.2초까지 이기 때문입니다.
    a(1:20,i)=cos(2*pi*freq(i)*t);  %과제에 주어진 input으로 a배열의 각행을 초단위로 구분해 몸으로 들어가는 입력신호를 저장합니다.
end %for i=1:20를 끝냅니다.

load('output.mat')  %output.mat에 있는 출력값을 매트랩으로 가져옵니다
x=slv(a,output);    %입력인 a와 출력인output을 slv함수에 전달해 함수를 진행한 후 x에 값을 저장합니다.
xx=inv(a)*output;   %a*xx=output일때 양변에 a의 역함수를 곱하면 xx=a의 역행렬*output이 되기 때문에 앞의 코드를 작성했습니다.

x
disp(x);%사람의 몸에 흡수되는 x를 출력합니다.

out1=a*x;   %a와 slv를 이용해 구한 x를 곱한 값을 out1에 저장합니다. 이 값은 이론상으로 output과 같습니다.
out2=a*xx;  %a와 inv함수를 이용해 구한 xx를 곱한 값을 out2에 저장합니다. 이값은 이론상으로 output과 같습니다

plot(t,out1);   %t를 가로축으로 하는 out1을 2차원 평면에 표현합니다.

for id=1:20
    if(x(id)==xx(id))   
        disp("같습니다");
    else    
        disp("다릅니다");
    end
end
