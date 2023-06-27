import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/view/app/course_view.dart';

class CoursesListView extends StatelessWidget {
  static const String name = 'courses_list_view';
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: (){
            context.pushNamed(CourseView.name,pathParameters: {
              'id':'1'
            });
          },
        );
      },
    );
  }
}