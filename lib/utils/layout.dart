import 'package:layout/layout.dart';

extension LayoutGutter on LayoutData {
  double get fluidGutter {
    return fluidMargin > gutter ? fluidMargin : gutter;
  }
}
