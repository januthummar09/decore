class DropdownItem {
  final int id;
  final String name;

  DropdownItem({required this.id, required this.name});
}

List<DropdownItem> _items = [
  DropdownItem(id: 1, name: 'Option 1'),
  DropdownItem(id: 2, name: 'Option 2'),
  DropdownItem(id: 3, name: 'Option 3'),
];
