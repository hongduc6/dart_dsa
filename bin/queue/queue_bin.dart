import 'package:dart_dsa/linked_list/doubly_linked_list.dart';

void main() {}

enum Direction {
  front,
  back,
}

abstract class Deque<E> {
  bool get isEmpty;

  E? peek(Direction from);

  bool enqueue(E element, Direction to);

  E? dequeue(Direction from);
}

class DequeDoublyLinkedList<E> implements Deque<E> {
  final _list = DoublyLinkedList<E>();

  @override
  E? dequeue(Direction from) {
    switch (from) {
      case Direction.front:
        return _list.pop();
      case Direction.back:
        return _list.removeLast();
    }
  }

  @override
  bool enqueue(E value, Direction to) {
    switch (to) {
      case Direction.front:
        _list.push(value);
        break;
      case Direction.back:
        _list.append(value);
        break;
    }
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? peek(Direction from) {
    switch (from) {
      case Direction.front:
        return _list.head?.value;
      case Direction.back:
        return _list.tail?.value;
    }
  }

  @override
  String toString() => _list.toString();
}
