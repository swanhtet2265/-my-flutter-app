import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F1E),
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
        backgroundColor: const Color(0xFF161629),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent.shade400,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Center(
                  child: Text(
                    'SAN shop',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.sports_esports,
                      size: 90,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'MOBILE LEGENDS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '5v5 Fair AOS for Mobile',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildRedButton(
                          context,
                          'Hero story',
                          const HeroStoryPage(),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildRedButton(
                          context,
                          'Diamonds',
                          const DiamondsPage(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: _buildRedButton(
                          context,
                          'itemအကြောင်း',
                          const ItemInfoPage(),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildRedButton(
                          context,
                          'Uc',
                          const UcPage(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRedButton(BuildContext context, String text, Widget nextPage) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF3B30),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ---------------- HERO STORY PAGE ----------------
class HeroStoryPage extends StatelessWidget {
  const HeroStoryPage({super.key});

  final List<Map<String, String>> rawHeroes = const [
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

// ---------------- DIAMONDS PAGE WITH TG BOT ----------------
class DiamondsPage extends StatefulWidget {
  const DiamondsPage({super.key});

  @override
  State<DiamondsPage> createState() => _DiamondsPageState();
}

class _DiamondsPageState extends State<DiamondsPage> {
  final _userIdController = TextEditingController();
  final _serverIdController = TextEditingController();
  String _selectedDiamond = '86 Diamonds (2,500 Ks)';
  bool _isLoading = false;

  final String botToken = 'YOUR_TELEGRAM_BOT_TOKEN';
  final String chatId = 'YOUR_TELEGRAM_CHAT_ID';

  final List<String> diamondOptions = [
    '86 Diamonds (2,500 Ks)',
    '172 Diamonds (5,000 Ks)',
    '257 Diamonds (7,500 Ks)',
    '706 Diamonds (20,000 Ks)',
    '2195 Diamonds (60,000 Ks)',
  ];

  Future<void> _sendOrderToTelegram() async {
    if (_userIdController.text.isEmpty || _serverIdController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ကျေးဇူးပြု၍ ID နှင့် Server ID ဖြည့်ပါ')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final String message = '''
🛒 **SAN Shop Order New!**
🎮 Game: Mobile Legends
👤 User ID: ${_userIdController.text}
🌐 Server ID: ${_serverIdController.text}
💎 Item: $_selectedDiamond
📅 Date: ${DateTime.now().toString().split('.')[0]}
''';

    final url = Uri.parse('https://api.telegram.org/bot$botToken/sendMessage');

    try {
      final response = await http.post(
        url,
        body: {
          'chat_id': chatId,
          'text': message,
          'parse_mode': 'Markdown',
        },
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('အော်ဒါ အောင်မြင်စွာ တင်ပြီးပါပြီ။')),
        );
        _userIdController.clear();
        _serverIdController.clear();
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('အော်ဒါ ပေးပို့မှု မအောင်မြင်ပါ။ Bot Token စစ်ဆေးပါ။')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MLBB Diamonds Shop')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('User ID ဖြည့်ပါ', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: _userIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'e.g. 12345678',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Server ID ဖြည့်ပါ', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: _serverIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'e.g. 1234',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const Text('ဝယ်ယူလိုသည့် Diamonds ရွေးပါ', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _selectedDiamond,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: diamondOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedDiamond = newValue!;
                });
              },
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: _sendOrderToTelegram,
                    icon: const Icon(Icons.send, color: Colors.white),
                    label: const Text('Order တင်မည်', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
          ],
        ),
      ),
    );
  }
}

// ---------------- ALL MLBB ITEMS PAGE ----------------
class ItemInfoPage extends StatelessWidget {
  const ItemInfoPage({super.key});

  final List<Map<String, String>> items = const [
    // Physical Items
    {'name': 'Blade of Despair', 'type': 'Physical', 'desc': '+160 Physical Attack, +5% Movement Speed. Passive: Attacking low HP enemies increases Physical Attack.'},
    {'name': 'Malefic Roar', 'type': 'Physical', 'desc': '+60 Physical Attack. Passive: Gain Physical Penetration based on enemy Armor.'},
    {'name': 'Demon Hunter Sword', 'type': 'Physical', 'desc': '+35 Physical Attack, +25% Attack Speed. Passive: Basic Attacks deal extra damage based on enemy HP.'},
    {'name': 'Endless Battle', 'type': 'Physical', 'desc': '+65 Physical Attack, Lifesteal & Cooldown Reduction. Passive: Deals True Damage after using a skill.'},
    {'name': 'Haas Claws', 'type': 'Physical', 'desc': '+30 Physical Attack, +20% Attack Speed, +20% Crit Chance. Passive: High Physical Lifesteal.'},
    {'name': 'Windtalker', 'type': 'Physical', 'desc': '+40% Attack Speed, +20 Movement Speed, +10% Crit Chance. Passive: Splash Magic Damage on attack.'},
    {'name': 'Berserker\'s Fury', 'type': 'Physical', 'desc': '+65 Physical Attack, +25% Crit Chance. Passive: Increases Critical Damage by +40%.'},

    // Magic Items
    {'name': 'Holy Crystal', 'type': 'Magic', 'desc': '+100 Magic Power. Passive: Increases Magic Attack by 21%-35%.'},
    {'name': 'Blood Wings', 'type': 'Magic', 'desc': '+175 Magic Power, +500 HP. Passive: Gains a powerful shield and extra Movement Speed.'},
    {'name': 'Divine Glaive', 'type': 'Magic', 'desc': '+65 Magic Power. Passive: High Magic Penetration against high Magic Defense enemies.'},
    {'name': 'Lightning Truncheon', 'type': 'Magic', 'desc': '+75 Magic Power, +400 Mana, +10% CDR. Passive: Skill damage bounces to surrounding enemies.'},
    {'name': 'Concentrated Energy', 'type': 'Magic', 'desc': '+70 Magic Power, +700 HP. Passive: High Spell Vamp & Magic Power build-up.'},
    {'name': 'Genius Wand', 'type': 'Magic', 'desc': '+75 Magic Power, +5% Movement Speed. Passive: Reduces enemy Magic Defense when dealing damage.'},

    // Defense Items
    {'name': 'Immortality', 'type': 'Defense', 'desc': '+800 HP, +20 Physical Defense. Passive: Resurrects 2.5s after death with a shield.'},
    {'name': 'Athena\'s Shield', 'type': 'Defense', 'desc': '+900 HP, +62 Magic Defense. Passive: Greatly reduces incoming Magic Damage for 3 seconds.'},
    {'name': 'Antique Cuirass', 'type': 'Defense', 'desc': '+920 HP, +54 Physical Defense. Passive: Reduces enemy Physical Attack when struck by skills.'},
    {'name': 'Dominance Ice', 'type': 'Defense', 'desc': '+500 Mana, +70 Physical Defense, +5% Speed. Passive: Reduces nearby enemy Attack Speed and Healing.'},
    {'name': 'Radiant Armor', 'type': 'Defense', 'desc': '+950 HP, +52 Magic Defense. Passive: Reduces continuous Magic Damage.'},
    {'name': 'Blade Armor', 'type': 'Defense', 'desc': '+90 Physical Defense. Passive: Reflects Physical Damage back to the attacker.'},

    // Movement (Boots)
    {'name': 'Warrior Boots', 'type': 'Movement', 'desc': '+40 Movement Speed, +22 Physical Defense. Passive: Increases defense when hit by basic attacks.'},
    {'name': 'Tough Boots', 'type': 'Movement', 'desc': '+40 Movement Speed, +22 Magic Defense. Passive: Reduces Crowd Control (CC) duration by 30%.'},
    {'name': 'Magic Shoes', 'type': 'Movement', 'desc': '+40 Movement Speed, +10% Cooldown Reduction.'},
    {'name': 'Swift Boots', 'type': 'Movement', 'desc': '+40 Movement Speed, +15% Attack Speed.'},
  ];

  Color _getCategoryColor(String type) {
    switch (type) {
      case 'Physical':
        return Colors.redAccent;
      case 'Magic':
        return Colors.blueAccent;
      case 'Defense':
        return Colors.greenAccent;
      case 'Movement':
        return Colors.orangeAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MLBB Item များ')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final color = _getCategoryColor(item['type']!);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(Icons.shield, color: color, size: 32),
              title: Text(
                item['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '${item['type']}\n${item['desc']}',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------------- UC PAGE ----------------
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ucPrices.length,
                itemBuilder: (context, index) {
                  final item = ucPrices[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.monetization_on, color: Colors.amber, size: 30),
                      title: Text(item['amount']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(item['price']!, style: const TextStyle(color: Colors.amberAccent, fontSize: 16)),
                    ),
                  );
                },
              ),
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
            SizedBox(height: 12),
            Text('SAN Shop User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Welcome to SAN Shop App', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
