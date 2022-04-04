import 'package:flutter/material.dart';
import 'package:gatech/models/news.dart';
import 'package:gatech/viewmodels/game_viewmodel.dart';
import 'package:gatech/views/detail_screen/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class buildImage extends StatelessWidget {
  const buildImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<News> _gameList =
        Provider.of<GameViewModel>(context).response.data as List<News>;
    List<Widget> _imageList = [];
    List<String> _titles = [];

    for (var news in _gameList) {
      _imageList.add(ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListView(
          children: [
            Image.network(
              news.thumb,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 6),
            Container(
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news.title,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ));
      _titles.add(news.title.split(" ").elementAt(0) + '..');
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: VerticalCardPager(
                images: _imageList,
                titles: _titles,
                align: ALIGN.CENTER,
                textStyle: const TextStyle(color: Colors.transparent),
                onPageChanged: (page) {},
                onSelectedItem: (index) {
                  String key = _gameList[index].key;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(key)));
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
