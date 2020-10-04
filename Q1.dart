/* 
Q1. Maintain 5 Customer Records and Customer are access by Name.
Each Customer has Address , 
Address can be office, res

Amit —> Address
Office , res
Office address can be N But Unique
Res Address can be N But Unique

Customer also has Orders , Orders are N and Order are access BY Id, Order Contains Product, Product can be N, Product are sorted by Prices.
Product can be Duplicate.
Also Print Summary Report - Total Amount of Product.
*/

//Ans 1

import 'dart:io';
import 'dart:math';

void main() {
  InitializedProductList();
  AdminPanel();
}

void AdminPanel() {
  print("\n\nAre you Admin(y/n):");
  String ans = stdin.readLineSync();
  if (ans.toLowerCase() == "y") {
    ShowAdminStuff();
  } else {
    CustomerPanel();
  }
}

void CustomerPanel() {
  print("\nCreate Account and Add Order:");
  AddCustomer();
}

void ShowAdminStuff() {
  while (true) {
    print("\n0. Go Back");
    print("1. View Orders");
    print("2. Add Product in List\n");
    print("Add More Products in List:");

    int TypeAns = int.parse(stdin.readLineSync());
    switch (TypeAns) {
      case 0:
        {
          AdminPanel();
        }
        break;

      case 1:
        {
          if (CustomersList.length == 0) {
            print(
                "-------------------------\nCustomer List is Empty\n-------------------------");
          } else {
            bool checkOrder = true;
            while (checkOrder == true) {
              ShowOrderList();

              print("Want to Search Customer via OrderID(y/n):");
              String ans = stdin.readLineSync();
              if (ans.toLowerCase() == "y") {
                print("Enter OrderID:");
                SearchOrder(int.parse(stdin.readLineSync()));
              }
              print("\nWant to Search More Orders(y/n):");
              ans = stdin.readLineSync();
              if (ans.toLowerCase() == "n") {
                checkOrder = false;
              }
            }
          }
        }
        break;

      case 2:
        {
          bool addproduct = true;
          while (addproduct == true) {
            ShowProductList();
            AddProductList();
            print("\nWant to view Product List(y/n):");
            String ans = stdin.readLineSync();
            if (ans.toLowerCase() == "y") {
              ShowProductList();
            }
            print("\nWant to Add More Products in List(y/n):");
            ans = stdin.readLineSync();
            if (ans.toLowerCase() == "n") {
              addproduct = false;
            }
          }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}

void ShowOrderList() {
  print('\n\n------------------------------------------');
  print('------------- Current Orders  ------------');
  CustomersList.forEach((element) {
    print("Order id: " +
        element.orderid.toString() +
        "     ,Customer Name: " +
        element.name +
        "    ,Customer Orders:" +
        ExtractProducrList(element.Order));
  });
  print('------------------------------------------');
}

void SearchOrder(int OrderNumber) {
  int resultsFound = 0;

  print('\n\n-------------- Result Found  -------------');
  CustomersList.forEach((element) {
    if (element.orderid == OrderNumber) {
      resultsFound++;
      print("Order id: " +
          element.orderid.toString() +
          "     ,Customer Name :" +
          element.name +
          "    ,Customer Orders :" +
          ExtractProducrList(element.Order));
    }
  });
  if (resultsFound == 0) {
    print("//  Order id Not Found  //");
  }
  print('------------------------------------------');
}

String ExtractProducrList(List<products> PList) {
  String ProductName = "";
  int TotalPrice = 0;
  PList.forEach((element) {
    ProductName += element.ProductName + ",";
    TotalPrice += element.ProductPrice;
  });
  return "[${ProductName}]      ,Total Price :" + TotalPrice.toString();
}

void ShowProductList() {
  print('\n\n------------------------------------------');
  print('---------- Current Product List ----------');
  Products.forEach((element) {
    print("Name :" +
        element.ProductName +
        "       Price :" +
        element.ProductPrice.toString());
  });
  print('------------------------------------------');
}

List<String> AddressList = new List();
List<products> Products = new List();
List<customers> CustomersList = new List();
void InitializedProductList() {
  Products.add(new products("Toffee", 1));
  Products.add(new products("Cake", 100));
  Products.add(new products("Bread", 40));
  Products.add(new products("IceCream", 30));
  SortProductElements();
}

void AddCustomer() {
  String Name, Radd, Oadd;
  print("Enter your Name:");
  Name = stdin.readLineSync();

  bool repeat = true;
  while (repeat) {
    print("\nEnter your Residence Address:");
    Radd = stdin.readLineSync();
    print("Enter your Office Address:");
    Oadd = stdin.readLineSync();
    repeat = CheckAddress(Radd + "," + Oadd);
    if (repeat == true) {
      print("Database Already Contain this Address Please Enter New One");
    } else {
      AddressList.add(Name + ":" + Radd + "," + Oadd);
    }
  }

  int Orderid = new Random().nextInt(1000);
  bool addMorProduct = true;
  String productName = "";
  List<products> CustomerOrderedProduct = new List();
  while (addMorProduct == true) {
    print("\n\nProducts in Stock are:");
    ShowProductList();
    print("Enter Product Name to Add in Order:");
    productName = stdin.readLineSync();
    CustomerOrderedProduct.add(GetProductDetail(productName));
    print("\nYour Current Order are:");
    CustomerOrderedProduct.forEach((element) {
      print(element.ProductName);
    });
    print("\nOrder More Products(y/n):");
    String s = stdin.readLineSync();
    if (s.toLowerCase() == "n") {
      addMorProduct = false;
    }
  }
  CustomersList.add(
      new customers(Name, Radd + "," + Oadd, Orderid, CustomerOrderedProduct));
  print("\n\nCustomer Record Saved\n\n");
  AdminPanel();
}

products GetProductDetail(String PName) {
  products p;
  Products.forEach((element) {
    if (element.ProductName == PName) {
      p = element;
    }
  });
  return p;
}

bool CheckAddress(String Add) {
  bool hasAddress = false;
  AddressList.forEach((element) {
    if (element.contains(Add)) {
      hasAddress = true;
    }
  });
  return hasAddress;
}

void AddProductList() {
  String PName;
  int Price = 0;
  print("Enter Product Name:");
  PName = stdin.readLineSync();
  print("Enter Product Price:");
  Price = int.parse(stdin.readLineSync());
  Products.add(new products(PName, Price));
  SortProductElements();
  print("----------   Product Added  ----------\n");
}

void SortProductElements() {
  Products.sort((a, b) => a.ProductPrice - b.ProductPrice);
}

class customers {
  String name;
  String address;
  int orderid;
  List<products> Order;

  customers(String CName, String Add, int OrderID, List<products> ORders) {
    name = CName;
    address = Add;
    orderid = OrderID;
    Order = ORders;
  }
}

class products {
  String ProductName;
  int ProductPrice;

  products(String Name, int Price) {
    ProductName = Name;
    ProductPrice = Price;
  }
}
