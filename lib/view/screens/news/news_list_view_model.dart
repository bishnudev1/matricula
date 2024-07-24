import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matricula/core/constants.dart';
import 'package:matricula/data/remote/newsList/models/news_list_model.dart';
import 'package:matricula/data/remote/newsList/news_list_repo.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/view/screens/auth/auth_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Future<void> initialise() async {
    await _newsListRepo.getNewsList(AppConstants.entertainment).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) {
            _newsListResponse = r;
          }),
        );
    toggleLoading();
  }
}
