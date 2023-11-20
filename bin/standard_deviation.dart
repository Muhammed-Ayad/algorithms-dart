import 'dart:math' as math;

void main() {
  double standardDeviation(List<int> items) {
    double ava = 0.0;
    int sum = 0;
    double a = 0.0;
    for (int i = 0; i < items.length; i++) {
      sum += items[i];
    }
    ava = sum / items.length;
    print(ava);
    for (int i = 0; i < items.length; i++) {
      a += math.pow(items[i] - ava, 2);
    }
    print(a);

    return math.sqrt(a / items.length);
  }

  print(standardDeviation([10, 12, 23, 23, 16, 23, 21, 16]));
}
