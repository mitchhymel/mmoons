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
    SearchPage()
  ];

  void _onSettingsClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => SettingsPage()
    ));
  }

  void _onCreateProgramClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) => CreateProgramPage()
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
          icon: Icon(Icons.search),
          title: Text('Search'),
        )
      ]
    );

    var fab =  _selectedIndex != 2 ? null : FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        if (_selectedIndex == 2) {
          _onCreateProgramClicked(context);
        }
      },
    );

    return Scaffold(
      appBar: appBar,
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: fab,
    );
  }
}