part of mmoons;

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthStore auth = Provider.of<AuthStore>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => auth.login(),
              child: Text('Login with Google'),
            ),
          ],
        ),
      )
    );
  }
}