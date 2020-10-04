//Write a program to print all the LEADERS in the array. An element is leader if it is greater than all the elements to its right side. And the rightmost element is always a leader.For example int the array {300,40,60,90,100,12,16, 17, 4, 3, 5, 2}, leaders are 300,100,17, 5 and 2.

//Ans 3 

void main() {
  List<int> arr=[300,40,60,90,100,12,16, 17, 4, 3, 5, 2];
  int greatestElement=0;
  List<int> result=new List();
  for(int i=arr.length-1;i>=0;i--)
  {
    if(arr[i]>greatestElement)
    {
      greatestElement=arr[i];
      result.add(arr[i]);
    }
  }
  print(result.reversed.join(','));
  
  print("--------------- 2nd Method ---------------");
  result.clear();
  greatestElement=0;
  
  arr.reversed.forEach((element){
    
    if(element>greatestElement)
    {
      greatestElement=element;
      result.add(element);
    }
    
  });
  print(result.reversed.join(','));
}