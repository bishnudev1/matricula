import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:matricula/data/remote/newsList/models/news_list_model.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/view/screens/news/news_list_view_model.dart';

class NewsListView extends ConsumerStatefulWidget {
  const NewsListView({super.key});

  @override
  ConsumerState<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends ConsumerState<NewsListView>
    with BaseScreenView {
  late NewsListViewModel _viewModel;
  @override
  void initState() {
    // _viewModel = ref.read('newsListViewModel');
    _viewModel.attachView(this);
    _viewModel.initialise("News API has been initialized...", context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _viewModel = ref.watch('newsListViewModel');
    return Scaffold(
      appBar: AppBar(
        title: const Text('News List Screen'),
        // leading: BackButton(),
      ),
      body: _viewModel.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ..._viewModel.newsListResponse?.articles
                          ?.map((e) => card(e))
                          .toList() ??
                      [],
                ],
              ),
            ),
    );
  }

  Widget card(Article article) {
    return article.urlToImage == null
        ? Container()
        : Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            elevation: 10,
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(article.title ?? ""),
                    subtitle: Text(
                      article.description ?? "",
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text(article.author ?? "")),
                        Text(DateFormat.yMMMd().format(article.publishedAt!)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  // @override
  // void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
  //   // context.pushNamed(appRoute.name, params: params ?? {},
  //   //     // {"fid": NavBarScreens.data[1].id},
  //   //     );
  // }

  // @override
  // void showSnackbar(String message, {Color? color}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: color,
  //     ),
  //   );
  // }
}
