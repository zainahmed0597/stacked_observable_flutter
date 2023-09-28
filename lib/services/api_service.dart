import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:observable_flutter/models/book.dart';


class ApiService {

  static const String baseUrl = 'www.googleapis.com';
  static const String books ='/books/v1/volumes';

  Future<List<Book>> getBooks({String genreType = 'computers'}) async {
    final url = Uri.https(baseUrl, books, {'q': 'subject:$genreType'} );
    final response = await http.get(url);
    final Iterable items = jsonDecode(response.body)['items'];
    return items.map((e) => Book.fromJson(e['volumeInfo'])).toList();
  }
}
