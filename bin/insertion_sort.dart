void main(List<String> args) {
  insertionSort([9, 5, 1, 4]);
}

void insertionSort(List<int> list) {
  for (var i = 1; i < list.length; i++) {
    var key = list[i];
    var j;
    for (j = i - 1; j >= 0; --j) {
      if (list[j] > key) {
        list[j + 1] = list[j];
      } else {
        break;
      }
    }
    list[j + 1] = key;
  }
  print(list);
}
