void main(List<String> args) {
  print(factorial(4));
}

int factorial(int number) {
  if (number == 1) {
    return 1;
  } else {
    return number * factorial(number - 1);
  }
}
