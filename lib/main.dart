import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_database/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [];
  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  final shoppingBox = Hive.box("shopping_box");

  void createItem(Map<String, dynamic> newItem) async {
    await shoppingBox.add(newItem);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("....SuccessFully added")));
    refreshItem();
    log("amount data is: ${shoppingBox.length}");
  }

  void updateItem(int itemKey, Map<String, dynamic> item) async {
    await shoppingBox.put(itemKey, item);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("....SuccessFully updated")));

    refreshItem();
    // log("amount data is: ${shoppingBox.length}");
  }

  void deleteItem(int itemKey) async  {
    await shoppingBox.delete(itemKey);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("....SuccessFully deleted")));
    refreshItem();
    // log("amount data is: ${shoppingBox.length}");
  }

  void refreshItem() {
    final data = shoppingBox.keys.map((key) {
      final item = shoppingBox.get(key);
      return {"key": key, "name": item['name'], "quantity": item['quantity']};
    }).toList();
    setState(() {
      items = data.reversed.toList();
    });
  }

  void showForm(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
      items.firstWhere((element) => element['key'] == itemKey);
      name.text = existingItem['name'];
      quantity.text = existingItem['quantity'];
    }

    showModalBottomSheet(
        context: ctx,
        builder: (_) => Container(
          padding: EdgeInsets.only(
              top: 15,
              right: 15,
              left: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 4),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: name,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: quantity,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Quantity",
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    if (itemKey == null) {
                      createItem(
                          {"name": name.text, "quantity": quantity.text});
                    }
                    if (itemKey != null) {
                      updateItem(itemKey, {
                        "name": name.text.trim(),
                        "quantity": quantity.text.trim(),
                      });
                    }
                    name.text = '';
                    quantity.text = '';
                    Navigator.of(context).pop();
                  },
                  child: Text(itemKey == null ? "Create New" : "update"),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showForm(context, null);
            name.text="";
            quantity.text="";
          },
          child: Icon(Icons.add)),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i) {
            final currentItem = items[i];
            return Card(
              color: Colors.orange[200],
              margin: EdgeInsets.all(15),
              child: ListTile(
                title: Text(currentItem['name']),
                subtitle: Text(currentItem['quantity'].toString()),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showForm(context, currentItem['key']);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deleteItem(currentItem['key']);
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
