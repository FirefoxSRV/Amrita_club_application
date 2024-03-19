import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterChipDemo extends StatefulWidget {
  bool isIDEA;
  bool isGDSC;
  bool isIETE;
  bool isASCII;
  bool isElite;
  bool isIntelIOT;
  Function(bool, bool, bool, bool, bool, bool) onUpdateFilterStates;
  // List<Map<String, dynamic>> tagData;
  // List<Map<String, dynamic>> selectedTags;

  FilterChipDemo(
      {super.key,
        required this.isIntelIOT,
        required this.isIDEA,
        required this.isGDSC,
        required this.isIETE,
        required this.isASCII,
        required this.isElite,
        required this.onUpdateFilterStates,
        // required this.selectedTags,
        // required this.tagData
      });

  @override
  FilterChipDemoState createState() => FilterChipDemoState();
}

class FilterChipDemoState extends State<FilterChipDemo> {

  
  @override
  Widget build(BuildContext context) {


    return Wrap(
      spacing: 8.0,
      runSpacing: -4.0,
      alignment: WrapAlignment.center,
      children: [
        FilterChip(
          selectedColor: Color(0xFFea99a2),
          label: const Text(
            'iDEA',
          ),
          selected: widget.isIDEA,
          onSelected: (bool value) {
            setState(() {
              if (!widget.isIDEA) {
                widget.isIDEA = value;
              } else {
                widget.isIDEA = value;
              }
            });
            widget.onUpdateFilterStates(
                widget.isIDEA,
                widget.isGDSC,
                widget.isIETE,
                widget.isASCII,
                widget.isElite,
                widget.isIntelIOT
            );
          },
        ),
        FilterChip(
          selectedColor: Color(0xFFea99a2),
          label: const Text('GDSC'),
          selected: widget.isGDSC,
          onSelected: (bool value) {
            setState(() {
              if (!widget.isGDSC) {
                widget.isGDSC = value;
              } else {
                widget.isGDSC = value;
              }
            });
            widget.onUpdateFilterStates(
                widget.isIDEA,
                widget.isGDSC,
                widget.isIETE,
                widget.isASCII,
                widget.isElite,
                widget.isIntelIOT);
          },
        ),
        FilterChip(
          selectedColor: Color(0xFFea99a2),
          label: const Text('IETE'),
          selected: widget.isIETE,
          onSelected: (bool value) {
            setState(() {
              if (!widget.isIETE) {
                widget.isIETE = value;
              } else {
                widget.isIETE = value;
              }
            });
            widget.onUpdateFilterStates(
                widget.isIDEA,
                widget.isGDSC,
                widget.isIETE,
                widget.isASCII,
                widget.isElite,
                widget.isIntelIOT);
          },
        ),
        FilterChip(
          selectedColor: Color(0xFFea99a2),
          label: const Text('ASCII'),
          selected: widget.isASCII,
          onSelected: (bool value) {
            setState(() {
              if (!widget.isASCII) {
                widget.isASCII = value;
              } else {
                widget.isASCII = value;
              }
            });
            widget.onUpdateFilterStates(
                widget.isIDEA,
                widget.isGDSC,
                widget.isIETE,
                widget.isASCII,
                widget.isElite,
                widget.isIntelIOT);
          },
        ),
        FilterChip(
          selectedColor: Color(0xFFea99a2),
          label: const Text('Elite Club'),
          selected: widget.isElite,
          onSelected: (bool value) {
            setState(() {
              if (!widget.isElite) {
                widget.isElite = value;
              } else {
                widget.isElite = value;
              }
            });
            widget.onUpdateFilterStates(
                widget.isIDEA,
                widget.isGDSC,
                widget.isIETE,
                widget.isASCII,
                widget.isElite,
                widget.isIntelIOT);
          },
        ),
        FilterChip(
          selectedColor: Color(0xFFea99a2),
          label: const Text('Intel IOT'),
          selected: widget.isIntelIOT,
          onSelected: (bool value) {
            setState(() {
              widget.isIntelIOT = !widget.isIntelIOT;
            });
            widget.onUpdateFilterStates(
                widget.isIDEA,
                widget.isGDSC,
                widget.isIETE,
                widget.isASCII,
                widget.isElite,
                widget.isIntelIOT);
          },
        ),
      ],
    );
  }
}
