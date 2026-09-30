import 'package:flutter/material.dart';

class ViewToggle extends StatelessWidget {
  const ViewToggle({super.key, required this.isGrid, required this.onChanged});

  final bool isGrid;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<bool>(
      showSelectedIcon: false,
      segments: const <ButtonSegment<bool>>[
        ButtonSegment<bool>(value: false, icon: Icon(Icons.view_list)),
        ButtonSegment<bool>(value: true, icon: Icon(Icons.grid_view)),
      ],
      selected: {isGrid},
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}
