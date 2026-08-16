import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAN Shop',
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ---------------- HOME PAGE ----------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=1000',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                // SAN shop Banner
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text(
                    'SAN shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Logo Section
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.sports_esports,
                          size: 90,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'MOBILE LEGENDS',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.black,
                            color: Colors.amber.shade300,
                            shadows: const [
                              Shadow(blurRadius: 10, color: Colors.black, offset: Offset(2, 2))
                            ],
                          ),
                        ),
                        const Text(
                          '5v5 Fair AOS for Mobile',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                // Buttons Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildRedButton(context, 'Hero story', const HeroStoryPage()),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: _buildRedButton(context, 'Diamonds', const DiamondsPage()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: _buildRedButton(context, 'itemအကြောင်း', const ItemInfoPage()),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: _buildRedButton(context, 'Uc', const UcPage()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRedButton(BuildContext context, String text, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFF3B30),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- 1. HERO STORY PAGE ----------------
class HeroStoryPage extends StatelessWidget {
  const HeroStoryPage({super.key});

  final List<Map<String, String>> heroes = const [
    {'name': 'Alucard', 'role': 'Fighter / Assassin', 'desc': 'A demon hunter who seeks revenge.'},
    {'name': 'Gusion', 'role': 'Assassin / Mage', 'desc': 'A master of blades and agility.'},
    {'name': 'Chou', 'role': 'Fighter', 'desc': 'A martial artist with powerful crowd control.'},
    {'name': 'Layla', 'role': 'Marksman', 'desc': 'A long-range shooter using Malefic Gun.'},
    {'name': 'Tigreal', 'role': 'Tank', 'desc': 'Leader of the Moniyan Knights.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Stories')),
      body: ListView.builder(
        itemCount: heroes.length,
        itemBuilder: (context, index) {
          final hero = heroes[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.amber),
              title: Text(hero['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${hero['role']}\n${hero['desc']}'),
            ),
          );
        },
      ),
    );
  }
}

// ---------------- 2. DIAMONDS PAGE ----------------
class DiamondsPage extends StatelessWidget {
  const DiamondsPage({super.key});

  final List<Map<String, String>> prices = const [
    {'amount': '86 Diamonds', 'price': '2,500 Ks'},
    {'amount': '172 Diamonds', 'price': '5,000 Ks'},
    {'amount': '257 Diamonds', 'price': '7,500 Ks'},
    {'amount': '706 Diamonds', 'price': '20,000 Ks'},
    {'amount': '2195 Diamonds', 'price': '60,000 Ks'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MLBB Diamonds Shop')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: prices.length,
                itemBuilder: (context, index) {
                  final item = prices[index];
                  return Card(
                    color: Colors.blueGrey.shade900,
                    child: ListTile(
                      leading: const Icon(Icons.diamond, color: Colors.cyanAccent),
                      title: Text(item['amount']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(item['price']!, style: const TextStyle(color: Colors.greenAccent, fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              icon: const Icon(Icons.send, color: Colors.white),
              label: const Text('Order via Telegram / Admin', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- 3. ITEM INFO PAGE ----------------
class ItemInfoPage extends StatelessWidget {
  const ItemInfoPage({super.key});

  final List<Map<String, String>> items = const [
    {'name': 'Blade of Despair', 'type': 'Physical', 'desc': 'Increases Physical Attack immensely.'},
    {'name': 'Holy Crystal', 'type': 'Magic', 'desc': 'Significantly increases Magic Power.'},
    {'name': 'Immortality', 'type': 'Defense', 'desc': 'Resurrects hero upon death.'},
    {'name': 'Demon Hunter Sword', 'type': 'Physical', 'desc': 'Great against high HP tanks.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item အကြောင်း')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.shield, color: Colors.orangeAccent),
              title: Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Type: ${item['type']}\n${item['desc']}'),
            ),
          );
        },
      ),
    );
  }
}

// ---------------- 4. UC PAGE ----------------
class UcPage extends StatelessWidget {
  const UcPage({super.key});

  final List<Map<String, String>> ucPrices = const [
    {'amount': '60 UC', 'price': '3,000 Ks'},
    {'amount': '325 UC', 'price': '15,000 Ks'},
    {'amount': '660 UC', 'price': '30,000 Ks'},
    {'amount': '1800 UC', 'price': '80,000 Ks'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PUBG UC Shop')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ucPrices.length,
                itemBuilder: (context, index) {
                  final item = ucPrices[index];
                  return Card(
                    color: Colors.grey.shade900,
                    child: ListTile(
                      leading: const Icon(Icons.monetization_on, color: Colors.amber),
                      title: Text(item['amount']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(item['price']!, style: const TextStyle(color: Colors.amberAccent, fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              label: const Text('Buy UC via Admin', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- OTHER PAGES ----------------
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search items, heroes, prices...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 10),
            Text('SAN Shop User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Welcome to SAN Shop App', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation App'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
