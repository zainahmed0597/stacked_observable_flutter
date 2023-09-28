import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/models/book.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<List<Book>>{
  final _apiService = locator<ApiService>();

  @override
  Future<List<Book>> futureToRun() => _apiService.getBooks();

}
