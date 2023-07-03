import 'dart:io';

void main() {

  // get number from user
  print('Enter a number:');
  var number = int.parse(stdin.readLineSync()!);

  // Get the first and last digits of the number
  int firstDigit = getFirstDigit(number);
  int lastDigit = getLastDigit(number);

  // Calculate the sum
  int sum = firstDigit + lastDigit;

  // Print the result
  print("Sum of first and last digit: $sum");
}

int getFirstDigit(int number) {
  while (number >= 10) {
    number ~/= 10;
  }
  return number;
}

int getLastDigit(int number) {
  return number % 10;
}
