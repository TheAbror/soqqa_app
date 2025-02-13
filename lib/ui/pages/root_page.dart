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
  final discountPercent = TextEditingController();
  final deliveryAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootBloc, RootState>(
      listener: (context, state) {
        //

        if (state.isResultReady) {
          resultDialog(context, state);
        }
      },
      builder: (context, state) {
        return SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      ExpenseNameAndAmount(
                        expenseName: 'Full amount',
                        fullAmount: fullAmount,
                      ),
                      ExpenseNameAndAmount(
                        expenseName: 'Discount rate (%)',
                        fullAmount: discountPercent,
                      ),
                      ExpenseNameAndAmount(
                        expenseName: 'Delivery amount',
                        fullAmount: deliveryAmount,
                      ),
                      state.selectedUsers.isEmpty
                          ? SizedBox(
                              height: 200.h,
                              child: Center(
                                child: Text('Select users to start'),
                              ),
                            )
                          : ListOfSelectedUsers(state: state),
                      SizedBox(height: 200.h),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: 8.w,
                  right: 8.w,
                  child: Column(
                    children: [
                      ActionButton(
                        isFilled: false,
                        text: 'Choose users',
                        onPressed: () async {
                          final result = await PrimaryBottomSheet.show(
                            context,
                            selectedValues: state.selectedUsers,
                            initialList: state.allUsers,
                          );

                          if (result != null && result.isNotEmpty) {
                            if (!context.mounted) return;
                            context.read<RootBloc>().addMultipleUsers(result);
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      ActionButton(
                        text: 'Calculate',
                        onPressed: () {
                          final fullOrderAmount = fullAmount.text;
                          final discountPercentage = discountPercent.text;
                          final deliverySum = deliveryAmount.text;

                          context.read<RootBloc>().calculate(
                                fullOrderAmount,
                                discountPercent: discountPercentage,
                                deliverySum: deliverySum,
                              );
                        },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
