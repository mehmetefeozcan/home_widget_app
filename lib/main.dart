import 'package:home_widget_app/controller/home_widget_controller.dart';
import 'package:home_widget_app/view/home_screen.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask(
    (task, inputData) {
      switch (task) {
        case "simplePeriodicTask":
          HomeWidgetController.updateData();

        default:
      }
      return Future.value(true);
    },
  );
}

void schedulePeriodicTask() {
  print("schedulePeriodicTask");
  String uniqeId = DateTime.now().toString();

  Workmanager().registerPeriodicTask(
    uniqeId,
    "simplePeriodicTask",
    frequency: const Duration(minutes: 15),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
