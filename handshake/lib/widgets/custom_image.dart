import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {

  late String? imageUrl;
  late String? initiales;
  late double radius;

  CustomImage(this.imageUrl, this.initiales, this.radius);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.blueAccent,
        child: Text(
          initiales ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: radius
          ),
        ),
      );
    } else {
      ImageProvider provider = CachedNetworkImageProvider(imageUrl!);
      if (radius == null) {
        // Image dans le chat
        return InkWell(
          child: Image(image: provider, width: 250),
          onTap: () {},
        );
      } else {
        return InkWell(
          child: CircleAvatar(
            radius: radius,
            backgroundImage: provider,
          ),
          onTap: () {},
        );
      }
    }
  }
}