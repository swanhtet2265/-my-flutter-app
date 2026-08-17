import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const SanShopApp());
}

class SanShopApp extends StatelessWidget {
  const SanShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAN Shop',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E293B),
          centerTitle: true,
          elevation: 0,
        ),
      ),
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

  final List<Widget> _pages = const [
    TopUpPage(),
    ItemsGuidePage(),
    HeroStoryPage(),
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
        backgroundColor: const Color(0xFF1E293B),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Top-Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Item Guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hero Lore',
          ),
        ],
      ),
    );
  }
}

// ---------------- TOP UP PAGE ----------------
class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  Future<void> _launchTelegram(String gameName) async {
    final message = Uri.encodeComponent('Hello, I want to top up $gameName.');
    final Uri url = Uri.parse('https://t.me/your_telegram_username?text=$message');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SAN Shop - Top Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: const Color(0xFF1E293B),
              child: ListTile(
                leading: const Icon(Icons.sports_esports, color: Colors.amber, size: 40),
                title: const Text('Mobile Legends (MLBB)', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Buy Diamonds via Telegram'),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () => _launchTelegram('MLBB Diamonds'),
                  child: const Text('Buy Now', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: const Color(0xFF1E293B),
              child: ListTile(
                leading: const Icon(Icons.gamepad, color: Colors.cyanAccent, size: 40),
                title: const Text('PUBG Mobile', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Buy UC via Telegram'),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent),
                  onPressed: () => _launchTelegram('PUBG UC'),
                  child: const Text('Buy Now', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- ITEMS GUIDE PAGE ----------------
class ItemsGuidePage extends StatelessWidget {
  const ItemsGuidePage({super.key});

  final List<Map<String, String>> items = const [
    {'name': 'Demon Hunter Sword', 'category': 'Attack'},
    {'name': 'Blade of Despair', 'category': 'Attack'},
    {'name': 'Holy Crystal', 'category': 'Magic'},
    {'name': 'Blood Wings', 'category': 'Magic'},
    {'name': 'Athena\'s Shield', 'category': 'Defense'},
    {'name': 'Antique Cuirass', 'category': 'Defense'},
    {'name': 'Immortality', 'category': 'Defense'},
    {'name': 'Warrior Boots', 'category': 'Movement'},
  ];

  Future<void> _openGoogleSearch(String itemName) async {
    final query = Uri.encodeComponent('Mobile Legends $itemName stats guide');
    final Uri url = Uri.parse('https://www.google.com/search?q=$query');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MLBB Item Guide')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['category']!),
              trailing: const Icon(Icons.search, color: Colors.amber),
              onTap: () => _openGoogleSearch(item['name']!),
            ),
          );
        },
      ),
    );
  }
}

// ---------------- HERO STORY PAGE ----------------
class HeroStoryPage extends StatelessWidget {
  const HeroStoryPage({super.key});

  final List<Map<String, String>> rawHeroes = const [
    {'name': 'Dyrroth', 'role': 'Fighter'},
    {'name': 'Alucard', 'role': 'Fighter / Assassin'},
    {'name': 'Chou', 'role': 'Fighter'},
    {'name': 'Fanny', 'role': 'Assassin'},
    {'name': 'Gusion', 'role': 'Assassin / Mage'},
    {'name': 'Hayabusa', 'role': 'Assassin'},
    {'name': 'Layla', 'role': 'Marksman'},
    {'name': 'Ling', 'role': 'Assassin'},
    {'name': 'Miya', 'role': 'Marksman'},
    {'name': 'Tigreal', 'role': 'Tank'},
    {'name': 'Zilong', 'role': 'Fighter / Assassin'},
  ];

  Future<void> _openGoogleSearch(String heroName) async {
    final query = Uri.encodeComponent('Mobile Legends $heroName story background guide');
    final Uri url = Uri.parse('https://www.google.com/search?q=$query');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> sortedHeroes = List.from(rawHeroes);
    sortedHeroes.sort((a, b) => a['name']!.compareTo(b['name']!));

    return Scaffold(
      appBar: AppBar(title: const Text('Hero Stories & Guides')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: sortedHeroes.length,
        itemBuilder: (context, index) {
          final hero = sortedHeroes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(
                  hero['name']![0],
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                hero['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(hero['role']!),
              trailing: const Icon(Icons.open_in_new, color: Colors.cyanAccent),
              onTap: () => _openGoogleSearch(hero['name']!),
            ),
          );
        },
      ),
    );
  }
}
