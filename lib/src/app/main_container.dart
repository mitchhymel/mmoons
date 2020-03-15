part of mmoons;

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) => setState((){ _selectedIndex = index;});
  static List<Widget> _tabs = <Widget>[
    CurrentWeekPage(),
    ProgressPage(),
    CustomizeWorkoutPage()
  ];

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

    var bottomNavBar = BottomNavigationBar(
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.redAccent,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text('Current'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment),
          title: Text('Progress'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          title: Text('Customize'),
        )
      ]
    );

    return Scaffold(
      appBar: appBar,
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNavBar,
    );
  }
}