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
    return BlocBuilder<RootBloc, RootState>(
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
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.allUsers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.allUsers[index]),
                      textColor: Theme.of(context).colorScheme.tertiary,
                    );
                  },
                ),
              ),
              ActionButton(
                text: 'Add new user',
                onPressed: () async {
                  final result = await AddUserBottomSheet.show(context);

                  print(result);

                  if (result != null && result.isNotEmpty) {
                    if (!context.mounted) return;
                    context.read<RootBloc>().addUser(result);
                  }
                },
              ),
              SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}
