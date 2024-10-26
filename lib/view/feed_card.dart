import 'package:flutter/material.dart';

class Feedcard extends StatelessWidget {
  const Feedcard({super.key});

  @override
  Widget build(BuildContext context) {
    const profileImageUrl = 'https://www.pexels.com/photo/istanbul-istinye-18091667/';
    const postImageUrl = 'https://images.pexels.com/photos/28795942/pexels-photo-28795942/free-photo-of-elegant-bridal-bouquet-with-pink-roses.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load';

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            title: Text('Jusfan', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Estonia, Tallinn'),
            trailing: Icon(Icons.more_vert),
          ),
          Image.network(
            postImageUrl,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 16),
                Icon(Icons.chat_bubble_outline),
                SizedBox(width: 16),
                Icon(Icons.send),
                Spacer(),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '1,823 likes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'AzucarMoreno ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'in Spain'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Wrap(
              spacing: 8.0,
              children: [
                Chip(
                  label: Text('Spain'),
                  backgroundColor: Colors.orange.shade100,
                ),
                Chip(
                  label: Text('azucarmoreno'),
                  backgroundColor: Colors.orange.shade100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
