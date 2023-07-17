void main()
{
  double num1 = 10;
  double num2 = 5;

  double sum = addNumbers(num1, num2);
  double difference = subtractNumbers(num1, num2);
  double product = multiplyNumbers(num1, num2);
  double quotient = divideNumbers(num1, num2);

  print("Sum: $sum");
  print("Difference: $difference");
  print("Product: $product");
  print("Quotient: $quotient");
}

double addNumbers(double a, double b)
{
  return a + b;
}

double subtractNumbers(double a, double b)
{
  return a - b;
}

double multiplyNumbers(double a, double b)
{
  return a * b;
}

double divideNumbers(double a, double b)
{
  if (b != 0) {
    return a / b;
  } else {
    print("Error: Division by zero");
    return double.nan;
  }
}
