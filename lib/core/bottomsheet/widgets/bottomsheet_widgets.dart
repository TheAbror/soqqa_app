import 'package:soqqa_app/widget_imports.dart';

class NewUserTextField extends StatelessWidget {
  final TextEditingController usernameController;

  const NewUserTextField({
    super.key,
    required this.usernameController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        controller: usernameController,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          // context
          //     .read<AuthBloc>()
          //     .updateData(login: usernameController.text.trim());
        },
        decoration: InputDecoration(
          filled: true,
          errorStyle: TextStyle(height: 0.1, fontSize: 12.sp),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: NewColorsDark.borderMuted.withOpacity(0.15), width: 1.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          fillColor: Theme.of(context).colorScheme.onBackground,
          hintText: 'First name',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiaryFixed,
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool isAttended;
  final VoidCallback onChanged;
  final bool isNeutral;

  const CustomCheckbox({
    super.key,
    required this.isAttended,
    required this.onChanged,
    this.isNeutral = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      child: Container(
        margin: EdgeInsets.only(left: 8.w),
        padding: EdgeInsets.all(1.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isAttended ? AppColors.primary : Colors.transparent,
          border: Border.all(
            color: isNeutral
                ? Colors.transparent
                : isAttended
                    ? AppColors.primary
                    : Theme.of(context)
                        .colorScheme
                        .tertiaryFixedDim
                        .withOpacity(0.25),
            width: isNeutral ? 0 : 2,
          ),
        ),
        child: Center(
          child: isNeutral
              ? Icon(
                  Icons.remove,
                  color: isAttended ? AppColors.float : Colors.red,
                  size: 18.sp,
                )
              : Icon(
                  isAttended ? Icons.check : Icons.close, // ✅ or ❌
                  color: isAttended ? AppColors.float : Colors.red,
                  size: 16.sp,
                ),
        ),
      ),
    );
  }
}
