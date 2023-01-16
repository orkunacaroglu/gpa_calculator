import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_average_calculator/data/grades_data.dart';
import 'package:grade_average_calculator/widgets/average_result.dart';
import 'package:grade_average_calculator/widgets/dropdown_credit.dart';
import 'package:grade_average_calculator/widgets/dropdown_grade.dart';
import 'package:grade_average_calculator/widgets/lesson_list_bottom.dart';

import '../model/lesson.dart';


class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  double selectedForGrades = 4;
  double selectedForCredit = 1;
  String selectedLessonName = '';
var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Center(
          child: Text('Grade Avarage Calculator',
          style: GoogleFonts.robotoCondensed(fontSize: 28.0, fontWeight: FontWeight.w900 ,color: Colors.blue),
          )
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: averageResult(lesson: GradeData.addedLessons.length,result: GradeData.calculation()),
          ),
          Expanded(
            flex: 3,
            child: _createForm()),
          Expanded(
            flex: 8,
            child: LessonListBottom(
              onDismiss: (index){
                GradeData.addedLessons.removeAt(index);
                setState(() {
                  
                });

              },
            ),
            ), 
      ],)
    );
  }
  
  _createForm() {
    return Form(
      key: keyForm,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 14), child: _createFormField(),),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 30), 
                child: GradeDD(
                  onGradeSelected: (grade){
                    selectedForGrades = grade;
                  },
                ),),
              ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 30), 
                child: CreditDD(
                  onCreditSelected: (credit){
                    selectedForCredit = credit;
                  },
                ),),
              ),
              IconButton(
                onPressed: _addLessonsAndCalculate, 
                icon: Icon(Icons.add_circle),
                color: Colors.blue,
                iconSize: 65,
              ),
            ],
          ),
          SizedBox(height: 5,),
        ]),
    );
  }
  
  _createFormField() {
    return TextFormField(
      onSaved: (value){
        setState(() {
          selectedLessonName = value!;
        });
      },
      validator: (s){
        if(s!.length <= 0){
          return 'Please enter a lesson name!';
        } else
          return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
        hintText: 'Lessons',
        filled: true,
        fillColor: Colors.blueAccent.shade200.withOpacity(0.2),

      ),
    );
  }
  
  void _addLessonsAndCalculate() {
    if(keyForm.currentState!.validate()){
      keyForm.currentState!.save();
      var addLesson = Lesson(lesson_name: selectedLessonName, lesson_grade: selectedForGrades, lesson_credit: selectedForCredit);
      GradeData.addLesson(addLesson);
      setState(() {
        
      });
    }
  }
}
