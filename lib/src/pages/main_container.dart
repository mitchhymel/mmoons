part of mmoons;

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthStore auth = Provider.of<AuthStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('mmoons')
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              onPressed: () => auth.logout(),
              child: Text('Logout')
          ),
          Observer(
            builder: (_) => Text('Hi ${auth.userName}'),
          )
        ],
      ),
    );
  }
}