import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_route/ui/home/taps/quran/details/sura_contect_item1.dart';
import 'package:islami_app_route/ui/home/taps/quran/quran_resourses.dart';
import 'package:islami_app_route/utils/app_images.dart';
import 'package:islami_app_route/utils/app_style.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var index = ModalRoute.of(context)!.settings.arguments as int;
    if (verses.isEmpty) {
      loadsurafile(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResourses.englishsuraname[index],
          style: AppStyle.primary20,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.detailsbg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * .04,
              ),
              Text(
                QuranResourses.arabicsuraname[index],
                style: AppStyle.primary24,
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return SuraContectItem(
                        index: index, versecontent: verses[index]);
                  },
                ),
              ),
              Image.asset(AppImages.musqueimage)
            ],
          ),
        ],
      ),
    );
  }

  loadsurafile(int index) async {
    String filecontent =
        await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    List<String> lines = filecontent
        .split('\n')
        .map((line) => line.trim()) // شيل المسافات من أول وآخر السطر
        .where((line) => line.isNotEmpty) // استبعد السطور الفاضية
        .toList();
    setState(() {
      verses = lines;
    });
  }
}
