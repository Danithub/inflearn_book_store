// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book Store',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Align(
                  child: Text(
                    "total 40",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: 100,
                  child: TextField(
                    style: TextStyle(fontSize: 20, height: 2),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                // ListView.separated(
                //     itemBuilder: (context, index) {
                //       return Row(
                //         children: [
                //           Image.network(""),
                //           Column(
                //             children: [
                //               Text("title"),
                //               Text("description"),
                //             ],
                //           ),
                //         ],
                //       );
                //     },
                //     separatorBuilder: (context, index) {
                //       return SizedBox(
                //         height: 12,
                //       );
                //     },
                //     itemCount: 1),
              ]),
        ),
      ),
    );
  }
}
