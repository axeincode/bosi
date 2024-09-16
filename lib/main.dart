import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // TRY THIS: Try running your application with "flutter run". You'll see
      //   // the application has a purple toolbar. Then, without quitting the app,
      //   // try changing the seedColor in the colorScheme below to Colors.green
      //   // and then invoke "hot reload" (save your changes or press the "hot
      //   // reload" button in a Flutter-supported IDE, or press "r" if you used
      //   // the command line to start the app).
      //   //
      //   // Notice that the counter didn't reset back to zero; the application
      //   // state is not lost during the reload. To reset the state, use hot
      //   // restart instead.
      //   //
      //   // This works for code too, not just values: Most code changes can be
      //   // tested with just a hot reload.
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column (
            children: [
              ImageSection(
                image: 'images/lake.jpg'
              ),
              TitleSection (
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland'
              ),
              ButtonSection(),
              TextSection(
                description: 
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                  'Bernese Alps. Situated 1,578 meters above sea level, it '
                  'is one of the larger Alpine Lakes. A gondola ride from '
                  'Kandersteg, followed by a half-hour walk through pastures '
                  'and pine forest, leads you to the lake, which warms to 20 '
                  'degrees Celsius in the summer. Activities enjoyed here '
                  'include rowing, and riding the summer toboggan run.'
              ),
            ]
          )
        ),
      )
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {

    return Padding (
      padding: const EdgeInsets.all(32),
      child: Row (
        children: [
          Expanded (
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding (
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text (
                    name,
                    style: const TextStyle (
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
                Text(
                  location,
                  style: TextStyle (
                    color: Colors.grey[500]
                  )
                )
              ]
            )
          ),
          Icon (
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ]
      )
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE'
          ),
        ]
      )
    );
  }
}

class ButtonWithText extends StatelessWidget {

  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });
  
  final Color color;
  final IconData icon;
  final String label;

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
            )
          )
        )
      ]
    );
  }
}


class TextSection extends StatelessWidget {

  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true
      )
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image
  });

  final String image;

  @override

  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 400,
      fit: BoxFit.cover
    );
  }
}