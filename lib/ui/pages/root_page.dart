import 'package:soqqa_app/core/constants/text_named_const_widget.dart';
import 'package:soqqa_app/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootBloc()..getDB(),
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(child: HomeTab()),
          );
        },
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final fullAmount = TextEditingController();
  final discountAmount = TextEditingController();
  final deliveryAmount = TextEditingController();
  final usersOrderAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.title3('Full amount', AppColors.float),
                    MyField(controller: fullAmount),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.title3('Discount rate amount', AppColors.float),
                    MyField(controller: discountAmount),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.title3('Deivery amount', AppColors.float),
                    MyField(controller: deliveryAmount),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: state.selectedUsers.isEmpty
                      ? Center(child: Text('Select users to start'))
                      : ListView.builder(
                          itemCount: state.selectedUsers.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  Text(state.selectedUsers[index]),
                                  SizedBox(width: 8.w),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<RootBloc>()
                                          .removeUser(index);
                                    },
                                    child: Icon(
                                      IconsaxPlusLinear.user_remove,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: MyField(controller: usersOrderAmount),
                              textColor: Theme.of(context).colorScheme.tertiary,
                            );
                          },
                        ),
                ),
                ActionButton(
                  isFilled: false,
                  text: 'Add more users',
                  onPressed: () async {
                    final result = await PrimaryBottomSheet.show(
                      context,
                      title: 'All users',
                      heightRatio: 0.8,
                      selectedValues: state.selectedUsers,
                      initialList: state.allUsers,
                    );

                    if (result != null && result.isNotEmpty) {
                      if (!context.mounted) return;
                      context.read<RootBloc>().addMultipleUsers(result);
                    }
                  },
                ),
                SizedBox(height: 20),
                ActionButton(
                  text: 'Calculate',
                  onPressed: () {},
                ),
                SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyField extends StatelessWidget {
  final TextEditingController controller;

  const MyField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 60,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
        ),
      ),
    );
  }
}
