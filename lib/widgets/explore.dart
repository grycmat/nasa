import 'package:flutter/material.dart';
import 'package:nasa/models/photo_type.dart';
import 'package:nasa/widgets/explore_image.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ExploreImage(
        photoType: PhotoType.earth,
      ),
      ExploreImage(
        photoType: PhotoType.moon,
      ),
      ExploreImage(
        photoType: PhotoType.mars,
      )
    ]);
  }
}
