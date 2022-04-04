import 'package:flutter/material.dart';
import 'package:gatech/const.dart';
import 'package:gatech/services/apis/api_response.dart';
import 'package:gatech/viewmodels/game_viewmodel.dart';
import 'package:provider/provider.dart';

import 'build_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    Provider.of<GameViewModel>(context, listen: false)
        .fetchGamesData(techRecomended);
  }

  Widget getPostList(BuildContext context, ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        return const BuildImage();
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

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Info Game And Technology',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: myDarkPrimary,
          elevation: 0,
        ),
        body: getPostList(context, _apiResponse));
  }
}
