import 'dart:io';

void main() {
  // table

  print("Enter a number:");
  int num = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 10; i++) {
    int a = num * i;
    print("$num * $i = $a");
  }


}

