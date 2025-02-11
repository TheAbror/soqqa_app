import 'package:soqqa_app/core/constants/text_named_const_widget.dart';
import 'package:soqqa_app/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final pages = [
    HomeTab(),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootBloc()..getDB(),
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(child: pages[state.tabIndex]),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Settings',
                ),
              ],
              currentIndex: state.tabIndex,
              selectedItemColor: Colors.amber[800],
              onTap: (value) {
                context.read<RootBloc>().selectTabIndex(value);
              },
            ),
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
                    SizedBox(
                      height: 40,
                      width: 60,
                      child: TextField(controller: fullAmount),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.title3('Discount rate amount', AppColors.float),
                    SizedBox(
                      height: 40,
                      width: 60,
                      child: TextField(controller: discountAmount),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.selectedUsers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(state.selectedUsers[index]),
                        trailing: SizedBox(
                          height: 40,
                          width: 60,
                          child: TextField(controller: fullAmount),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     context.read<RootBloc>().removeUser(index);
                        //   },
                        //   child: Icon(
                        //     IconsaxPlusLinear.user_remove,
                        //     color: AppColors.primary,
                        //   ),
                        // ),
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
                      title: 'Add more users',
                      heightRatio: 0.8,
                      selectedValue: '',
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
