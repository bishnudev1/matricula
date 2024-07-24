import 'package:dartz/dartz.dart';
import 'package:matricula/core/exceptions.dart';
import 'package:matricula/data/remote/newsList/models/news_list_model.dart';

abstract class BaseNewsListRepo {
  Future<Either<ApiException, NewsListResponse>> getNewsList(
    String categoryName,
  );
}
