import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';

class TVSerieCardWidget extends StatelessWidget {
  final TVSerieEntity tvSerie;
  const TVSerieCardWidget({super.key, required this.tvSerie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () =>
              Modular.to.pushNamed("/tv-serie-details/${tvSerie.id}"),
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                tvSerie.posterPath!.imageUrl,
                fit: BoxFit.cover,
                height: 180,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 28,
              height: 28,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: tvSerie.voteAverage / 10,
                      strokeWidth: 2,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation(Colors.green),
                    ),
                    Text(
                      '${(tvSerie.voteAverage * 10).floor()}%',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
