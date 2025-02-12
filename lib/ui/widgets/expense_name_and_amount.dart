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
