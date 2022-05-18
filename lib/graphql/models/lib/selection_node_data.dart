import "package:gql/ast.dart";

class SelectionNodeData {
  final bool selected;
  final SelectionSetNode? selectionSet;
  SelectionNodeData({required this.selected, this.selectionSet});
}
