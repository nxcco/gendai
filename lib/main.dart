import 'package:flutter/cupertino.dart';
import 'package:srs/cupertino_bottom_bar.dart';
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Expanded(
            child: CupertinoListSection.insetGrouped(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).viewPadding.top),
                  Row(
                    children: [
                      const Spacer(),
                      CupertinoButton(
                        child: const Icon(
                          CupertinoIcons.profile_circled,
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Text(
                    'Decks',
                    style: TextStyle(
                      fontSize: 35,
                    ),
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
                CupertinoListTile.notched(
                  title: const Text('Mathematics'),
                  additionalInfo: const Text('30 total, 12 due'),
                  leading: const Text('🧮'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) {
                        return Container();
                      },
                    ),
                  ),
                ),
                CupertinoListTile.notched(
                  title: const Text('Cooking & Cuisine'),
                  leading: const Text('👨🏼‍🍳'),
                  additionalInfo: const Text('400 total, 12 due'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) {
                        return Container();
                      },
                    ),
                  ),
                ),
                const CupertinoListTile.notched(
                  title: Text('Physics'),
                  leading: Text('Ͷ'),
                  additionalInfo: Text('200 total'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: const Text('Art'),
                  leading: const Text('🎨'),
                  additionalInfo: const Text('23 total, 12 due'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) {
                        return Container();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          CupertinoBottomBar(
            leading: CupertinoButton(
              child:
                  const Icon(CupertinoIcons.line_horizontal_3_decrease_circle),
              onPressed: () {
                // Handle creating a new card
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
          )
        ],
      ),
    );
  }
}

class Deck {
  final String name;
  final int totalCount;
  final int dueTodayCount;

  Deck({
    required this.name,
    required this.totalCount,
    required this.dueTodayCount,
  });
}

final List<Deck> decks = [
  Deck(name: 'Deck 1', totalCount: 20, dueTodayCount: 3),
  Deck(name: 'Deck 2', totalCount: 12, dueTodayCount: 0),
  Deck(name: 'Deck 3', totalCount: 8, dueTodayCount: 2),
];
