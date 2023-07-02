import 'package:flutter/material.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<({String name, String image})> cast = [
      (
        name: "Edward Norton",
        image: "https://image.tmdb.org/t/p/w500/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg"
      ),
      (
        name: "Brad Pitt",
        image: "https://image.tmdb.org/t/p/w500/sra9JWUaXGs4NlAueA7CpuYzLCk.jpg"
      ),
      (
        name: "Helena Bonham Carter",
        image: "https://image.tmdb.org/t/p/w500/DDeITcCpnBd0CkAIRPhggy9bt5.jpg"
      ),
      (
        name: "Meat Loaf",
        image: "https://image.tmdb.org/t/p/w500/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg"
      ),
      (
        name: "Jared Leto",
        image: "https://image.tmdb.org/t/p/w500/ca3x0OfIKbJppZh8S1Alx3GfUZO.jpg"
      ),
      (
        name: "Zach Grenier",
        image: "https://image.tmdb.org/t/p/w500/fSyQKZO39sUsqY283GXiScOg3Hi.jpg"
      ),
      (
        name: "Holt McCallany",
        image: "https://image.tmdb.org/t/p/w500/a5ax2ICLrV6l0T74OSFvzssCQyQ.jpg"
      ),
    ];
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            "Atores",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final ator = cast[index];
              var child = SizedBox(
                width: 60,
                height: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      foregroundImage: NetworkImage(ator.image),
                    ),
                    Text(
                      ator.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: child,
                );
              } else if (index == 9) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: child,
                );
              }
              return child;
            },
          ),
        ),
      ],
    );
  }
}
