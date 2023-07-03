import 'dart:io';

void main() {
  // get number from user
  print('Enter a number:');
  var number = int.parse(stdin.readLineSync()!);

  int maxDigit = 0;

  while (number > 0) {
    int digit = number % 10;

    if (digit > maxDigit) {
      maxDigit = digit;
    }

    number ~/= 10;
  }

  print("The maximum digit is: $maxDigit");
}
