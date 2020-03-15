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
      //theme: AppModel.of(context).theme.getThemeData(),
      home: MainContainer(),
    ),
  );
}