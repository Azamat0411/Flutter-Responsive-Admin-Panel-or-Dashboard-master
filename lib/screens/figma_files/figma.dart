import 'package:admin/screens/figma_files/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FigmaScreen extends StatelessWidget {
  const FigmaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
          children: List.generate(
              3, (index) => Container(child: _mp4(context, _images[index])))),
    );
  }
}

_mp4( BuildContext context,String asset) {
  return Container(
    width: 100,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Material(
      child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ImageScreen(image: asset)));
          },
          child: Column(
            children: [
              Image.asset('assets/images/$asset.png'),
              Text(asset, style: TextStyle(fontSize: 15))
            ],
          )),
    ),
  );
}

List<String> _images = ['image1', 'image2', 'image3'];
