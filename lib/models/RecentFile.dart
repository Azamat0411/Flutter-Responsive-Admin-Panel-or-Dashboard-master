class RecentFile {
  final String? icon, title, date, size;
  final int? id;

  RecentFile({this.id, this.icon, this.title, this.date, this.size});
}

List demoRecentFiles = [
  RecentFile(
    id: 1,
    icon: "assets/icons/media_file.svg",
    title: "Media File",
    date: "23-02-2022",
    size: "2.5gb",
  ),
  RecentFile(
    id: 2,
    icon: "assets/icons/sound_file.svg",
    title: "Sound File",
    date: "21-02-2022",
    size: "3.5mb",
  ),
  RecentFile(
    id: 3,
    icon: "assets/icons/xd_file.svg",
    title: "XD File",
    date: "01-03-2022",
    size: "3.5mb",
  ),
  RecentFile(
    id: 4,
    icon: "assets/icons/Figma_file.svg",
    title: "Figma File",
    date: "27-02-2022",
    size: "19.0mb",
  ),
  RecentFile(
    id: 5,
    icon: "assets/icons/doc_file.svg",
    title: "Document",
    date: "23-02-2022",
    size: "32.5mb",
  ),
  RecentFile(
    id: 6,
    icon: "assets/icons/pdf_file.svg",
    title: "Sales PDF",
    date: "25-02-2022",
    size: "3.5mb",
  ),
  RecentFile(
    id: 7,
    icon: "assets/icons/ppt.svg",
    title: "PPT File",
    date: "25-02-2022",
    size: "34.5mb",
  ),
];
