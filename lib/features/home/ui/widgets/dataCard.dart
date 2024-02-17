import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:together_assignment/features/home/util/colors.dart';
import 'package:together_assignment/features/home/util/size.dart';

class DataCard extends StatelessWidget {
  final List<HomeDataModel> datas;
  final int index;

  const DataCard({Key? key, required this.datas, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = datas[index].imageUrl;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          color: cardG,
          elevation: 2.0,
          margin: const EdgeInsets.only(bottom: 0.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.5),
                    // ignore: unnecessary_null_comparison
                    child: Image.network(
                      imageUrl,
                      width: imgSize,
                      height: imgSize,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                            width: imgSize, height: imgSize, color: cardG);
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: imgSize,
                          height: imgSize,
                          color: const Color.fromARGB(0, 77, 75, 75),
                        );
                      },
                      fit: BoxFit.cover,
                    )),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas[index].title,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: dataCardTitleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        datas[index].description,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: dataCardDescriptionSize,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
