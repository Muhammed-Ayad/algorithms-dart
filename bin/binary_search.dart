void main(List<String> args) {
  List<int> sortedList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int key = 10;
  print(binarySearch(sortedList, key));
}

int binarySearch(List<int> list, int key) {
  int low = 0;
  int high = list.length - 1;
  while (low <= high) {
    int mid = (low + high) ~/ 2;

    if (key == list[mid]) {
      return mid;
    } else if (key > list[mid]) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}
