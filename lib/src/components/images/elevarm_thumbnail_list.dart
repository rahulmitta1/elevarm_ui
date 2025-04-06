import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmThumbnailList extends StatelessWidget {
  final List<String> imageUrls;
  final double size;
  final Function(BuildContext context, int index)? onTap;

  const ElevarmThumbnailList({
    required this.imageUrls,
    this.size = 64.0,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String url = imageUrls[index];
          return InkWell(
            onTap: onTap != null
                ? () {
                    onTap!(context, index);
                  }
                : null,
            borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                width: size,
                height: size,
                progressIndicatorBuilder: (context, url, progress) {
                  return Container(
                    color: ElevarmColors.primary200,
                    width: size,
                    height: size,
                  );
                },
                errorWidget: (_, __, ___) {
                  return Container(
                    color: ElevarmColors.danger200,
                    width: size,
                    height: size,
                    child: const Center(
                      child: ElevarmIcon(
                        ElevarmIconsOutline.alert_triangle,
                        color: ElevarmColors.danger,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8.0);
        },
        itemCount: imageUrls.length,
      ),
    );
  }
}
