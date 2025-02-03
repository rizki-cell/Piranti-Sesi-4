import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photo.dart';
import 'package:flutter_application_1/view/photo_detail.dart';

class PhotoCard extends StatefulWidget {
  final Photos photos;

  const PhotoCard({super.key, required this.photos});

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPhotoPage(
              photo: widget.photos,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.photos.user?.profileImage?.small ?? ''),
              ),
              title: Text(widget.photos.user?.userName ?? ''),
              subtitle: Text(widget.photos.user?.firstName ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPhotoPage(
                        photo: widget.photos,
                      ),
                    ),
                  );
                },
              ),
            ),
            Image.network(
              widget.photos.urls?.regular ?? '',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    // context.read<FeedController>().like(widget.photos);
                  },
                  icon: Icon(
                    (widget.photos.likedByUser ?? false)
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded,
                    color: (widget.photos.likedByUser ?? false)
                        ? Colors.red
                        : null, // Tidak ada warna jika false
                    size: 24.0,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.mode_comment_outlined,
                  size: 24.0,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.send_outlined,
                  size: 24.0,
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      // context.read<FeedController>().bookmark(widget.photos);
                    },
                    icon: Icon(
                      (widget.photos.likedByUser ?? false)
                          ? Icons.bookmark
                          : Icons.bookmark_outline_rounded,
                      color: (widget.photos.likedByUser ?? false)
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : null, // Tidak ada warna jika false
                      size: 24.0,
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text((widget.photos.likes ?? 0).toString()),
              subtitle: Text(widget.photos.altDescription ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
