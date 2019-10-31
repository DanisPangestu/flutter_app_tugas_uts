import 'package:flutter/material.dart';
void main() => runApp(MyApp());
//class untuk nama di aplikasi
class MyApp extends StatelessWidget {
  final appTitle = 'pariwisata Bantul ';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
//untuk memberi icon pada aplikasi
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.device_unknown)),
                Tab(icon: Icon(Icons.arrow_forward)),
                Tab(icon: Icon(Icons.add_location)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              tab1(),
              tab2(),
              tab3(),
            ],
          ),
        ),
      ),
    );
  }
}
//kode program untuk memberi snackBar
class tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('ini SnackBar'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
//kode program untuk membuat list
class tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('list pariwisata'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => tab3()),
          );
        },
      ),
    );
  }
}
//kode program unuutk isi list
class tab3 extends StatelessWidget {
  var lokasi = [
    "pantai parangtritis",
    "Jurang Tembelan",
    "Kebun Buah Mangunan",
    "Seribu Batu Songgo Langit",
    "Puncak Becici",
    "Hutan Pinus Pengger",
    "Watu Goyang",
    "Transmart Carrefour Maguwo",
    "Pantai Nglambor",
    "Jogja Bay Waterpark",
    "Kebun Teh Nglinggo",
    "Tebing Breksi",
    "Gumuk Pasir Parangkusumo",
    "Goa Cerme Bantul",
    "Air Terjun Ledok Pokoh"


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list pariwisata bantul"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(lokasi[index]),
          );
        },
        itemCount: lokasi.length,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: MyApp1(),
      drawer: Drawer(
        child: ListView(

          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('drawer'),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                MaterialPageRoute(builder: (context) => tab3());
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
