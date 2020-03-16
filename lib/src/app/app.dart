part of mmoons;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      Provider<AppStore>(create: (_) => AppStore()),
      Provider<AuthStore>(create: (_) => AuthStore())
    ],
    child: MaterialApp(
      title: 'Gamendar',
      home: AppContainer(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        accentColor: Colors.redAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.redAccent
        )
      ),
    ),
  );
}