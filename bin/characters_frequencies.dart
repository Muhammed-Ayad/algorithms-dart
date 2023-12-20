void main(List<String> args) {
  String message = "hello world";
  CharFreq.asciiMethodWithList(message);
  CharFreq.asciiMethodWithMap(message);
}

class CharFreq {
  static void asciiMethodWithList(String message) {
    print("asciiMethodWithList");
    List ascii = List<int>.filled(127, 0);
    for (var i = 0; i < message.length; i++) {
      String char = message[i];
      var asciiValue = char.codeUnitAt(0);
      ascii[asciiValue]++;
    }
    for (var i = 0; i < ascii.length; i++) {
      if (ascii[i] > 0) {
        String char = String.fromCharCode(i);

        print("${ascii[i]} : $char");
      }
    }
  }

  static void asciiMethodWithMap(String message) {
    print("asciiMethodWithMap");
    Map map = {};
    for (var i = 0; i < message.length; i++) {
      if (map[message[i]] == null) {
        map[message[i]] = 1;
      } else {
        map[message[i]] = map[message[i]] + 1;
      }
    }
    for (var i in map.keys) {
      print("${map[i]} : $i");
    }
    sortMap(map);
  }

  static void sortMap(Map map) {
    List<List<int>> freqArray =
        List.generate(map.length, (_) => List<int>.filled(2, 0));
    int i = 0;
    for (String key in map.keys) {
      freqArray[i][0] = key.codeUnitAt(0);
      freqArray[i][1] = map[key];
      i++;
    }
    print("multiList ...");
    print(freqArray);

    _sort(freqArray, 0, map.length - 1);

    print("Print Sorted data ...");
    for (i = 0; i < map.length; i++) {
      print('${String.fromCharCode(freqArray[i][0])} ${freqArray[i][1]}');
    }
  }

  static void _sort(List<List<int>> array, int start, int end) {
    if (end <= start) return;

    int midPoint = (end + start) ~/ 2;
    _sort(array, start, midPoint);
    _sort(array, midPoint + 1, end);
    _merge(array, start, midPoint, end);
  }

  static void _merge(List<List<int>> array, int start, int mid, int end) {
    int i, j, k;
    int leftLength = mid - start + 1;
    int rightLength = end - mid;

    List<List<int>> leftArray =
        List.generate(leftLength, (_) => List<int>.filled(2, 0));

    List<List<int>> rightArray =
        List.generate(rightLength, (_) => List<int>.filled(2, 0));

    for (i = 0; i < leftLength; i++) {
      leftArray[i][0] = array[start + i][0];
      leftArray[i][1] = array[start + i][1];
    }

    for (j = 0; j < rightLength; j++) {
      rightArray[j][0] = array[mid + 1 + j][0];
      rightArray[j][1] = array[mid + 1 + j][1];
    }

    i = 0;
    j = 0;
    k = start;

    while (i < leftLength && j < rightLength) {
      if (leftArray[i][1] <= rightArray[j][1]) {
        array[k][0] = leftArray[i][0];
        array[k][1] = leftArray[i][1];
        i++;
      } else {
        array[k][0] = rightArray[j][0];
        array[k][1] = rightArray[j][1];
        j++;
      }
      k++;
    }

    while (i < leftLength) {
      array[k][0] = leftArray[i][0];
      array[k][1] = leftArray[i][1];
      i++;
      k++;
    }
    
    while (j < rightLength) {
      array[k][0] = rightArray[j][0];
      array[k][1] = rightArray[j][1];
      j++;
      k++;
    }
  }
}
