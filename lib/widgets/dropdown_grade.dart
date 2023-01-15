import 'package:flutter/material.dart';

import '../data/grades_data.dart';

class GradeDD extends StatefulWidget {
    final Function onGradeSelected;
  const GradeDD({required this.onGradeSelected, super.key});

  @override
  State<GradeDD> createState() => _GradeDDState();
}

class _GradeDDState extends State<GradeDD> {
  double selectedForGrades = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue.shade200.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButton<double>(
        iconEnabledColor: Colors.blue.shade200,
        value: selectedForGrades,
        elevation: 16,
        onChanged: (value){
          setState(() {
            selectedForGrades = value!;
            widget.onGradeSelected(selectedForGrades);
          });
        },
        underline: Container(),
        items: GradeData.allGrades(),
    ),
    );
  }
}