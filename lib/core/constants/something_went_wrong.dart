import 'package:soqqa_app/widget_imports.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something went wrong',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
