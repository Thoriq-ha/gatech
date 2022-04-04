import 'package:flutter/material.dart';
import 'package:gatech/models/detail_news.dart';
import 'package:gatech/viewmodels/detail_viewmodel.dart';
import 'package:provider/provider.dart';

class BuildDetail extends StatefulWidget {
  const BuildDetail({Key? key}) : super(key: key);

  @override
  _BuildDetailState createState() => _BuildDetailState();
}

class _BuildDetailState extends State<BuildDetail> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    DetailNews detailNews =
        Provider.of<DetailViewModel>(context).response.data as DetailNews;
    List<String> categories = [];

    for (var element in detailNews.categories) {
      categories.add(element);
    }
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                detailNews.thumb ??
                    'https://thelazy.media/wp-content/uploads/2021/11/Razer-Pantry-1024x683.png',
                width: MediaQuery.of(context).size.width,
                height: 230,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    detailNews.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    detailNews.date,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF39D2C0)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                  itemCount: detailNews.content.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        detailNews.content[index],
                        textAlign: TextAlign.justify,
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    categories.join(", "),
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF39D2C0)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
