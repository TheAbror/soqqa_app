import 'package:soqqa_app/widget_imports.dart';

class PrimaryBottomSheet extends StatelessWidget {
  const PrimaryBottomSheet({super.key});

  static Future<List<String>?> show(
    BuildContext parentContext, {
    required List<String> selectedValues,
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
            initialList: initialList,
            selectedValues: selectedValues,
          ),
          child: PrimaryBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return DefaultBottomSheet(
          title: 'All users',
          heightRatio: 0.8,
          isActionEnabled: true,
          actionText: 'Save',
          isActionAvailable: true,
          action: () {
            Navigator.pop(context, state.selectedUsers);
          },
          child: _Body(),
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
              child: ListView.builder(
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<BottomSheetDataBloc>()
                                  .removeUser(index);
                            },
                            child: Icon(
                              IconsaxPlusLinear.user_remove,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<RootBloc>().clearDB();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Clear all'),
                  Icon(
                    IconsaxPlusLinear.user_remove,
                    color: AppColors.primary,
                  ),
                ],
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
                    context.read<RootBloc>().addNewUser(result);
                    context.read<BottomSheetDataBloc>().addUser(result);
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
