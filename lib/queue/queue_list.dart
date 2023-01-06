part of 'queue.dart';

class QueueList<E> implements Queue<E> {
  final List<E> _list = <E>[];

  @override
  E? dequeue() => isEmpty ? null : _list.removeAt(0); // O(n)

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => isEmpty ? null : _list.first;
}
