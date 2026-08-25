void main(){
  List<int> primeSequence = [];
  int divideCount = 0;
  for(int i = 2; i <= 20;i++){
    for(int j = 1; j <= i; j++){
      if (i % j == 0){
        divideCount++;
      } 
    }
    if (divideCount == 2) {
      primeSequence.add(i);
      divideCount = 0;
    }
    divideCount = 0;
  }
  print(primeSequence.join(' '));
}