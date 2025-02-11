import 'package:soqqa_app/widget_imports.dart';

class SearchInput extends StatelessWidget {
  /// Constructor
  final TextEditingController controller;
  final dynamic validator;
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final bool? isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double width;
  final Color fillColor;
  final Function(String)? onChanged;

  const SearchInput({
    super.key,
    required this.controller,
    required this.width,
    required this.fillColor,
    this.validator,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.isEnabled,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
      child: TextFormField(
        obscureText: isPassword,
        enabled: isEnabled,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 2.h),
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              right: 8.w,
              bottom: 10.h,
              top: 10.h,
              left: 12.w,
            ),
            child: Icon(IconsaxPlusLinear.search_normal),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.iconSecondary,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryFixed
                  .withOpacity(0.15),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(24.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.w),
            borderRadius: BorderRadius.circular(24.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
            borderRadius: BorderRadius.circular(24.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
      ),
    );
  }
}
