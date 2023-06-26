import 'package:flutter/material.dart';
import 'package:moodle/view/app/views.dart';
import 'package:moodle/view/components/bottom_navigation_bar.dart';

class AppIndexView extends StatelessWidget {
  static const String name = 'app_index_view';
  final Widget childView;
  const AppIndexView({super.key,required this.childView});

  final viewRoutes = const <Widget> [
    HomeView(),
    ConversationView(),
    CourseView(),
    CoursesListView(),
    MessagesListView(),
    NotificationListView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: BottomNavigation(),
    );
  }
}