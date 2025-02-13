
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
             placeholder: (context, url) => const Center(child: SizedBox(
              height: 30,width: 30,
              child: CircularProgressIndicator())),
          imageUrl:imageUrl, fit: BoxFit.fill
         , errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),
          
       ),
      ),
    );
  }
}



/*AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.amber,
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill)),
      ),
    );*/

