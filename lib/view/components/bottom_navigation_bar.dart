import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/router/config.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  getShellRoutes(){
    List<BottomNavigationBarItem> bottomNavigationBarItems = [];
    for (var element in shellRoutes) {
      bottomNavigationBarItems.add(
        BottomNavigationBarItem(icon: element["icon"],label: element['label']),
      );
    }
    return bottomNavigationBarItems;
  }

  goTo(BuildContext context,int index){
    context.goNamed(shellRoutes[index]['name']);
  }

  getPositonRouter(context){
    return shellRoutes.indexWhere((e)=>e["path"] == GoRouterState.of(context).location);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: getPositonRouter(context),
      onTap: (index) => goTo(context,index),
      elevation: 10,
      items: getShellRoutes()
    );
  }
}