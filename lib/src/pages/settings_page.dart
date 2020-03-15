part of mmoons;

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthStore auth = Provider.of<AuthStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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