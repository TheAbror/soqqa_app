import 'package:soqqa_app/widget_imports.dart';

class DefaultBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback action;
  final VoidCallback? backAction;
  final String actionText;
  final bool isActionEnabled;
  final bool isActionAvailable;
  final bool isCloseAvailable;
  final double heightRatio;
  final bool? isConfirmationNeeded;

  const DefaultBottomSheet({
    super.key,
    required this.title,
    required this.child,
    required this.action,
    this.backAction,
    this.actionText = 'Save',
    this.isActionEnabled = false,
    this.isActionAvailable = true,
    this.isCloseAvailable = true,
    this.heightRatio = 0.55,
    this.isConfirmationNeeded = false,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * heightRatio +
            MediaQuery.of(context).viewInsets.bottom,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: 12.h,
                    right: 16.w,
                    left: 16.w,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isCloseAvailable
                              ? GestureDetector(
                                  onTap: backAction ??
                                      () => Navigator.pop(context),
                                  behavior: HitTestBehavior.opaque,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.h, bottom: 8.h, right: 8.h),
                                    child: Icon(IconsaxPlusLinear.arrow_left),
                                  ),
                                )
                              : const SizedBox(),
                          if (isConfirmationNeeded == true)
                            isActionAvailable
                                ? GestureDetector(
                                    onTap: isActionEnabled ? action : null,
                                    behavior: HitTestBehavior.opaque,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.h, bottom: 8.h, left: 8.h),
                                      child: Text(
                                        actionText,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: isActionEnabled
                                              ? AppColors.primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(width: 25.w)
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
