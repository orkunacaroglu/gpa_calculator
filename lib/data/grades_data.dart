import 'package:flutter/material.dart';
import 'package:grade_average_calculator/model/lesson.dart';

class GradeData{

  static List<Lesson> addedLessons = [];

  static addLesson(Lesson lesson){
    addedLessons.add(lesson);
  }

  static List<String> _allGrades(){
    return ['AA','BA','BB','CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

static double calculation() {
  double totalGrades = 0;
  double totalCredits = 0;

  addedLessons.forEach((index) {
    totalGrades = totalGrades + (index.lesson_credit * index.lesson_grade);
    totalCredits += index.lesson_credit;
  });
  return totalGrades / totalCredits;
}

  static double _gradeTranslation(String grade) {
    switch(grade){
      case 'AA': return 4;
      case 'BA': return 3.5;
      case 'BB': return 3.0;
      case 'CB': return 2.5;
      case 'CC': return 2.0;
      case 'DC': return 1.5;
      case 'DD': return 1.0;
      case 'FD': return 0.5;
      case 'FF': return 0.0;
      default: return 1;
    }
  }
  
  static List<DropdownMenuItem<double>> allGrades(){
    return _allGrades().map((e) => DropdownMenuItem(child: Text(e), value: _gradeTranslation(e),)).toList();
  }

    static List<int> _allCredits(){
    return List.generate(10, (index) => index+1).toList();
  }

  static List<DropdownMenuItem<double>> allCredits(){
    return _allCredits().map((e) => DropdownMenuItem(child: Text(e.toString()), value: e.toDouble(),)).toList();
  }
}