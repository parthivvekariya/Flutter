import 'dart:io';

void main() {
  //reversedNumber

  print("Enter a number:");
  int num = int.parse(stdin.readLineSync()!);

  String rnum = num.toString().split('').reversed.join();
  print('Reversed Number: $rnum');
}
