import 'package:flutter/material.dart';

class PptViewer extends StatefulWidget {
  PptViewer({Key? key}) : super(key: key);

  @override
  State<PptViewer> createState() => _PptViewerState();
}

class _PptViewerState extends State<PptViewer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 8,
          itemBuilder: (context, index){
        return Image.asset('assets/images/img${index+1}.png');
      })
    );
  }
}
