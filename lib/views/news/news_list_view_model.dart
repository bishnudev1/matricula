import 'package:flutter/material.dart';
import 'package:matricula/app/constants.dart';
import 'package:matricula/data/remote/newsList/models/news_list_model.dart';
import 'package:matricula/data/remote/newsList/news_list_repo.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/utils/showtoast.dart';

// final newsListViewModel = ChangeNotifierProvider.autoDispose(
//   // (ref) => NewsListViewModel(
//   //   ref.read(newsRepositoryProvider),
//   // ),
// );

class NewsListViewModel extends BaseViewModel<BaseScreenView> {
  final BaseNewsListRepo _newsListRepo;
  NewsListResponse? _newsListResponse;
  NewsListResponse? get newsListResponse => _newsListResponse;
  NewsListViewModel(this._newsListRepo);
  Future<void> initialise(String message, BuildContext context) async {
    await _newsListRepo.getNewsList(AppConstants.entertainment).then(
          (value) => value.fold((l) {
            showToast(message, context);
          }, (r) {
            _newsListResponse = r;
          }),
        );
    toggleLoading();
  }
}
