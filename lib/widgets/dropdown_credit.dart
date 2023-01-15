import 'package:flutter/material.dart';

import '../data/grades_data.dart';

class CreditDD extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDD({ required this.onCreditSelected, super.key});

  @override
  State<CreditDD> createState() => _CreditDDState();
}

class _CreditDDState extends State<CreditDD> {
  double selectedForCredit = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.blue.shade200.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: DropdownButton<double>(
        iconEnabledColor: Colors.blue.shade200,
        value: selectedForCredit,
        elevation: 16,
        onChanged: (value){
          setState(() {
            selectedForCredit = value!;
            widget.onCreditSelected(value);
          });
        },
        underline: Container(),
        items: GradeData.allCredits(),
    ),
    );
  }
}