import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://t4.ftcdn.net/jpg/00/93/96/23/360_F_93962340_0s1fqDktYcAfdQ1Q7BS5v3ZPu9g4LBpB.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const NetworkImage(
            'https://i0.wp.com/kamusnetizen.com/wp-content/uploads/2022/04/channels4_profile-1.jpg?fit=900%2C900&ssl=1'),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Muhamad Ikbal',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            '065120015',
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 148, 136, 136)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.facebook),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.instagram),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          buildAbout(),
          const SizedBox(height: 32),
        ],
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Hallo, Perekenalkan saya ikbal lahir di Bogor lahir pada tanggal 21 april 2001, saat ini saya masi berkuliah di universitas pakuan jurusan ilmu komputer',
              style: TextStyle(fontSize: 18, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Center(
            child: Icon(
          icon,
          size: 32,
        )),
      );
}
