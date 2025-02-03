import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/photo_controller.dart';
import 'package:flutter_application_1/view/photo_card.dart';

import 'package:provider/provider.dart';

class FeedListWidget extends StatefulWidget {
  const FeedListWidget({
    super.key,
  });

  @override
  State<FeedListWidget> createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = Provider.of<PhotoController>(
        context,
        listen: false,
      );
      controller.fetch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PhotoController>();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        controller.fetch();
      },
      child: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.photos.length,
              itemBuilder: (context, index) => PhotoCard(
                photos: controller.photos[index],
              ),
            ),
    );
  }
}
