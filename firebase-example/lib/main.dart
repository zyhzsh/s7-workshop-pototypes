import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final databaseRef = FirebaseDatabase.instance.reference();
  final List<String> items = [];

  @override
  void initState() {
    super.initState();
    // Read initial data from Firebase Realtime Database
    databaseRef.child('items').once().then((DataSnapshot snapshot) {
      setState(() {
        items.addAll(snapshot.value);
      });
    });
  }

  void addItem(String item) {
    setState(() {
      items.add(item);
    });
    // Write new item to Firebase Realtime Database
    databaseRef.child('items').set(items);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Add item'),
                onSubmitted: addItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
