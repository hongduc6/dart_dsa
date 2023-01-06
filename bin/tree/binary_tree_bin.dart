import 'dart:math';
import 'package:dart_dsa/tree/binary_tree.dart';

void main() {
  // createBinaryTree().traverseInOrder((value) => print('$value '));
  // createBinaryTree().traversePreOrder((value) => print('$value '));
  // createBinaryTree().traversePostOrder((value) => print('$value '));
  // print(caculateTreeHeight(createBinaryTree()));
  print(serialize(createBinaryTree()));
  print(deserializeHelper(serialize(createBinaryTree())));
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  return seven;
}

/// Challenge 1: Height of a Tree
int caculateTreeHeight<T>(BinaryNode<T>? node) {
  if (node == null) return -1;
  return 1 +
      max(
        caculateTreeHeight(node.leftChild),
        caculateTreeHeight(node.rightChild),
      );
}

/// Challenge 2: Serialization
extension Serializable<T> on BinaryNode<T> {
  void traversePreOrderWithNull(void Function(T? value) action) {
    action(value);
    if (leftChild == null) {
      action(null);
    } else {
      leftChild!.traversePreOrderWithNull(action);
    }
    if (rightChild == null) {
      action(null);
    } else {
      rightChild!.traversePreOrderWithNull(action);
    }
  }
}

List<T?> serialize<T>(BinaryNode<T> node) {
  final list = <T?>[];
  node.traversePreOrderWithNull((value) => list.add(value));
  return list;
}

BinaryNode<T>? deserialize<T>(List<T?> list) {
  if (list.isEmpty) return null;
  final value = list.removeLast();
  if (value == null) return null;

  final node = BinaryNode<T>(value);
  node.leftChild = deserialize(list);
  node.rightChild = deserialize(list);
  return node;
}

BinaryNode<T>? deserializeHelper<T>(List<T?> list) {
  return deserialize(list.reversed.toList());
}
