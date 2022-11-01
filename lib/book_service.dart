import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'book.dart';

class BookService extends ChangeNotifier {
  // 책 목록
  List<Book> bookList = [];

  void getBookList(String q) async {
    bookList.clear();

    Response result = await Dio().get(
      "https://www.googleapis.com/books/v1/volumes?q=$q&startIndex=0&maxResults=40",
    );

    List items = result.data["items"];
    for (Map<String, dynamic> item in items) {
      Map<String, dynamic> volumeInfo = item["volumeInfo"];
      Book book = Book.fromJson(volumeInfo);
      bookList.add(book);
    }

    notifyListeners();
  }
}
