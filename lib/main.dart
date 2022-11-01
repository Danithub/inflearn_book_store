// ignore_for_file: sort_child_properties_last

import 'package:book_store/book.dart';
import 'package:book_store/book_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
      ],
      child: MyApp(),
    ),
  );
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

  var searchController = TextEditingController();

  void search(BookService bookService) {
    String keyword = searchController.text;
    if (keyword.isNotEmpty) {
      bookService.getBookList(keyword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(
      builder: (context, bookService, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Text(
              "Book Store",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            actions: [
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  "total 40",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 72),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "원하시는 책을 검색해주세요.",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        search(bookService);
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                  onSubmitted: (value) {
                    search(bookService);
                  },
                ),
              ),
            ),
          ),
          body: bookService.bookList.isEmpty
              ? Center(
                  child: Text(
                    "검색어를 입력해주세요",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: bookService.bookList.length,
                  itemBuilder: (context, index) {
                    Book book = bookService.bookList[index];
                    return ListTile(
                      leading: Image.network(
                        book.thumbnail,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(book.title),
                      subtitle: Text(book.subtitle),
                      onTap: () {
                        Uri uri = Uri.parse(book.previewLink);
                        launchUrl(uri);
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
