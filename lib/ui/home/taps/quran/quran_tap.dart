import 'package:flutter/material.dart';
import 'package:islami_app_route/ui/home/taps/quran/most_recently_widget.dart';
import 'package:islami_app_route/ui/home/taps/quran/quran_resourses.dart';
import 'package:islami_app_route/ui/home/taps/quran/sura_item.dart';
import 'package:islami_app_route/utils/app_colors.dart';
import 'package:islami_app_route/utils/app_images.dart';
import 'package:islami_app_route/utils/app_routes.dart';
import 'package:islami_app_route/utils/app_style.dart';
import 'package:islami_app_route/utils/shared_preference.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int> filtersuraList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                searchbysuraname(value);
              },
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
            const MostRecentlyWidget(),
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
            SizedBox(
              height: height * .25,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: filtersuraList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        saveNewSuraList(filtersuraList[index]);
                        Navigator.pushNamed(
                            context, AppRoutes.souradetails2route,
                            arguments: filtersuraList[index]);
                      },
                      child: SuraItem(
                        index: filtersuraList[index],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  searchbysuraname(String suraname) {
    List<int> filterSearchSureList = [];
    for (int i = 0; i < QuranResourses.englishsuraname.length; i++) {
      if (QuranResourses.englishsuraname[i]
          .toLowerCase()
          .contains(suraname.toLowerCase())) {
        filterSearchSureList.add(i);
      }
      if (QuranResourses.arabicsuraname[i].contains(suraname)) {
        filterSearchSureList.add(i);
      }
    }

    filtersuraList = filterSearchSureList;
    setState(() {});
  }
}
