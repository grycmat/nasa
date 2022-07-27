import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa/models/asset.dart';
import 'package:nasa/models/photo_type.dart';
import 'package:nasa/services/http.service.dart';
import 'package:skeletons/skeletons.dart';

class ExploreImage extends StatelessWidget {
  ExploreImage({Key? key, required this.photoType}) : super(key: key);
  final HttpService http = HttpService();
  final PhotoType photoType;

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        width: 110,
        height: 110,
        imageUrl: url,
        placeholder: (_, __) => const SizedBox(
          width: 110,
          height: 110,
          child: SkeletonAvatar(),
        ),
      ),
    );
  }

  Future<Asset> _selectImageType() {
    switch (photoType) {
      case PhotoType.earth:
        return http.getEarth();
      case PhotoType.moon:
        return http.getMoon();
      case PhotoType.mars:
        return http.getMars();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _selectImageType(),
      builder: (context, AsyncSnapshot<Asset> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 110,
            height: 110,
            child: SkeletonAvatar(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          var asset = snapshot.data!;
          return _buildImage(asset.collection.items[0].href);
        }

        return Container();
      },
    );
  }
}
