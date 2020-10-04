/*Q2. (Asked by Amazon) O(N)
A professor went to a party. Being an erudite person, he classified the party into two categories. He proposed that if all the persons in the party are wearing different colored robes, then that is a girl’s only party. If we even get one duplicate color, it must be a boy’s party. The colors of the robes are represented by positive integers.
Input The first line of each test case contains an integer T, denoting the no of test cases. Then T test cases follow. The first line of each test case contains an integer N denoting the number of people in the party. In the next line are N space separated values of Ai denoting the color of the robes.
Output For each test case, print “BOYS” without quotes if it’s a boy’s party, else print “GIRLS”
*/

//Ans 2
import 'dart:io';

void main() {
  int NTC = 0; // Number of Test Cases
  NTC = int.parse(stdin.readLineSync());
  List<String> RobesCode = new List();

  for (int i = 0; i < NTC; i++) {
    int NOP = 0; //Number of person in the Party
    NOP = int.parse(stdin.readLineSync());
    List<int> tempList = new List();
    int contain = 0;
    for (int j = 0; j < NOP; j++) {
      // Iteration to Get Persons RobesColor
      int temp = int.parse(stdin.readLineSync());

      if (tempList.contains(temp)) {
        contain = 1;
      } else {
        tempList.add(temp);
      }
    }
    (contain != 0) ? RobesCode.add("Boys") : RobesCode.add("Girls");
  }
  print("Output: " + RobesCode.join("\n").toString());
}
