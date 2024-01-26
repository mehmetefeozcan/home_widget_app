import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:home_widget_app/constant/app_constants.dart';
import 'package:home_widget_app/model/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// New: add this function
void updateHomeWidget(NewsModel newHeadline) {
  HomeWidget.saveWidgetData<String>('widget_title', newHeadline.title);
  HomeWidget.saveWidgetData<String>('widget_desc', newHeadline.description);
  HomeWidget.updateWidget(
    iOSName: AppConstanst.iOSWidgetName,
    androidName: AppConstanst.androidWidgetName,
  );
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();

    HomeWidget.setAppGroupId(AppConstanst.appGroupId);

    /*  updateHomeWidget(
      NewsModel(
        title: "Deneme $count",
        description: "Test açıklaması $count",
      ),
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            count++;
            updateHomeWidget(
              NewsModel(
                title: "Deneme $count",
                description: "Test açıklaması $count",
              ),
            );
          },
          child: const Text("update home widget data"),
        ),
      ),
    );
  }
}
