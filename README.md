# absorption-rate

input = 사람의 몸에 흘러 보내는 값
output = 사람의 몸에서 흘러 나오는 값

input과 output을 이용해 사람의 몸의 흡수율인 x를 구하는 프로젝트입니다.

해당 프로젝트는 linear inverse problem으로 생각하면 쉽게 풀 수 있습니다.
개념적으로는 사람의 몸의 흡수율을 측정할 수 없기 때문에 신호코드와 결과 값으로 추측합니다.

즉 Ax=b를 생각하면 쉽게 풀 수 있습니다.
A는 신호코드로 입력 값이고 b는 결과표로 출력 값으로 볼 수 있습니다.
Ax=b는 A와 b를 알 때 slu함수와 slv함수를 이용해서 x를 구할 수 있습니다. 

Ax=b에서 A행렬 역할을 하는 a행렬은 20x20행렬입니다.
각 행에 있는 요소 20개들은 같은 시간대에 들어간 다른 주파수로 인해 생성된 입력 값입니다.
예를 들어 a의 1행의 1열은 0.01초에 11Hz로 만들어진 입력 값(몸에 흘러 보내는 값)이고
1행의 2열은 0.01초에 12Hz로 만들어진 입력 값입니다.
이와 같이 a에 모든 입력 값을 초기화해줍니다. 
