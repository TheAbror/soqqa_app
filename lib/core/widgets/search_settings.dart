import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:soqqa_app/widget_imports.dart';

class SearchSettings extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;

  const SearchSettings({
    super.key,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          right: 12.r,
          bottom: 10.h,
          top: 10.h,
        ),
        child: Icon(IconsaxPlusLinear.setting),
      ),
    );
  }
}
