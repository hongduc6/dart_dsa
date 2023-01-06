part of 'queue.dart';

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

class RingBuffer<E> {
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);

  final List<E?> _list;

  int _writeIndex = 0;
  int _readIndex = 0;
  int _size = 0;

  bool get isFull => _size == _list.length;

  bool get isEmpty => _size == 0;

  void write(E element) {
    if (isFull) throw Exception('Buffer is full');
    _list[_writeIndex] = element;
    _writeIndex = _advance(_writeIndex);
    _size++;
  }

  /// Move the pointer to the next position in ring.
  int _advance(int index) {
    return (index == _list.length - 1) ? 0 : index + 1;
  }

  /// Move the read pointer and return read item.
  E? read() {
    if (isEmpty) return null;
    final element = _list[_readIndex];
    _readIndex = _advance(_readIndex);
    _size--;
    return element;
  }

  /// Get read item without popping it.
  E? get peek => (isEmpty) ? null : _list[_readIndex];

  @override
  String toString() {
    final text = StringBuffer();
    text.write('[');
    int index = _readIndex;
    while (index != _writeIndex) {
      if (index != _readIndex) {
        text.write(', ');
      }
      text.write(_list[index % _list.length]);
      index++;
    }
    text.write(']');
    return text.toString();
  }
}
