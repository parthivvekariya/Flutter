import 'dart:io';

void main()
{
  /*print("Enter a mark of maths:");
  int m = int.parse(stdin.readLineSync());
  print("Enter a mark of english:");
  int e = int.parse(stdin.readLineSync());
  print("Enter a mark of gujarati:");
  int g = int.parse(stdin.readLineSync());
  print("Enter a mark of hindi:");
  int h = int.parse(stdin.readLineSync());
  print("Enter a mark of sanskrit:");
  int s = int.parse(stdin.readLineSync());
   */

  int m=70;
  int e=75;
  int g=68;
  int h=60;
  int s=77;


  int sum = m+e+g+h+s;
  print("Total is");
  print(sum);

  double percentage = sum / 500 * 100;
  print("percentage is:");
  print(percentage);

}