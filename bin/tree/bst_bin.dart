import 'package:dart_dsa/tree/binary_search_tree.dart';
import 'package:dart_dsa/tree/binary_tree.dart';

void main() {
  BinarySearchTree<int> tree = BinarySearchTree();

  tree.insert(3);
  tree.insert(5);
  tree.insert(4);

  print(tree);
}

/// Challenge 1: Binary Tree or Binary Search Tree?
// Write a function that checks if a binary tree is a binary search tree.
extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {
  bool isBinarySearchTree() {
    return _isBST(this, min: null, max: null);
  }

  bool _isBST(BinaryNode<E>? tree, {E? min, E? max}) {
    if (tree == null) return true;
    if (min != null && tree.value.compareTo(min) < 0) {
      return false;
    } else if (max != null && tree.value.compareTo(max) >= 0) {
      return false;
    }
    return _isBST(tree.leftChild, min: min, max: tree.value) &&
        _isBST(tree.rightChild, min: tree.value, max: max);
  }
}

/// Challenge 2: Equality
// Given two binary trees, how would you test if they are equal or not?
bool treesEqual(BinarySearchTree first, BinarySearchTree second) {
  return _isEqual(first.root, second.root);
}

bool _isEqual(BinaryNode? first, BinaryNode? second) {
  if (first == null || second == null) {
    return first == null && second == null;
  }
  return first.value == second.value &&
      _isEqual(first.leftChild, second.leftChild) &&
      _isEqual(first.rightChild, second.rightChild);
}

/// Challenge 3: Is it a Subtree?
// Create a method that checks if the current tree contains all the elements of another tree.
extension Subtree<E> on BinarySearchTree {
  bool containsSubtree(BinarySearchTree subtree) {
    Set set = <E>{};
    root?.traverseInOrder((value) {
      set.add(value);
    });
    var isEqual = true;
    subtree.root?.traverseInOrder((value) {
      isEqual = isEqual && set.contains(value);
    });
    return isEqual;
  }
}
