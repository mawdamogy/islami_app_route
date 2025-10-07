import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_route/provider/most_recently_provider.dart';
import 'package:islami_app_route/ui/home/taps/quran/quran_resourses.dart';
import 'package:islami_app_route/utils/app_images.dart';
import 'package:islami_app_route/utils/app_style.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen2 extends StatefulWidget {
  const SuraDetailsScreen2({super.key});

  @override
  State<SuraDetailsScreen2> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen2> {
  String suracontent = '';
  MostRecentlyProvider? mostRecentlyProvider;
  @override
  void dispose() {
    mostRecentlyProvider?.getMostRecentlySuraList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mostRecentlyProvider = Provider.of<MostRecentlyProvider>(context);
    var size = MediaQuery.of(context).size;
    var index = ModalRoute.of(context)!.settings.arguments as int;
    if (suracontent.isEmpty) {
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
                child: ListView(children: [
                  Text(
                    suracontent,
                    style: AppStyle.primary20,
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
              //  const Spacer(),
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
    for (int i = 0; i < lines.length; i++) {
      lines[i] += " [${i + 1}] ";
    }
    setState(() {
      suracontent = lines.join();
    });
  }
}
