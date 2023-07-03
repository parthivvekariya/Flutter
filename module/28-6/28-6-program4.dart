import 'dart:io';

//factorial of given number

void main()
{
    print("Enter a number:");
    int num = int.parse(stdin.readLineSync()!);

    while(num>=1)
    {
      print(num);
      num--;
    }

}

