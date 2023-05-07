import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba técnica',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Prueba técnica',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Top del día'),
            Tab(text: 'Top del mes'),
            Tab(text: 'Mis Tops'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(110, 158, 158, 158),
                    
                  ),
                  child: const Text('Talentos',
                      style: TextStyle(color: Color.fromARGB(255, 47, 33, 243))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey,
                  ),
                  child: const Text('Organizaciones',
                      style: TextStyle(color: Color.fromARGB(255, 47, 33, 243))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                                    
                    foregroundColor: Colors.white, backgroundColor: Colors.grey,
                  ),
                  child: const Text('Vacantes',
                      style: TextStyle(color: Color.fromARGB(255, 47, 33, 243))),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCarousel(title: 'Top 1', itemsCount: 3),
                _buildCarousel(title: 'Top 2', itemsCount: 3),
                _buildCarousel(title: 'Top 3', itemsCount: 3),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home, size: 50,),
                  Icon(Icons.connect_without_contact, size: 50),
                  Icon(Icons.mic_none, size: 50),
                  Icon(Icons.diamond, size: 50),
                  Icon(Icons.person, size: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel({required String title, required int itemsCount}) {
    return ListView.builder(
      itemCount: itemsCount,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            width: 50,
            height: 50,
            color: Colors.grey,
          ),
          title: Text('$title - Item ${index + 1}'),
          subtitle: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
        );
      },
    );
  }
}