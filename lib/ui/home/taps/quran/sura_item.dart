import 'package:flutter/material.dart';
import 'package:islami_app_route/ui/home/taps/quran/quran_resourses.dart';
import 'package:islami_app_route/utils/app_images.dart';
import 'package:islami_app_route/utils/app_style.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImages.vectorimage),
                Text(
                  '${index + 1}',
                  style: AppStyle.white20,
                ),
              ],
            ),
            SizedBox(
              width: width * .04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${QuranResourses.englishsuraname[index]} ',
                  style: AppStyle.white20,
                ),
                Text(
                  '${QuranResourses.versenumber[index]} Verses  ',
                  style: AppStyle.white14,
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${QuranResourses.arabicsuraname[index]} ',
              style: AppStyle.white20,
            )
          ],
        ),
        Divider(
          color: const Color.fromRGBO(255, 255, 255, 1),
          indent: width * .1,
          endIndent: width * .05,
        )
      ],
    );
  }
}
