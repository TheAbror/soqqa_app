import 'package:soqqa_app/widget_imports.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final VoidCallback onPressed;
  final int? radius;
  final int? padding;

  const ActionButton({
    super.key,
    required this.text,
    this.isFilled = true,
    this.radius = 40,
    this.padding = 14,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius!.r),
      color: isFilled ? AppColors.primary : Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius!.r),
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: padding!.w,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!.r),
            border: Border.all(
              color: AppColors.primary,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: 15.sp,
                color: isFilled ? AppColors.onPrimary : AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
