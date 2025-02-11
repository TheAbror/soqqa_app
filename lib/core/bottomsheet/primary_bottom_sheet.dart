import 'package:soqqa_app/widget_imports.dart';

class PrimaryBottomSheet extends StatelessWidget {
  final String title;
  final double heightRatio;

  const PrimaryBottomSheet({
    super.key,
    required this.title,
    required this.heightRatio,
  });

  static Future<List<String>?> show(
    BuildContext parentContext, {
    required String title,
    required double heightRatio,
    required String selectedValue,
    required List<String> initialList,
  }) async {
    return showModalBottomSheet<List<String>>(
      backgroundColor: Theme.of(parentContext).colorScheme.background,
      context: parentContext,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => BottomSheetDataBloc(
            initialValue: selectedValue,
            initialList: initialList,
          ),
          child: PrimaryBottomSheet(
            title: title,
            heightRatio: heightRatio,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return DefaultBottomSheet(
          title: title,
          heightRatio: heightRatio,
          isActionEnabled: true,
          actionText: 'Save',
          isActionAvailable: true,
          action: () {
            Navigator.pop(context, state.selectedUsers);
          },
          child: BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
            builder: (context, state) {
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                return const PrimaryBottomSheetLoader();
              }

              return _Body();
            },
          ),
        );
      },
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return Column(
          children: [
            Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 1.h,
              thickness: 1.h,
            ),

            Expanded(
              child: BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
                builder: (context, state) {
                  if (state.blocProgress == BlocProgress.IS_LOADING) {
                    return const PrimaryLoader();
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 8.w,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.initialList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = state.initialList[index];

                      final isSelected = state.selectedUsers.contains(item);

                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          context
                              .read<BottomSheetDataBloc>()
                              .selectUsersToStartCalculations(item);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 4.h),
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Row(
                            children: [
                              CustomCheckbox(
                                isAttended: isSelected,
                                onChanged: () {
                                  context
                                      .read<BottomSheetDataBloc>()
                                      .selectUsersToStartCalculations(item);
                                },
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                item,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 12.h,
              ),
              child: ActionButton(
                text: 'Add new user',
                onPressed: () async {
                  final result = await AddUserBottomSheet.show(context);

                  debugPrint(result);

                  if (result != null && result.isNotEmpty) {
                    if (!context.mounted) return;
                    context.read<RootBloc>().addUser(result);
                  }
                },
              ),
            ),
            // INFO: Always needed for Scrollable Bottom sheets
            SizedBox(height: 40.h),
          ],
        );
      },
    );
  }
}
