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
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(child: HomeTab()),
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
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              ExpenseNameAndAmount(
                expenseName: 'Full amount',
                fullAmount: fullAmount,
              ),
              ExpenseNameAndAmount(
                expenseName: 'Discount rate amount',
                fullAmount: discountAmount,
              ),
              ExpenseNameAndAmount(
                expenseName: 'Deivery amount',
                fullAmount: deliveryAmount,
              ),
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
                                    context.read<RootBloc>().removeUser(index);
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
              Buttons(state: state),
            ],
          );
        },
      ),
    );
  }
}
