# absorption-rate

input = The value that flows through the human body
output = value flowing out of a person's body

This is a project to find x, the absorption rate of the human body, using input and output.

The project can be easily solved by thinking of it as a linear inverse problem.
Conceptually, the absorption rate of the human body cannot be measured, so it is guessed by the signal code and the resulting value.

즉 Ax=b를 생각하면 쉽게 풀 수 있습니다.
A는 신호코드로 입력 값이고 b는 결과표로 출력 값으로 볼 수 있습니다.
Ax=b는 A와 b를 알 때 slu함수와 slv함수를 이용해서 x를 구할 수 있습니다. 

Ax=b에서 A행렬 역할을 하는 a행렬은 20x20행렬입니다.
각 행에 있는 요소 20개들은 같은 시간대에 들어간 다른 주파수로 인해 생성된 입력 값입니다.
예를 들어 a의 1행의 1열은 0.01초에 11Hz로 만들어진 입력 값(몸에 흘러 보내는 값)이고
1행의 2열은 0.01초에 12Hz로 만들어진 입력 값입니다.
이와 같이 a에 모든 입력 값을 초기화해줍니다.

Ax=b에서 b역할을 하는 output은 주어진 output.mat파일에 있습니다.
이를 사용하기 위해서는 load함수를 사용해야 합니다.
즉 load('output.mat')는 output.mat에 있는 값을 가져와주는 동작을 합니다
위에서 말한 a와 output을 slu, slv함수에 적용하면 x를 구할 수 있습니다.

inv함수를 이용해 xx를 구했습니다.
Ax=b를 이용해 설명하겠습니다.
Ax=b에서 A의 역행렬을 양변에 곱해줍니다. 
-> Ax=b이 x=A의 역행렬* b가 됩니다.
Inv는 행렬의 역행렬을 구해주는 함수로 x = A의 역행렬* b와 xx = inv(a) * output은 같습니다.
저는 a * xx를 한 값을 out2에 넣어줬습니다.
