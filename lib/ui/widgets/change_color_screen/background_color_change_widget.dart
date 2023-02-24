import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_task/ui/widgets/change_color_screen/background_color_change_model.dart';

/// StateFull Widget that changes background color on tap
class BackgroundColorChangeWidget extends StatelessWidget {
  /// Constructor
  const BackgroundColorChangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<BackgroundColorChangeModel>();
    final backgroundColor = context
        .select((BackgroundColorChangeModel model) => model.backgroundColor);
    final isDark = backgroundColor.computeLuminance() < 0.5;

    return Scaffold(
      body: GestureDetector(
        onTap: model.changeBackgroundColor,
        child: ColoredBox(
          color: backgroundColor,
          child: Center(
            child: Text(
              model.title,
              style: model.titleStyle.copyWith(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
