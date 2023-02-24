import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_task/ui/widgets/change_color_screen/background_color_change_model.dart';
import 'package:solid_task/ui/widgets/change_color_screen/background_color_change_widget.dart';

/// MyApp
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BackgroundColorChangeModel>(
      create: (_) => BackgroundColorChangeModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BackgroundColorChangeWidget(),
      ),
    );
  }
}
