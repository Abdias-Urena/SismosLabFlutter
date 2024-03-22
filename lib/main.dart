import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(10.385852901899867, -84.30905736510198);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sismos', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline_rounded),
              color: Colors.orange,
              onPressed: () {},
              padding: EdgeInsets.only(bottom: 20.0),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            tabs: const <Widget>[
              Tab(text: 'MAPA'),
              Tab(text: 'LISTA'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Stack(
              children: [
                GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 7.0,
                    ),
                    markers: {
                      const Marker(
                        infoWindow: InfoWindow(title: 'Campus Liberia'),
                        markerId: MarkerId('Campus Sarapiqui'),
                        position:
                            LatLng(10.319192242799872, -83.92255395750708),
                      ),
                      const Marker(
                        infoWindow: InfoWindow(title: 'Campus Omar Dengo'), 
                        markerId: MarkerId('Campus Omar Dengo'),
                        position: LatLng(9.998944312390936, -84.11190405877555),
                      ),
                      const Marker(
                        infoWindow: InfoWindow(title: 'Campus Benjamin Nuñez'),
                        markerId: MarkerId('Campus Benjamin Nuñez'),
                        position: LatLng(9.970991357976395, -84.127704731104),
                      ),
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Text(
                                      '24 horas',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      color: Colors.white,
                                      icon: const Icon(Icons.replay_outlined),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Text(
                                      '24 horas',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      color: Colors.white,
                                      icon: const Icon(Icons.date_range),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    title: Text('Sismo en México'),
                    subtitle: Text('Hace 2 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Chile'),
                    subtitle: Text('Hace 3 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Japón'),
                    subtitle: Text('Hace 4 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Perú'),
                    subtitle: Text('Hace 5 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Colombia'),
                    subtitle: Text('Hace 6 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Argentina'),
                    subtitle: Text('Hace 7 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Brasil'),
                    subtitle: Text('Hace 8 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Ecuador'),
                    subtitle: Text('Hace 9 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Venezuela'),
                    subtitle: Text('Hace 10 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Bolivia'),
                    subtitle: Text('Hace 11 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Paraguay'),
                    subtitle: Text('Hace 12 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Sismo en Uruguay'),
                    subtitle: Text('Hace 13 horas'),
                    leading: Icon(Icons.warning),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.radar_rounded),
              label: 'Sismos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emergency_share_outlined),
              label: '¿Lo sentiste?',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Más',
            ),
          ],
        ),
      ),
    );
  }
}
