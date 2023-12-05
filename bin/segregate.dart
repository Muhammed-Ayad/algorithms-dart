void main(List<String> args) {
  List<int> array = [9, -5, 12, 10, -9, -2];

  print(array);
  segregate(array, 0, array.length - 1);
  print(array);
}

void segregate(List<int> array, int start, int end) {
  if (end <= start) return;

  int mid = (end + start) ~/ 2;
  segregate(array, start, mid);
  segregate(array, mid + 1, end);
  merge(array, start, mid, end);
}

void merge(List<int> array, int start, int mid, int end) {
  int i, j, k;
  int leftLength = mid - start + 1;
  int rightLength = end - mid;

  List<int> leftArray = List.filled(leftLength, 0);
  List<int> rightArray = List.filled(rightLength, 0);

  for (int i = 0; i < leftLength; i++) {
    leftArray[i] = array[start + i];
  }

  for (int j = 0; j < rightLength; j++) {
    rightArray[j] = array[mid + 1 + j];
  }

  i = j = 0;
  k = start;
  while (i < leftLength && leftArray[i] <= 0) {
    array[k] = leftArray[i];
    i++;
    k++;
  }
  while (j < rightLength && rightArray[j] <= 0) {
    array[k] = rightArray[j];
    j++;
    k++;
  }

  while (i < leftLength) {
    array[k] = leftArray[i];
    i++;
    k++;
  }
  while (j < rightLength) {
    array[k] = rightArray[j];
    j++;
    k++;
  }
}
