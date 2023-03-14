import 'package:flutter/cupertino.dart';

void showCreateDeckBottomSheet(BuildContext context) {
  final TextEditingController _titleController = TextEditingController();
  String _selectedEmoji = '';

  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: CupertinoActionSheet(
          title: const Text(
            'Create New Deck',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
          message: Row(
            children: [
              EmojiPicker(
                onEmojiSelected: (emoji) {
                  _selectedEmoji = emoji;
                  setState(() {});
                },
              ),
              Expanded(
                child: CupertinoTextField(
                  controller: _titleController,
                  placeholder: 'Title',
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              isDefaultAction: true,
              child: const Text('Create'),
              onPressed: () {
                // Handle the creation of the new deck here
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    ),
  );
}

class EmojiPicker extends StatefulWidget {
  final Function(String) onEmojiSelected;

  const EmojiPicker({super.key, required this.onEmojiSelected});

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  List<String> emojis = [
    '🧪', // science
    '🔬',
    '⚛️',
    '🌡️',
    '🌍',
    '🏛️', // history
    '📜',
    '🗺️',
    '🏰',
    '🏺',
    '🔢', // math
    '➕',
    '➖',
    '✖️',
    '➗',
    '🗣️', // language
    '📚',
    '🖋️',
    '📖',
    '🎓',
    '🎨', // art
    '🎭',
    '🎬',
    '🎼',
    '🎹',
    '🌎', // geography
    '🗺️',
    '🌍',
    '🗾',
    '🌋',
    '⚽', // sports
    '🏀',
    '🏈',
    '🎾',
    '🥊',
    '💻', // technology
    '📱',
    '🖥️',
    '📡',
    '🛰️',
    '💼', // business
    '💰',
    '📈',
    '📊',
    '📉',
    '🔍', // research
    '📝',
    '📌',
    '🔎',
    '📊',
    '🔑', // security
    '🔒',
    '🔐',
    '🔓',
    '🔑',
    '🍴', // cooking
    '🥄',
    '🍳',
    '🧊',
    '🥂',
    '💪', // fitness
    '🏋️‍♀️',
    '🏋️‍♂️',
    '🚴‍♀️',
    '🚴‍♂️',
    '🌱', // gardening
    '🌻',
    '🍅',
    '🍓',
    '🌿',
    '🔨', // DIY
    '🪚',
    '🧰',
    '🪛',
    '📏',
    '🔭', // astronomy
    '🌌',
    '🪐',
    '🌠',
    '👽',
    '🎮', // gaming
    '🕹️',
    '🎲',
    '🎯',
    '🏆',
    '💡', // innovation
    '🛠️',
    '👨‍🔬',
    '👩‍🔬',
    '🚀',
    '🎓', // education
    '📚',
    '🎒',
    '👩‍🏫',
    '👨‍🏫',
    '🌡️', // weather
    '🌦️',
    '❄️',
    '☀️',
    '🌪️',
    '🚗', // transportation
    '🚀',
    '🚲',
    '🛴',
    '🛵',
    '🔮',
  ];

  List<String> topics = [
    'Science',
    'History',
    'Math',
    'Language',
    'Art',
    'Geography',
    'Sports',
    'Technology',
    'Business',
    'Research',
    'Security',
    'Cooking',
    'Fitness',
    'Gardening',
    'DIY',
    'Astronomy',
    'Gaming',
    'Innovation',
    'Education',
    'Weather',
    'Transportation',
    'Other',
  ];

  String? selectedEmoji;
  String topic = 'Science';

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Text(
          selectedEmoji ?? '🖼️',
          style: const TextStyle(fontSize: 32),
        ),
        onPressed: () {
          topic = 'Science';

          _showDialog(
            StatefulBuilder(
              builder: (context, setTheState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        topic,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: 42,
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            selectedEmoji = emojis[selectedItem];
                          });
                          setTheState(() {
                            topic = topics[selectedItem ~/ 5];
                          });
                        },
                        children: List<Widget>.generate(
                          emojis.length,
                          (int index) {
                            return Text(
                              emojis[index],
                              style: const TextStyle(fontSize: 32),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
