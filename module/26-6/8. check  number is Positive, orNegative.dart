import 'dart:io';

void main()
{
  print("Enter a number:");
  double number = double.parse(stdin.readLineSync());

  //int number=10;

  if(number > 0)
  {
    print("Number is positive");
  }
  else if(number < 0)
  {
    print("Number is negativie");
  }
  else
  {
    print("Number is Zero");
  }
}