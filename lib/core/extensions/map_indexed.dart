import 'dart:core';

/// Iterable extensions
extension IterableX<E> on Iterable<E> {
  /// Returns map with index of element
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var index = 0;

    return map((E e) => f(e, index++));
  }

  /// Returns map with index of element
  List<T> mapIndexedToList<T>(T Function(E e, int i) f) {
    var index = 0;

    return map((E e) => f(e, index++)).toList();
  }

  /// Maps the list then returns with toList() method
  List<R> mapToList<R>(R Function(E) convert) => map(convert).toList();
}
