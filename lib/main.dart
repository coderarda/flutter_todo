import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String submitText = "";
  bool checked = false;
  List<StatefulBuilder> elements = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
        ),
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, idx) {
                return elements[idx];
              },
              itemCount: elements.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 500,
                  child: TextField(
                    onChanged: (str) => submitText = str,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: MaterialButton(
                    child: const Text("Add"),
                    onPressed: () {
                      setState(
                        () {
                          elements.add(
                            StatefulBuilder(
                              builder: (context, setState) {
                                return CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  value: checked,
                                  onChanged: (val) => setState(() {
                                    checked = val!;
                                  }),
                                  title: Text(
                                    submitText,
                                    style: checked
                                        ? const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough, color: Colors.grey)
                                        : const TextStyle(
                                            decoration: TextDecoration.none),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
