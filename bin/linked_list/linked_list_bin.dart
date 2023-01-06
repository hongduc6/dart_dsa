import 'package:dart_dsa/linked_list/linked_list.dart';

void main() {
  final list = LinkedList<int>();

  list.push(4);
  list.push(5);
  list.push(6);
  list.push(2);
  list.push(8);
  list.push(3);

  // printReversedLinkedList(list);
  // removeAllOccurrences(list, 2);
  // reverseLinkedList(list);
  findMiddleNode(list);
}

/// Challenge 1: Print in Reverse
void printReversedLinkedList<E>(LinkedList<E> list) {
  printNodesRecursively(list.head);
}

void printNodesRecursively<T>(Node<T>? node) {
  if (node == null) return;
  printNodesRecursively(node.next);
  print(node.value);
}

/// Challenge 2: Find the Middle Node
// Using Floyd Cycle finding algorithm
Node<E>? findMiddleNode<E>(LinkedList<E> list) {
  var tortoise = list.head;
  var hare = list.head;

  while (hare?.next != null) {
    hare = hare?.next?.next;
    tortoise = tortoise?.next;
  }

  print(tortoise?.value);
  return tortoise;
}

/// Challenge 3: Reverse a Linked List
void reverseLinkedList<E>(LinkedList<E> list) {
  print('before: $list');
  list.tail = list.head;
  var previous = list.head;
  var current = list.head?.next;
  previous?.next = null;

  while (current != null) {
    final next = current.next;
    current.next = previous;
    previous = current;
    current = next;
  }

  list.head = previous;
  print('after: $list');
}

/// Challenge 4: Remove all occurrences
void removeAllOccurrences<E>(LinkedList<E> list, E value) {
  var currentNode = list.head;
  while (currentNode?.next != null) {
    if (currentNode?.next?.value == value) {
      list.removeAfter(currentNode!);
      print('remove after ${currentNode.value}');
    } else {
      currentNode = currentNode?.next;
    }
  }

  print(list);
}
