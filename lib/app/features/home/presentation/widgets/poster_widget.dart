import 'package:flutter/material.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';

class PosterWidget extends StatelessWidget {
  final String? posterPath;
  const PosterWidget({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 512,
      child: posterPath == null
          ? const Center(
              child: Icon(
                Icons.movie_creation_outlined,
                size: 128,
                color: Colors.grey,
              ),
            )
          : Image.network(
              posterPath!.imageUrl,
              height: 512,
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            ),
    );
  }
}
