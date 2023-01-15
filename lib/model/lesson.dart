class Lesson{
  final String lesson_name;
  final double lesson_credit;
  final double lesson_grade;

  Lesson( {required this.lesson_name, required this.lesson_credit, required this.lesson_grade});

@override
  String toString() {

    return '$lesson_name $lesson_grade $lesson_credit';
  }
}