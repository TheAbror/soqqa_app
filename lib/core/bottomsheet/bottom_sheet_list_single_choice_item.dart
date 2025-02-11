import 'package:soqqa_app/widget_imports.dart';

class BottomSheetListSingleChoiceItem<T> extends StatelessWidget {
  final Color textColor;
  final String itemTitle;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;

  const BottomSheetListSingleChoiceItem({
    super.key,
    required this.itemTitle,
    required this.value,
    this.textColor = Colors.black,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    itemTitle,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    //here change to your color
                    unselectedWidgetColor:
                        Theme.of(context).colorScheme.primary,
                  ),
                  child: Radio(
                    value: value,
                    groupValue: groupValue,
                    activeColor: AppColors.primary,
                    onChanged: onChanged,
                    splashRadius: 40,
                    toggleable: false,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.inversePrimary,
            height: 1.h,
            thickness: 1.h,
          ),
        ],
      ),
    );
  }
}
