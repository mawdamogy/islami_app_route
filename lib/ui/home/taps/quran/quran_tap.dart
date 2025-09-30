import 'package:flutter/material.dart';
import 'package:islami_app_route/ui/home/taps/quran/quran_resourses.dart';
import 'package:islami_app_route/ui/home/taps/quran/sura_item.dart';
import 'package:islami_app_route/utils/app_colors.dart';
import 'package:islami_app_route/utils/app_images.dart';
import 'package:islami_app_route/utils/app_routes.dart';
import 'package:islami_app_route/utils/app_style.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyle.white16,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              prefixIcon: Image.asset(AppImages.iconsearch),
              hintText: 'Sura Name',
              hintStyle: AppStyle.white16,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 2)),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Text(
            'Most Recently',
            style: AppStyle.white16,
          ),
          SizedBox(
            height: height * .02,
          ),
          SizedBox(
            height: height * .17,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * .03, vertical: width * .03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Al-Anbiya', style: AppStyle.black24),
                              Text('الانبياء', style: AppStyle.black24),
                              Text('112 verses', style: AppStyle.black14),
                            ],
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: width * .03),
                            child: Image.asset(AppImages.mostrecentlyImage)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: width * .03,
                  );
                },
                itemCount: 10),
          ),
          SizedBox(
            height: height * .02,
          ),
          Text(
            'Suras List',
            style: AppStyle.white16,
          ),
          SizedBox(
            height: height * .02,
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: QuranResourses.arabicsuraname.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.souradetails2route,
                          arguments: index);
                    },
                    child: SuraItem(
                      index: index,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
