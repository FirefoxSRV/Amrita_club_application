import 'package:flutter/material.dart';


class FilterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: -4.0,
      alignment: WrapAlignment.center,
      children: [
        FilterChip(
          label: const Text('All'),
          selected: true,
          onSelected: (bool value) {

          },
        ),
        FilterChip(
          label: const Text('IETE'),
          selected: true,
          onSelected: (bool value) {

          },
        ),
        FilterChip(
          label: const Text('Technical'),
          selected: true,
          onSelected: (bool value) {

          },
        ),
        FilterChip(
          label: const Text('Non Technical'),
          selected: true,
          onSelected: (bool value) {

          },
        ),
      ],
    );
  }

}