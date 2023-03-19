import 'package:flutter/cupertino.dart';
import 'package:srs/cupertino_bottom_bar.dart';
import 'package:srs/deck_overview_page.dart';
import 'package:srs/show_create_deck.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Anki Pro',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _onlyDueToday = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: Stack(
        children: [
          ListView(
            children: [
              CupertinoListSection.insetGrouped(
                footer: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CupertinoListTile.notched(
                    backgroundColor: CupertinoColors.white,
                    title: const Text('Add new deck'),
                    leading: const Icon(CupertinoIcons.add),
                    onTap: () => showCreateDeckBottomSheet(context),
                  ),
                ),
                header: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Decks',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        const Spacer(),
                        CupertinoButton(
                          child: const Icon(
                            CupertinoIcons.profile_circled,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CupertinoSearchTextField(
                      placeholder: 'Search',
                      onChanged: (String value) {
                        // Handle search
                      },
                      backgroundColor: CupertinoColors.lightBackgroundGray,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                children: [
                  for (final deck in decks.where((element) {
                    if (_onlyDueToday) {
                      return element.dueTodayCount > 0;
                    }
                    return true;
                  }))
                    CupertinoListTile.notched(
                      title: Text(deck.name),
                      leading: Text(deck.emoji),
                      additionalInfo: Text(
                        '${deck.dueTodayCount} due',
                      ),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) {
                            return DeckOverviewPage(deck: deck);
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: -MediaQuery.of(context).padding.bottom,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: 110,
            child: CupertinoBottomBar(
              leading: CupertinoButton(
                child: Icon(
                  _onlyDueToday
                      ? CupertinoIcons.line_horizontal_3_decrease_circle_fill
                      : CupertinoIcons.line_horizontal_3_decrease_circle,
                ),
                onPressed: () {
                  setState(() {
                    _onlyDueToday = !_onlyDueToday;
                  });
                },
              ),
              middle: const Text(
                '12 decks, 400 cards, 90 due',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              trailing: CupertinoButton(
                child: const Icon(CupertinoIcons.add),
                onPressed: () {
                  // Handle creating a new card
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Deck {
  final String name;
  final String emoji;
  final int totalCount;
  final int dueTodayCount;

  Deck({
    required this.name,
    required this.totalCount,
    required this.dueTodayCount,
    required this.emoji,
  });
}

final List<Deck> decks = [
  Deck(name: 'Mathematics', totalCount: 20, dueTodayCount: 3, emoji: '👨‍🔬'),
  Deck(name: 'French', totalCount: 12, dueTodayCount: 0, emoji: '👨‍🏫'),
  Deck(name: 'Cooking', totalCount: 8, dueTodayCount: 2, emoji: '👨‍🍳'),
];
