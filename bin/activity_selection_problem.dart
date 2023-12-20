void main(List<String> args) {
  var startList = [9, 10, 11, 12, 13, 15];
  var endList = [11, 11, 12, 14, 15, 16];
  greedyActivitySelector(startList, endList);
}

void greedyActivitySelector(List<int> start, List<int> end) {
  var results = [0];
  int j = 0;
  for (var i = 1; i < start.length; i++) {
    if (start[i] >= end[j]) {
      results.add(i);
      j = i;
    }
  }
  print(results);
}
