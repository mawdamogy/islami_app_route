import 'package:flutter/material.dart';
import 'package:islami_app_route/ui/home/taps/azkar/azkar_tap.dart';
import 'package:islami_app_route/ui/home/taps/hadeth/hadeth_tap.dart';
import 'package:islami_app_route/ui/home/taps/quran/quran_tap.dart';
import 'package:islami_app_route/ui/home/taps/radio/radio_tap.dart';
import 'package:islami_app_route/ui/home/taps/tasbeeh/tasbeeh_tap.dart';
import 'package:islami_app_route/utils/app_colors.dart';
import 'package:islami_app_route/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<String> imagesBG = [
    AppImages.quranbg,
    AppImages.hadethbg,
    AppImages.azkarbg,
    AppImages.radiobg,
    AppImages.azkarbg,
  ];
  List<Widget> tapsBody = const [
    QuranTap(),
    HadethTap(),
    TasbeehTap(),
    RadioTap(),
    AzkarTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagesBG[selectedindex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppImages.logo),
              Expanded(child: tapsBody[selectedindex]),
            ],
          ),
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
                currentIndex: selectedindex,
                onTap: (value) {
                  selectedindex = value;
                  setState(() {});
                },
                ////   type: BottomNavigationBarType.fixed,
                //  backgroundColor: AppColors.primaryColor,
                items: [
                  buildBottomNavigationItem(0, AppImages.iconquran, 'Quran'),
                  buildBottomNavigationItem(1, AppImages.iconhadeth, 'Hadeth'),
                  buildBottomNavigationItem(
                      2, AppImages.icontasbeeh, 'Tasbeeh'),
                  buildBottomNavigationItem(3, AppImages.iconradio, 'Radio'),
                  buildBottomNavigationItem(4, AppImages.iconazkar, 'Time'),
                ]),
          ),
        )
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationItem(
      int index, String imageUrl, String label) {
    return BottomNavigationBarItem(
      icon: selectedindex == index
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.blackbgColor),
              child: ImageIcon(AssetImage(imageUrl)))
          : ImageIcon(AssetImage(imageUrl)),
      label: label,
    );
  }
}
