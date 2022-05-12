import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomePage(
        "Flutter 3.0",
        key: Key('Key1'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage(this.title, {super.key});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentIndex = 0;
  String hier = 'hier me';
  String profile = 'visit profile';
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: NavigationBar(
        destinations: destinations,
        selectedIndex: _curentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _curentIndex = index;
          });
        },
      ),
      drawer: drawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 7.0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello!",
                      style: textTheme.displayMedium,
                    ),
                    Text(
                      "I am Kishor KC!",
                      style: textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () => openhierDialog(hier),
                          child: Text(hier),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.06,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () => openprofileDialog(profile),
                          child: Text(profile),
                        ),
                      ],
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openhierDialog(String titName) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(titName),
            content: const Text(
              "Thank you for Hier Me!",
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('yes'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('no'),
              ),
            ],
          );
        });
  }

  void openprofileDialog(String proName) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(proName),
            content: const Text("Thank you for connecting!"),
            actions: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: const Text('facebook'),
                icon: const Icon(
                  Icons.face,
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: const Text(
                  'instagram',
                ),
                icon: const Icon(
                  Icons.install_mobile,
                ),
              ),
            ],
          );
        });
  }

  List<Widget> destinations = const [
    NavigationDestination(
      icon: Icon(
        Icons.home,
      ),
      selectedIcon: Icon(
        Icons.home,
      ),
      label: "Home",
    ),
    NavigationDestination(
      icon: Icon(
        Icons.settings,
      ),
      selectedIcon: Icon(
        Icons.settings,
      ),
      label: "Settings",
    ),
    NavigationDestination(
      icon: Icon(
        Icons.people,
      ),
      selectedIcon: Icon(
        Icons.people,
      ),
      label: "Profile",
    ),
  ];

  Widget drawer() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text('kishor kc'),
            accountEmail: Text('kishor@test.com'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
          ),
        ],
      ),
    );
  }
}
