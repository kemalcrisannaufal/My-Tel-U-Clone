import 'package:get/get.dart';
import 'package:nice_spot/app/data/models/news_model.dart';

class NewsController extends GetxController {
  final List<News> news = [
    News(
      id: "1",
      title:
          "Telkom University dan Multinegara Technology Group Jalani Kerjasama untuk Dorong Inovasi Teknologi",
      description: "Desciption 1",
      image: "https://picsum.photos/200/300",
    ),
    News(
      id: "2",
      title:
          "Telkom University Gelar Upacara dalam Rangka Memperingati Hari Pancasila",
      description: "Description 2",
      image: "https://picsum.photos/200/300",
    ),
    News(
      id: "3",
      title:
          "Mahasiswa Tel-U Gelar Touridates, Wisata Sejarah Kota Bandung Gen Z",
      description: "Description 3",
      image: "https://picsum.photos/200/300",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
