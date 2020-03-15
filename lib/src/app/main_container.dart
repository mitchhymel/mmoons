part of mmoons;

class MainContainer extends StatelessWidget {

  void _onSettingsClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => SettingsPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    AuthStore auth = Provider.of<AuthStore>(context);

    var appBar = AppBar(
      title: Text('mmoons'),
      actions: <Widget>[
        InkWell(
            onTap: () => debugPrint('ay'),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(
                  auth.firebaseUser.photoUrl,
                  fit: BoxFit.fitHeight,
                )
            )
        ),
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _onSettingsClicked(context)
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
        ],
      ),
    );
  }
}