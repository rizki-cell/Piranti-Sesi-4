import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photo.dart';
import 'package:intl/intl.dart'; // Tambahkan pustaka intl untuk format tanggal

class DetailPhotoPage extends StatelessWidget {
  final Photos photo;

  const DetailPhotoPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ambil dan parsing createdAt
    String createdAtString = photo.welcome?.createdAt?.toString() ?? '';
    DateTime createdAt =
        DateTime.tryParse(createdAtString) ?? DateTime(1970, 1, 1);
    String formattedDate = DateFormat('MMMM dd, yyyy').format(createdAt);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Photo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(photo.user?.profileImage?.small ?? ''),
                    ),
                    title: Text(photo.user?.userName ?? ''),
                    subtitle: Text(photo.user?.firstName ?? ''),
                    trailing: const Icon(Icons.more_vert_rounded),
                  ),
                  Hero(
                    tag: photo.id ?? '',
                    child: Image.network(
                      photo.urls?.regular ?? '',
                      fit: BoxFit.cover,
                      height: 500,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 4),
                      Text('${photo.likes ?? 0} likes'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    photo.altDescription ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Menampilkan tanggal dalam format yang mudah dibaca
                  Text(
                    'Uploaded on: $formattedDate',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
