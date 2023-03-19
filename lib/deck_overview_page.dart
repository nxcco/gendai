import 'package:flutter/cupertino.dart';
import 'package:srs/cupertino_bottom_bar.dart';

import 'main.dart';

class DeckOverviewPage extends StatelessWidget {
  final Deck deck;

  const DeckOverviewPage({Key? key, required this.deck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                  '${deck.emoji} ${deck.name}',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.ellipsis_circle),
                  onPressed: () {},
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          // color: CupertinoColors.extraLightBackgroundGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              '20',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('total due'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          // color: CupertinoColors.extraLightBackgroundGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              '5',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Text('new'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          // color: CupertinoColors.extraLightBackgroundGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              '15',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('to review'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: MySliverPersistentHeaderDelegate(
                  maxHeight: 80,
                  minHeight: 80,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 16),
                    for (int i = 0;
                        i < 20;
                        i++) // Change this to your actual data length
                      CupertinoListTile(
                        title: Text('Card Title $i'),
                        trailing: const Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.systemGrey,
                        ),
                        onTap: () {},
                      ),
                  ],
                ),
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
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.play,
                ),
              ),
              middle: const Text(
                '400 cards',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              trailing: CupertinoButton(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.add,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = CupertinoTheme.of(context);

    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: theme.scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cards',
              style: theme.textTheme.textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            CupertinoSearchTextField(
              placeholder: 'Search Cards',
              backgroundColor: CupertinoColors.extraLightBackgroundGray,
              onChanged: (String value) {
                // Handle search
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}
