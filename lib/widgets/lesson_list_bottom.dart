import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_average_calculator/data/grades_data.dart';

import '../model/lesson.dart';
class LessonListBottom extends StatelessWidget {
  final Function onDismiss;
  const LessonListBottom({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = GradeData.addedLessons;
    return allLessons.length > 0 ? 
      ListView.builder(
        itemCount: allLessons.length ,
        itemBuilder: (context, index){
      return Dismissible(
        direction: DismissDirection.startToEnd,
        key: UniqueKey(),
        onDismissed: (x){
          onDismiss(index);
          //GradeData.addedLessons.removeAt(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            child: ListTile(
              title: Text(allLessons[index].lesson_name),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text((allLessons[index].lesson_grade * allLessons[index].lesson_credit).toStringAsFixed(0)),
              ),
              subtitle: Text('Grade: ${allLessons[index].lesson_grade},  ${allLessons[index].lesson_credit} Credit'),
            ),
          ),
        ),
      );
    }) : Container(child: Center(child: Text('Please add a lesson!', style: GoogleFonts.robotoCondensed(fontSize: 30.0, fontWeight: FontWeight.w800, color: Color.fromARGB(172, 244, 65, 55)),)),);
  }
}