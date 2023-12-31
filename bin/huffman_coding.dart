import 'package:collection/collection.dart';

void main() {
  String msg = "internet";
  Huffman huff = Huffman(msg);

  huff.codes.forEach((String k, String v) {
    print('$k $v');
  });
}

class HeapNode {
  final String data;
  final int freq;
  HeapNode? left;
  HeapNode? right;
  HeapNode(this.data, this.freq);
}

class Huffman {
  final String internalChar = '';
  final Map<String, String> codes = {};

  final minHeap = PriorityQueue<HeapNode>((a, b) => a.freq.compareTo(b.freq));

  Huffman(String message) {
    // Get the chars frequencies
    final freqMap = {};
    for (var i = 0; i < message.length; i++) {
      if (freqMap[message[i]] == null) {
        freqMap[message[i]] = 1;
      } else {
        freqMap[message[i]] = freqMap[message[i]] + 1;
      }
    }
    // Convert Map to PriorityQueue (minHeap)
    freqMap.forEach((key, value) {
      final newNode = HeapNode(key, value);
      minHeap.add(newNode);
    });

    // Build Huffman Tree using PriorityQueue
    while (minHeap.length > 1) {
      final left = minHeap.removeFirst();
      final right = minHeap.removeFirst();
      final newFreq = left.freq + right.freq;
      final top = HeapNode(internalChar, newFreq);
      top.left = left;
      top.right = right;
      minHeap.add(top);
    }
    // Generate Codes
    _generateCodes(minHeap.first, "");
  }
  void _generateCodes(HeapNode? node, String str) {
    if (node == null) {
      return;
    }
    if (node.data != internalChar) {
      codes[node.data] = str;
    }
    _generateCodes(node.left, "${str}0");
    _generateCodes(node.right, "${str}1");
  }
}
