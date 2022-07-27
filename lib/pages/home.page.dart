import 'package:flutter/material.dart';
import 'package:nasa/widgets/explore.dart';
import 'package:nasa/widgets/photo_of_the_day.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore some universe!'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: const [
                  Text(
                    'Photo of the day',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: PhotoOfTheDay(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Row(
                  children: const [
                    Text(
                      'Explore',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Explore()
            ],
          ),
        ),
      ),
    );
  }
}
