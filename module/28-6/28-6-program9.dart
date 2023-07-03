import 'dart:io';

void main() {
  print("Enter a number:");
  String input = stdin.readLineSync()!;
  int number = int.parse(input);

  int sum = 0;

  for (int i = 1; i <= number; i++) {
    sum += i;
  }

  print("The summation of $number is $sum.");
}
