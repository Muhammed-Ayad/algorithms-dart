import 'dart:math' as math;

void main() {
  List<int> xx = [2, 1, 1, 4, 2];
  List<int> yy = [3, 4, 1, 2, 2];

  double getCorrelationCoefficient(List<int> yy, List<int> xx) {
    double y = 0;
    double x = 0;
    double x2 = 0;
    double y2 = 0;
    double xy = 0;

    double n = yy.length.toDouble();
    for (int i = 0; i < n; i++) {
      x += xx[i];
      y += yy[i];
      xy += xx[i] * yy[i];
      x2 += math.pow(xx[i], 2);
      y2 += math.pow(yy[i], 2);
    }

    var up = n * xy - y * x;
    var down =
        math.sqrt(n * x2 - math.pow(x, 2)) * math.sqrt(n * y2 - math.pow(y, 2));
    print("x : $x");
    print("y : $y");
    print("x2 : $x2");
    print("y2 : $y2");
    print("xy : $xy");

    return up / down;
  }

  print(getCorrelationCoefficient(yy, xx));
}
