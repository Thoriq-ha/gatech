import 'package:flutter/material.dart';
import 'package:gatech/const.dart';
import 'package:gatech/services/apis/api_response.dart';
import 'package:gatech/viewmodels/detail_viewmodel.dart';
import 'package:gatech/views/detail_screen/build_detail.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(this.dataKey, {Key? key}) : super(key: key);

  final String dataKey;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  initState() {
    Provider.of<DetailViewModel>(context, listen: false)
        .fetchDetailData((DETAIL_NEWS + widget.dataKey));
  }

  Widget getPostList(BuildContext context, ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        return const BuildDetail();
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
    ApiResponse _apiResponse = Provider.of<DetailViewModel>(context).response;
    // return
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MY_DARK_PRIMARY,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.black87,
            size: 32,
          ),
        ),
        title: const Text('Details'),
        titleTextStyle: const TextStyle(color: Colors.black87, fontSize: 18),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      // backgroundColor: Color(0xFF262D34),
      body: getPostList(context, _apiResponse),
    );
  }
}
