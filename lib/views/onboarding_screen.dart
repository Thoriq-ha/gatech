import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:gatech/main_screen.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final data = [
    ItemData(
      title: "GATECH",
      subtitle: "Informasi Seputar Game & Technology",
      image: const AssetImage("assets/images/image-2.jpeg"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.amber,
      subtitleColor: Colors.white,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "UPDATE",
      subtitle: "Selalu menyajikan berita terbaru dan terupdate.",
      image: const AssetImage("assets/images/image-3.jpeg"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "Masa Kini",
      subtitle: "Tempat informasi kekinian.",
      image: const AssetImage("assets/images/image-4.jpeg"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.orange.shade600,
      subtitleColor: Colors.white,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "Lets get Start it",
      subtitle: "Tunggu apa lagi mari kita mulai.",
      image: const AssetImage("assets/images/image-1.jpeg"),
      backgroundColor: Colors.white,
      titleColor: Colors.red.shade400,
      subtitleColor: Colors.black,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        onFinish: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        },
        radius: 40,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index, double value) {
          return ItemWidget(data: data[index]);
        },
      ),
    );
  }
}

class ItemData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  ItemData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image(image: data.image),
              ),
              const Spacer(flex: 1),
              Text(
                data.title,
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ],
    );
  }
}
