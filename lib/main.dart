import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MinionDatingApp());
}

class MinionDatingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minion Dating',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minion Dating'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> minionProfiles = [
    {
      'name': 'Stuart',
      'imageUrl':
          'https://m.media-amazon.com/images/I/61bRfnGfJTL._AC_UF894,1000_QL80_.jpg',
      'description':
          'Hi, I’m stuart. I am the nice guy in the friend group. I like dogs and cats and every single animal because I am a nice guy. A lot of people say that last guys finish last, but I finish first.',
    },
    {
      'name': 'Jamestown',
      'imageUrl':
          'https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/1280x1280/products/88251/90865/Prison-Minion-with-Bananas-cardboard-cutout-buy-now-at-Starsills__48033.1497885770.jpg?c=2',
      'description':
          'Hi, I am jamestown. I love throwing bananas as a hobby. I always think that will come back to me like a boomerang but they never do. Like the girls. I am a funny guy.',
    },
    {
      'name': 'Moana',
      'imageUrl':
          'https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/2-minion-diana-dina-hassanah.jpg',
      'description':
          'Hi, I am Moana! I love the ocean, seashells, coconuts, and girls. I may seem like a girl but I am a manly man. ',
    },
    {
      'name': 'Timothy',
      'imageUrl':
          'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6394/6394649_sd.jpg',
      'description':
          'Hi, I am timothy. I am 12 years old. I found this app while searching my mother’s phone. Maybe she is cheating or maybe she is looking for a friend. My goal is to find a pretty 12 year old girl.',
    },
    {
      'name': 'King Bob',
      'imageUrl': 'https://i.ytimg.com/vi/TjAg-8qqR3g/maxresdefault.jpg',
      'description': 'Hi, I am king bob. ',
    },
    {
      'name': 'Bikini Bottom',
      'imageUrl':
          'https://www.hollywoodreporter.com/wp-content/uploads/2015/05/minion_bum.jpg?w=3000',
      'description':
          'Hi, I am buttocks. Some girls say I have a fatter butt than they do, but I know theyre all just jealous. ',
    },
    {
      'name': 'Alfredo',
      'imageUrl':
          'https://ew.com/thmb/itBOq2hZizO_ENbSQc-zTvSYfeg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2458_mdm3_prints_p1880-2000-6f64ba16b7654cef8a4942c62ab7f1d0.jpg',
      'description':
          'Hi, I robbed a bank. Some say I am a criminal, but the only time I’ve been a criminal is when I stole your heart. haha get it. ',
    },
    {
      'name': 'Henry VIII',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQarI8_bhd4dKXmgXu6rNsJMkrB3qeTIkz71bl2m3MBUYcKyCphg6-E9fVFbw7NZ_nLV3c&usqp=CAU',
      'description':
          'In am Henry. I am the 8th guy in my family named henry. I love my father. I will name our child henry the 9th. ',
    },
    {
      'name': 'Consuela',
      'imageUrl':
          'https://i.pinimg.com/736x/ba/3a/3f/ba3a3f8dd50cbcdce5359d544fdb4c82.jpg',
      'description':
          ' Hi, I am Conseula. I love coconuts too. Please find me moana. ',
    },
    {
      'name': 'Willy Wonka',
      'imageUrl':
          'https://static.wikia.nocookie.net/vsbattles/images/f/fb/PicsArt_09-15-09.07.08.png/revision/latest/scale-to-width-down/400?cb=20180916001020',
      'description': 'Huelao, I ma Willeey Wonka. I hate Gru. ',
    },
  ];

  // List to store indices of rejected and liked profiles
  List<int> rejectedProfiles = [];
  List<int> likedProfiles = [];

  // Boolean flags to control image visibility
  bool showBananaImage = false;
  bool showRejected = false;

  // PageController for PageView
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minion Dating'),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              int currentIndex = _pageController.page!.round();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(minionProfiles[currentIndex]['name']),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          Text(minionProfiles[currentIndex]['description'] ??
                              'No description available'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: minionProfiles.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        minionProfiles[index]['imageUrl'],
                        height: 400,
                        width: 400,
                      ),
                      SizedBox(height: 20),
                      Text(
                        minionProfiles[index]['name'],
                        style: TextStyle(
                            fontSize: 30, fontFamily: 'American Typewriter'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (showBananaImage)
            Center(
              child: TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Image.network(
                      'https://images.vexels.com/media/users/3/143061/isolated/preview/aaf71ed4e387a6838e1c521fbecde77a-banana-icon-fruit.png',
                      height: 350,
                      width: 350,
                    ),
                  );
                },
              ),
            ),
          if (showRejected)
            Center(
              child: TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Image.network(
                      'https://www.onlygfx.com/wp-content/uploads/2016/09/red-rejected-stamp-1.png',
                      height: 350,
                      width: 350,
                    ),
                  );
                },
              ),
            ),
          Positioned(
            bottom: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                // Add the index of the rejected profile to the list
                rejectedProfiles.add(_pageController.page!.round());
                setState(() {
                  showRejected = true;
                });
                showSnackBar('Rejected!');
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    showRejected = false;
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    if (_pageController.page!.round() ==
                        minionProfiles.length - 1) {
                      navigateToResultsPage();
                    }
                  });
                });
              },
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/X_mark.svg/896px-X_mark.svg.png',
                height: 55,
                width: 55,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // Add the index of the liked profile to the list
                likedProfiles.add(_pageController.page!.round());
                setState(() {
                  showBananaImage = true;
                });
                showSnackBar('Banana Liked!');
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    showBananaImage = false;
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    if (_pageController.page!.round() ==
                        minionProfiles.length - 1) {
                      navigateToResultsPage();
                    }
                  });
                });
              },
              child: Image.network(
                'https://images.vexels.com/media/users/3/143061/isolated/preview/aaf71ed4e387a6838e1c521fbecde77a-banana-icon-fruit.png',
                height: 55,
                width: 55,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Function to navigate to the results page
  void navigateToResultsPage() {
    // Randomly select one of the liked profiles
    if (likedProfiles.isNotEmpty) {
      int randomIndex = likedProfiles[Random().nextInt(likedProfiles.length)];
      Map<String, dynamic> selectedProfile = minionProfiles[randomIndex];
      // Navigate to the results page and pass the selected profile
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(selectedProfile: selectedProfile),
        ),
      );
    }
  }
}

class ResultsPage extends StatefulWidget {
  final Map<String, dynamic> selectedProfile;

  ResultsPage({required this.selectedProfile});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage>
    with SingleTickerProviderStateMixin {
  late Map<String, dynamic> _newMatch;
  late AnimationController _animationController;
  bool _isButtonPressed = false;
  List<Offset> _hearts = [];

  @override
  void initState() {
    super.initState();
    _newMatch = widget.selectedProfile;

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              painter: HeartPainter(_hearts),
              size: Size.infinite,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WE MATCHED YOU WITH...',
                    style: TextStyle(fontSize: 35, fontFamily: 'Impact'),
                  ),
                  SizedBox(height: 20),
                  Image.network(
                    _newMatch['imageUrl'],
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    _newMatch['name'],
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'American Typewriter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTapDown: (details) {
                      _isButtonPressed = true;
                      _addHeart(details.localPosition);
                      _animationController.repeat(reverse: true);
                    },
                    onTapUp: (_) {
                      _isButtonPressed = false;
                      _clearHearts();
                      _animationController.stop();
                    },
                    onTapCancel: () {
                      _isButtonPressed = false;
                      _clearHearts();
                      _animationController.stop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.all(20),
                      child:
                          Icon(Icons.favorite, size: 50, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addHeart(Offset position) {
    setState(() {
      _hearts.add(position);
    });
  }

  void _clearHearts() {
    setState(() {
      _hearts.clear();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class HeartPainter extends CustomPainter {
  final List<Offset> offsets;

  HeartPainter(this.offsets);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    for (var offset in offsets) {
      _drawHeart(canvas, offset, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawHeart(Canvas canvas, Offset offset, Paint paint) {
    final double dx = offset.dx;
    final double dy = offset.dy;
    final double heartSize = 40; // Adjust the heart size here

    final Path path = Path()
      ..moveTo(dx, dy + heartSize * 0.5)
      ..cubicTo(
        dx + heartSize * 0.5,
        dy - heartSize * 1,
        dx + heartSize * 2,
        dy + heartSize * 0.5,
        dx + heartSize,
        dy + heartSize * 2,
      )
      ..cubicTo(
        dx - heartSize * 0.5,
        dy + heartSize * 2.65,
        dx - heartSize * 2,
        dy + heartSize * 0.5,
        dx - heartSize * 0.25,
        dy + heartSize * 0.5,
      );

    canvas.drawPath(path, paint);
  }
}
