import 'package:flutter/material.dart';
import 'package:islami_app_route/provider/most_recently_provider.dart';
import 'package:islami_app_route/ui/home/taps/quran/quran_resourses.dart';
import 'package:islami_app_route/utils/app_colors.dart';
import 'package:islami_app_route/utils/app_images.dart';
import 'package:islami_app_route/utils/app_style.dart';
import 'package:provider/provider.dart';

class MostRecentlyWidget extends StatefulWidget {
  const MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentlyProvider mostRecentlyProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        mostRecentlyProvider.getMostRecentlySuraList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mostRecentlyProvider = Provider.of<MostRecentlyProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: mostRecentlyProvider.mostrecentlyList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Recently',
            style: AppStyle.white16,
          ),
          SizedBox(
            height: size.height * .02,
          ),
          SizedBox(
            height: size.height * .17,
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
                              horizontal: size.width * .03,
                              vertical: size.width * .03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  QuranResourses.englishsuraname[
                                      mostRecentlyProvider
                                          .mostrecentlyList[index]],
                                  style: AppStyle.black24),
                              Text(
                                  QuranResourses.arabicsuraname[
                                      mostRecentlyProvider
                                          .mostrecentlyList[index]],
                                  style: AppStyle.black24),
                              Text(
                                  '${QuranResourses.versenumber[mostRecentlyProvider.mostrecentlyList[index]]} verses',
                                  style: AppStyle.black14),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * .03),
                            child: Image.asset(AppImages.mostrecentlyImage)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: size.width * .03,
                  );
                },
                itemCount: mostRecentlyProvider.mostrecentlyList.length),
          ),
        ],
      ),
    );
  }
}
