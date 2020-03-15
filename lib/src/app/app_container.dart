part of mmoons;

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthStore auth = Provider.of<AuthStore>(context);
    return Container(
      child: Observer(
        builder: (_) => auth.isLoggedIn ? MainContainer() : SignUpPage(),
      )
    );
  }
}