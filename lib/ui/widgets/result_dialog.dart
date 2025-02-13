import 'package:intl/intl.dart';
import 'package:soqqa_app/widget_imports.dart';

Future<dynamic> resultDialog(BuildContext context, RootState state) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MMMM-yyyy HH:mm').format(now);

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(30.w),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      SizedBox(width: 20.w),
                      Text(
                        'Check is ready!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.read<RootBloc>().makeIsReadyFalse();
                          Navigator.pop(context);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 1,
                              color: AppColors.primary,
                            ),
                          ),
                          child: Icon(
                            Icons.close,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(formattedDate),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.finalResult.map(
                      (e) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${e.name}:',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Text(
                                '${e.bill} soums',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
