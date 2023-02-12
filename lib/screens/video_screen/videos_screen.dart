import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'video_screen.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
          children: List.generate(
              2, (index) => Container(child: _mp4(context, _videos[index])))),
    );
  }
}

_mp4( BuildContext context,String asset) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Material(

      child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => VideoApp(asset: 'assets/video/$asset.mp4')));
          },
          child: Column(
            children: [
              SvgPicture.asset('assets/icons/mp4.svg', width: 100),
              Text(asset, style: TextStyle(fontSize: 15))
            ],
          )),
    ),
  );
}

List<String> _videos = ['video1', 'video2'];
