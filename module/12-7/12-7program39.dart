int calculateSquare(int number)
{
  return number * number;
}

int calculateCube(int number)
{
  return number * number * number;
}

void main()
{
  int inputNumber = 5;

  int square = calculateSquare(inputNumber);
  int cube = calculateCube(inputNumber);

  print("Square of $inputNumber: $square");
  print("Cube of $inputNumber: $cube");
}
