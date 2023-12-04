void main(List<String> args) {
  List<int> array = [9, 3, 5, 1];

  print("Un Sorted: $array");
  mergeSort(array, 0, array.length - 1);
  print("Sorted: $array");
}

void mergeSort(List<int> list, int start, int end) {
  //? Base case: if the subList has one or zero elements, it is already sorted.
  if (end <= start) return;

  //? midPoint.
  int midPoint = (end + start) ~/ 2;

  //? Recursively sort the first and second halves.
  mergeSort(list, start, midPoint);
  mergeSort(list, midPoint + 1, end);

  //? Merge the sorted halves.
  merge(list, start, midPoint, end);
}

void merge(List<int> list, int start, int midPoint, int end) {
  int i, j, k;
  //? Calculate lengths of the two subList.
  int leftLength = midPoint - start + 1;
  int rightLength = end - midPoint;

  //? Lists
  List<int> leftList = List<int>.filled(leftLength, 0);
  List<int> rightList = List<int>.filled(rightLength, 0);

  //? Copy data to temporary lists.
  for (int i = 0; i < leftLength; i++) {
    leftList[i] = list[start + i];
  }

  for (int j = 0; j < rightLength; j++) {
    rightList[j] = list[midPoint + 1 + j];
  }

  i = j = 0;
  k = start;
  //? Compare elements and merge the subList.
  while (i < leftLength && j < rightLength) {
    if (leftList[i] <= rightList[j]) {
      list[k] = leftList[i];
      i++;
    } else {
      list[k] = rightList[j];
      j++;
    }
    k++;
  }

  //? move remain items
  while (i < leftLength) {
    list[k] = leftList[i];
    i++;
    k++;
  }

  while (j < rightLength) {
    list[k] = rightList[j];
    j++;
    k++;
  }
}
