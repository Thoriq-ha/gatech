import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gatech/models/news.dart';
import 'package:gatech/services/apis/api_response.dart';
import 'package:gatech/viewmodels/game_viewmodel.dart';
import 'package:gatech/views/detail_screen/detail_screen.dart';
import 'package:provider/provider.dart';

class BuildImage extends StatefulWidget {
  final String _endpoint;

  const BuildImage(this._endpoint, {Key? key}) : super(key: key);

  @override
  State<BuildImage> createState() => _BuildImageState();
}

class _BuildImageState extends State<BuildImage> {
  @override
  initState() {
    super.initState();
    Provider.of<GameViewModel>(context, listen: false)
        .fetchGamesData(widget._endpoint);
  }

  Widget getPostList(BuildContext context, ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        return const GridviewImage();
      case Status.ERROR:
        return const Center(
          child: Text('Please try again'),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text('Animy'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse _apiResponse = Provider.of<GameViewModel>(context).response;
    return getPostList(context, _apiResponse);
  }
}

class GridviewImage extends StatelessWidget {
  const GridviewImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    List<News> _gameList =
        Provider.of<GameViewModel>(context).response.data as List<News>;

    return StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(0),
      crossAxisCount: 4,
      controller: _scrollController,
      itemCount: _gameList.length,
      itemBuilder: (context, index) {
        return FadeInUp(
          delay: Duration(milliseconds: index * 50),
          duration: Duration(milliseconds: (index * 50) + 800),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(_gameList[index].key)));
            },
            child: Container(
              color: Colors.black,
              child: Image.network(
                _gameList[index].thumb,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 4 : 2),
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
    );
  }
}
