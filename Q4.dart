//Q4. Find the Missing Number
//You are given a list of n-1 integers and these integers are in the range of 1 to n. There are no duplicates in the list. One of the integers is missing in the list. Write an efficient code to find the missing integer.
//Input: arr[] = {1, 2, 4, 6, 3, 7, 8}Output: 5
//Input: arr[] = {1, 2, 3, 5}Output: 4

//Ans4

void main() {
  List<int> arr = [1, 7, 3, 5, 2, 4];
  int firstElement = arr[0] - 1;

  arr.sort();
  for (int i = 0; i < arr.length; i++) {
    if ((firstElement + 1) == arr[i]) {
      firstElement = arr[i];
    } else {
      print("Missing Element:" + (firstElement + 1).toString());
      break;
    }
  }
}
