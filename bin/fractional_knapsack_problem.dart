void main() {
  List<int> values = [4, 9, 12, 11, 6, 5];
  List<int> weights = [1, 2, 10, 4, 3, 5];

  List<Item> items = [];

  for (int i = 0; i < values.length; i++) {
    Item newItem = Item(values[i].toDouble(), weights[i], '#$i');
    items.add(newItem);
  }
  mergeSort(items, 0, items.length - 1);

  Print.printArray(items);

  Knapsack bag = Knapsack(maxCapacity: 12, items: []);
  int j = 0;
  while (bag.currentCapacity < bag.maxCapacity && j < items.length) {
    bag.addItem(items[j]);
    j++;
  }

  Print.printItems(bag);
}

class Knapsack {
  int maxCapacity;
  int currentCapacity;
  double totalValue;
  List<Item>? items;

  Knapsack({
    this.maxCapacity = 0,
    this.currentCapacity = 0,
    this.totalValue = 0,
    this.items,
  });

  void addItem(Item item) {
    if (item.weight > maxCapacity - currentCapacity) {
      var diff = maxCapacity - currentCapacity;
      item.weight = diff;
      item.value = diff * item.ratio;
    }
    items?.add(item);
    currentCapacity += item.weight;
    totalValue += item.value;
  }
}

class Item {
  double value;
  int weight;
  String name;
  double ratio = 0.0;

  Item(this.value, this.weight, this.name) {
    ratio = value / weight;
  }
}

void mergeSort(List<Item> list, int start, int end) {
  if (end <= start) return;
  int midPoint = (end + start) ~/ 2;
  mergeSort(list, start, midPoint);
  mergeSort(list, midPoint + 1, end);
  merge(list, start, midPoint, end);
}

void merge(List<Item> list, int start, int midPoint, int end) {
  int i, j, k;
  int leftLength = midPoint - start + 1;
  int rightLength = end - midPoint;
  List<Item> leftList = List<Item>.filled(leftLength, Item(0, 0, ''));
  List<Item> rightList = List<Item>.filled(rightLength, Item(0, 0, ''));
  for (int i = 0; i < leftLength; i++) {
    leftList[i] = list[start + i];
  }
  for (int j = 0; j < rightLength; j++) {
    rightList[j] = list[midPoint + 1 + j];
  }
  i = j = 0;
  k = start;
  while (i < leftLength && j < rightLength) {
    if (leftList[i].ratio >= rightList[j].ratio) {
      list[k] = leftList[i];
      i++;
    } else {
      list[k] = rightList[j];
      j++;
    }
    k++;
  }
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

class Print {
  static void printItems(Knapsack bag) {
    print('----------------------------');
    print('total value: ${bag.totalValue}');
    print('current capacity: ${bag.currentCapacity}');
    print('items:');
    print('n\tv\tw');
    for (int i = 0; i < bag.items!.length; i++) {
      print(
          '${bag.items![i].name}\t${bag.items![i].value}\t${bag.items![i].weight}');
    }
  }

  static void printArray(List<Item> items) {
    print('n\tv\tw\tr');
    for (int i = 0; i < items.length; i++) {
      print(
          '${items[i].name}\t${items[i].value}\t${items[i].weight}\t${items[i].ratio}');
    }
  }
}
