/*
Q5. Find the Anagram String
“silent”
“listen”
*/

//Ans 5

import 'dart:io';

void main() {
  String FirstStr = stdin.readLineSync();
  String SecondStr = stdin.readLineSync();
  List a = FirstStr.codeUnits;
  List b = SecondStr.codeUnits;
  int val1 = a.fold(0, (previousValue, element) => previousValue + element);
  int val2 = b.fold(0, (previousValue, element) => previousValue + element);

  if (val1 != val2) {
    print("String is not Anagram");
  } else {
    print("String is Anagram");
  }
}
