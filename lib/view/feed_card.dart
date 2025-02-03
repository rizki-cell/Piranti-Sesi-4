import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/feed_controller.dart';
import 'package:flutter_application_1/model/feed.dart';
import 'package:provider/provider.dart';

class FeedCard extends StatefulWidget {
  final Feed feed;

  const FeedCard({super.key, required this.feed});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.feed.user.avatar),
          ),
          title: Text(widget.feed.user.name),
          subtitle: Text(widget.feed.user.place),
          trailing: const Icon(Icons.more_vert_rounded),
        ),
        Image.network(
          widget.feed.content.image,
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
                  context.read<FeedController>().like(widget.feed);
                },
                icon: Icon(
                  widget.feed.content.isLike
                      ? Icons.favorite
                      : Icons.favorite_outline_rounded,
                  color: widget.feed.content.isLike
                      ? Colors.red
                      : null, // Tidak ada warna jika false
                  size: 24.0,
                )),
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
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    context.read<FeedController>().bookmark(widget.feed);
                  },
                  icon: Icon(
                    widget.feed.content.bookmark
                        ? Icons.bookmark
                        : Icons.bookmark_outline_rounded,
                    color: widget.feed.content.bookmark
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : null, // Tidak ada warna jika false
                    size: 24.0,
                  )),
              // Icon(Icons.bookmark_outline_rounded),
            )
          ],
        ),
        ListTile(
          title: Text(widget.feed.content.likes),
          subtitle: Text(widget.feed.content.descriptions),
        )
      ]),
    );
  }
}
