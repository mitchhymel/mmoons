part of mmoons;

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthStore auth = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ay'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () => auth.login(),
            child: Text('Login with Google'),
          ),
          Observer(
            builder: (_) => Text('${auth.isLoggedIn ? auth.userName : 'ayy'}'),
          )
        ],
      ),
    );
  }
}