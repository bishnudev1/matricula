import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:matricula/app/api_client.dart';
import 'package:matricula/app/exceptions.dart';
import 'package:matricula/data/remote/newsList/models/news_list_model.dart';
import 'package:matricula/data/remote/newsList/news_list_repo.dart';

class NewsListRepoImpl implements BaseNewsListRepo {
  final ApiClient _apiClient;

  NewsListRepoImpl(this._apiClient);
  @override
  Future<Either<ApiException, NewsListResponse>> getNewsList(
    String categoryName,
  ) async {
    try {
      final response = await _apiClient.get(
        "/${ApiClient.TOP_HEADLINES}?country=in&apiKey=${dotenv.env['API_KEY']}&category=$categoryName",
      );
      return Right(NewsListResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
