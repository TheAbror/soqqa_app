import 'package:soqqa_app/widget_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesServices.init();

  await Hive.initFlutter();

  Hive.registerAdapter(CurrentUserAdapter());
  Hive.registerAdapter(AllUsersAdapter());

  boxCurrentUser = await Hive.openBox<CurrentUser>(ShPrefKeys.currentUser);
  boxAllUsers = await Hive.openBox<AllUsers>(ShPrefKeys.allUsers);

  setUpLogging();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RootBloc()),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          onGenerateRoute: MainRouteGenerator().generateRoute,
          theme: darkTheme(),
        );
      },
    );
  }
}
