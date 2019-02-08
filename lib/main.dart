import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'src/screens/second_screen.dart';
import 'src/utilities/my_menu.dart';

void main() {
  runApp(MyApp());
}

class RandomWordsState extends State<RandomWords> {
  @override                                  // Add from this line ...
  Widget build(BuildContext context) {
    final WordPair wordPair = new WordPair.random();

    final Text _textWord = new Text(wordPair.asPascalCase);
    return _textWord;
  }                                          // ... to this line.
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class MyApp extends StatelessWidget {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: Scaffold(
        drawer: Drawer(
          child: MyMenuDesign(),
        ),
        appBar: AppBar(
          title: new RandomWords(),
        ),
        body: Center(
          child: _buildSuggestions(context),
        ),
      ),
    );
  }

  Widget _buildSuggestions(BuildContext context) {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return new Divider();
          }

          // The syntax "i ~/ 2" divides i by 2 and returns an
          // integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings
          // in the ListView,minus the divider widgets.
          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_context,_suggestions[index]);
        }
    );
  }

  Widget _buildRow(BuildContext context,WordPair pair) {
    return new ListTile(
      trailing: false ? Icon(
        Icons.favorite,
        color: true ? Colors.red : Colors.blue,
      ) : Icon(Icons.favorite_border),
      leading: CircleAvatar(
        child: Text(pair.toString().toUpperCase().substring(0,1),
          style: TextStyle(fontSize: 20),
        ),
      ),
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: Text('My Title'),
      onTap: (){
        print(pair.toString());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SecondScreen(pair)
          )
        );
      },
    );
  }
}
