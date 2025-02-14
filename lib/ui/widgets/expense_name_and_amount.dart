import 'package:soqqa_app/widget_imports.dart';

class ExpenseNameAndAmount extends StatelessWidget {
  final String expenseName;
  final TextEditingController fullAmount;

  const ExpenseNameAndAmount({
    super.key,
    required this.expenseName,
    required this.fullAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.title3(expenseName, AppColors.float),
            MyField(controller: fullAmount),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class ExpenseNameAndAmountForDiscount extends StatelessWidget {
  final String expenseName;
  final TextEditingController fullAmount;
  final void Function()? onTap;
  final Key tooltipkey;

  const ExpenseNameAndAmountForDiscount({
    super.key,
    required this.expenseName,
    required this.fullAmount,
    required this.onTap,
    required this.tooltipkey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Tooltip(
              key: tooltipkey,
              triggerMode: TooltipTriggerMode.manual,
              showDuration: const Duration(seconds: 1),
              message:
                  'This field applies discounts: below 100 as soum, 100+ as a percentage.',
              child: AppText.title3(expenseName, AppColors.float),
            ),
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Icon(
                IconsaxPlusLinear.info_circle,
                color: AppColors.primary,
              ),
            ),
            Spacer(),
            MyField(controller: fullAmount),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
