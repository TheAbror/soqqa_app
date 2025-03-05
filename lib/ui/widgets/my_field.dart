import 'package:soqqa_app/widget_imports.dart';

class MyField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const MyField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.w,
      width: 60.w,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
