// you can use libraries, for example:
// import 'dart:math'

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message");

int solution(String S) {
  var arrayS = S.toUpperCase().split('');
  var numberAction = 0;
  
  while (containBanana(arrayS)) {
    arrayS = removeFirstOneB(arrayS);
    arrayS = removeFirstTwoN(arrayS);
    arrayS = removeFirstThreeA(arrayS);
    numberAction++;
  }

  return numberAction;
}

bool containBanana(List<String> s) {
  var numberOfB = s.where((e) => e == 'B').toList().length;
  var numberOfA = s.where((e) => e == 'A').toList().length;
  var numberOfN = s.where((e) => e == 'N').toList().length;

  return numberOfB >= 1 && numberOfA >= 3 && numberOfN >= 2;
}

List<String> removeFirstOneB(List<String> s) {
  for (var i = 0; i < s.length; i++) {
    if(s[i] == 'B') {
      s.removeAt(i);
      break;
    }
  }
  return s;
}

List<String> removeFirstTwoN(List<String> s) {
  final cloneS = [...s];
  var deletedNumber = 0;
  for (var i = 0; i < s.length; i++) {
    if(s[i] == 'N') {
      cloneS.removeAt(i-deletedNumber);
      deletedNumber++;
      if(deletedNumber == 2) break;
    }
  }
  return cloneS;
}

List<String> removeFirstThreeA(List<String> s) {
  final cloneS = [...s];
  var deletedNumber = 0;
  for (var i = 0; i < s.length; i++) {
    if(s[i] == 'A') {
      cloneS.removeAt(i-deletedNumber);
      deletedNumber++;
      if(deletedNumber == 2) break;
    }
  }
  return cloneS;
}

void main() {
  print(solution('NAABXXAN'));
  print(solution('NAANAAXNABABYNNBZ'));
  print(solution('QABAAAWOBL'));
}