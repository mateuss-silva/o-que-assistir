import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCategoriesWidget extends StatelessWidget {
  const LoadingCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _movieCategory(),
          _movieCategory(),
          _movieCategory(),
        ],
      ),
    );
  }

  _movieCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Carregando...",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              const child = Card(
                child: SizedBox(
                  height: 180,
                  width: 120,
                ),
              );
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: child,
                );
              } else if (index == 3) {
                return const Padding(
                  padding: EdgeInsets.only(right: 8.0),
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
