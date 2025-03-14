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
        resizeToAvoidBottomInset: false,
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
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootBloc, RootState>(
      listener: (context, state) async {
        if (state.isResultReady) {
          resultDialog(context, state);
          context.read<RootBloc>().makeIsReadyFalse();
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
                      ExpenseNameAndAmountForDiscount(
                        expenseName: 'Discount rate',
                        fullAmount: discountPercent,
                        tooltipkey: tooltipkey,
                        onTap: () {
                          tooltipkey.currentState?.ensureTooltipVisible();
                        },
                      ),
                      ExpenseNameAndAmount(
                        expenseName: 'Other fees(as delivery. service...)',
                        fullAmount: deliveryAmount,
                      ),
                      if (state.selectedUsers.isNotEmpty)
                        ListOfSelectedUsers(state: state),
                      SizedBox(height: 200.h),
                    ],
                  ),
                ),
                if (state.selectedUsers.isEmpty)
                  Center(
                    child: Text('No users selected'),
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
                          AllUsers? savedUsers =
                              boxAllUsers.get(ShPrefKeys.allUsers);

                          final result = await PrimaryBottomSheet.show(
                            context,
                            selectedValues: state.selectedUsers,
                            //used hive instead of bloc
                            initialList: savedUsers?.allUsers ?? [],
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
                          if (state.selectedUsers.isNotEmpty) {
                            final fullOrderAmount = fullAmount.text;
                            final discountPercentage = discountPercent.text;
                            final deliverySum = deliveryAmount.text;

                            context.read<RootBloc>().calculate(
                                  fullOrderAmount,
                                  discountPercent: discountPercentage,
                                  deliverySum: deliverySum,
                                );
                          } else {
                            showMessage('No-one selcted yet', isError: true);
                          }
                        },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
