import 'package:admin/models/RecentFile.dart';
import 'package:admin/screens/figma_files/figma.dart';
import 'package:admin/screens/ppt_viewer/ppt_viewer.dart';
import 'package:admin/screens/video_screen/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../audios_screen/audios_screen.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(child: Text('File Name')),
                        Expanded(child: Text('Date')),
                        Expanded(child: Text('Size'))
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                        demoRecentFiles.length,
                        (index) =>
                            recentFileDataRow(context, demoRecentFiles[index])),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

recentFileDataRow(BuildContext context, RecentFile fileInfo) {
  return Material(
    color: Colors.transparent,
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        onTap(context, fileInfo.id!);
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  fileInfo.icon!,
                  height: 25,
                  width: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(fileInfo.title!),
                ),
              ],
            ),
          ),
          Expanded(child: Text(fileInfo.date!)),
          Expanded(child: Text(fileInfo.size!)),
        ]),
      ),
    ),
  );
}

onTap(BuildContext context, int id) {
  switch (id) {
    case 1:
      {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => VideosScreen()));
        return;
      }
    case 2:{
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AudiosScreen()));
      return;
    }
    case 4:{
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FigmaScreen()));
      return;
    }
    case 7:{
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PptViewer()));
      return;
    }
    default:
      return;
  }
}
