part of 'queue.dart';

class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[]; // Use to dequeue
  final _rightStack = <E>[]; // Use to enqueue

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  E? dequeue() {
    // Only transfer items from right stack when left stack is empty
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed); // Reverse is O(n) operation
      _rightStack.clear();
    }

    if (_leftStack.isEmpty) return null;
    return _leftStack.removeLast();
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;
}
