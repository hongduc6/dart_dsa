import 'package:dart_dsa/linked_list/doubly_linked_list.dart';

part 'queue_list.dart';
part 'double_linked_list_queue.dart';
part 'ring_buffer_queue.dart';
part 'double_stack_queue.dart';

abstract class Queue<E> {
  /// Insert an element at the back of the queue. Return true if the operation was successful.
  bool enqueue(E element);

  /// Remove the element at the front of the queue and return it.
  E? dequeue();

  /// Check if the queue is empty.
  bool get isEmpty;

  /// Return the element at the front of the queue without removing it.
  E? get peek;
}
