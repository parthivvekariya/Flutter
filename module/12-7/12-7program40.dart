int factorial(int n)
{
  if (n == 0)
  {
    return 1;
  } else
  {
    return n * factorial(n - 1);
  }
}

void main()
{
  int number = 5;
  int result = factorial(number);
  print("Factorial of $number: $result");
}
