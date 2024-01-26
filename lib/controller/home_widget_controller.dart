import 'package:home_widget_app/constant/app_constants.dart';
import 'package:home_widget/home_widget.dart';
import 'dart:math';

class HomeWidgetController {
  static final Random _rnd = Random();

  static String selectTitle() {
    List items = [
      "Merhaba",
      "Selam",
      "Nasılsın?",
      "Günaydın",
      "İyi Günler",
      "İyi Akşamlar",
    ];

    int index = _rnd.nextInt(6);

    return items[index];
  }

  static String selectDesc() {
    List items = [
      "Merhaba",
      "Selam",
      "Nasılsın?",
      "Günaydın",
      "İyi Günler",
      "İyi Akşamlar",
    ];

    int index = _rnd.nextInt(6);

    return items[index];
  }

  static Future<void> updateData() async {
    print("updateData");
    HomeWidget.setAppGroupId(AppConstanst.appGroupId);

    final title = selectTitle();
    final desc = selectDesc();

    HomeWidget.saveWidgetData<String>('widget_title', title);
    HomeWidget.saveWidgetData<String>('widget_desc', desc);

    await HomeWidget.updateWidget(
      iOSName: AppConstanst.iOSWidgetName,
      androidName: AppConstanst.androidWidgetName,
    );
  }
}
