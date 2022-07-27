import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa/models/apod.dart';
import 'package:nasa/services/http.service.dart';
import 'package:nasa/widgets/media_player.dart';
import 'package:skeletons/skeletons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PhotoOfTheDay extends StatelessWidget {
  PhotoOfTheDay({Key? key}) : super(key: key);
  final _http = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _http.getApod(),
        builder: (context, AsyncSnapshot<Apod> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeleton(
                isLoading: true,
                skeleton: const SkeletonAvatar(
                  style:
                      SkeletonAvatarStyle(width: double.infinity, height: 300),
                ),
                child: Container());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var apod = snapshot.data!;
              if (apod.media_type == 'video') {
                return MediaPlayer(url: apod.url);
              }
              return SizedBox(
                width: double.infinity,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(fit: StackFit.expand, children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: apod.url,
                      placeholder: (_, __) => const SkeletonAvatar(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 36,
                        color: Colors.grey.withOpacity(0.3),
                        alignment: Alignment.center,
                        child: Text(
                          apod.title,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }
          }
          return Container();
        });
  }
}
