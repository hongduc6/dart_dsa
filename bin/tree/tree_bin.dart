import 'package:dart_dsa/queue/queue.dart';
import 'package:dart_dsa/tree/tree.dart';

void main() {
  final TreeNode tree = makeBeverageTree();
  // tree.forEachDepthFirst((node) => print(node.value));
  // tree.forEachLevelOrder(
  //   (node) => print(node.value.toString()),
  // );

  printTreeByLevelOrder(buildTree());
}

/// Challenge 1: Print a tree in level order
///
/// Print all the values in a tree in an order based on their level. Nodes
/// in the same level should be printed on the same line. For example,
/// consider the following tree:
///
///             15
///   ┌─────┼────┐
///   1        17      20
/// ┌─┼─┐   │      ┌┴┐
/// 1  5  0   2      5  7
///
/// Your algorithm should print the following:
///
/// ```
/// 15
/// 1 17 20
/// 1 5 0 2 5 7
/// ```
void printTreeByLevelOrder<T>(TreeNode<T> tree) {
  final result = StringBuffer();

  /// Enqueue by each level
  var queue = QueueStack<TreeNode<T>>();
  var nodesLeftInCurrentLevel = 0;
  queue.enqueue(tree);

  while (!queue.isEmpty) {
    nodesLeftInCurrentLevel = queue.length;

    while (nodesLeftInCurrentLevel > 0) {
      final node = queue.dequeue();
      if (node == null) break;
      result.write('${node.value} ');
      for (var element in node.children) {
        queue.enqueue(element);
      }
      nodesLeftInCurrentLevel -= 1;
    }

    result.write('\n');
  }
  print(result);
}

TreeNode<int> buildTree() {
  return TreeNode(15)
    ..children.addAll([
      TreeNode(1)
        ..children.addAll([
          TreeNode(1),
          TreeNode(5),
          TreeNode(0),
        ]),
      TreeNode(17)
        ..children.addAll([
          TreeNode(2),
        ]),
      TreeNode(20)
        ..children.addAll([
          TreeNode(5),
          TreeNode(7),
        ]),
    ]);
}

makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);

  return tree;
}
