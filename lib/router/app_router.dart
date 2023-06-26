import 'package:go_router/go_router.dart';
import 'package:moodle/view/app/views.dart';
import 'package:moodle/router/config.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: [
  ShellRoute(
    builder: (context, state, child) {
      return AppIndexView(childView: child,);
    },
    routes: getShellRoutes()
  ),
]);
