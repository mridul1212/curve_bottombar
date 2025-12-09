import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeReelsPage extends StatefulWidget {
  const YoutubeReelsPage({super.key});

  @override
  State<YoutubeReelsPage> createState() => _YoutubeReelsPageState();
}

class _YoutubeReelsPageState extends State<YoutubeReelsPage> {
  final PageController pageController = PageController();
  late List<YoutubePlayerController> controllers;

  final List<String> videoIds = [
    "dQw4w9WgXcQ",
    "LXb3EKWsInQ",
    "ktvTqknDobU",
    "LXb3EKWsInQ",
    "dQw4w9WgXcQ",
    "ktvTqknDobU",
  ];

  bool showScrollDownButton = false;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();

    controllers = videoIds.map((id) {
      return YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          loop: true,
        ),
      );
    }).toList();

    pageController.addListener(() {
      double offset = pageController.page ?? 0;

      /// Show ↓ arrow when scrolling down
      if (offset > lastOffset) {
        if (!showScrollDownButton) {
          setState(() => showScrollDownButton = true);
        }
      } else {
        if (showScrollDownButton) {
          setState(() => showScrollDownButton = false);
        }
      }

      lastOffset = offset;

      /// Auto play/pause videos
      int index = offset.round();
      playVideo(index);
    });
  }

  void playVideo(int index) {
    for (int i = 0; i < controllers.length; i++) {
      if (i == index) {
        controllers[i].play();
      } else {
        controllers[i].pause();
      }
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// ================= VIDEO PAGEVIEW =================
          PageView.builder(
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemCount: controllers.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  /// ---- VIDEO UI ----
                  Positioned.fill(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: YoutubePlayer(
                          controller: controllers[index],
                          showVideoProgressIndicator: true,
                        ),
                      ),
                    ),
                  ),

                  /// ================= RIGHT ACTION BUTTONS =================
                  Positioned(
                    right: 15,
                    bottom: 90,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => print("Profile clicked $index"),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                              "https://i.pravatar.cc/150?img=$index",
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        InkWell(
                          onTap: () => print("Like clicked $index"),
                          child: Column(
                            children: const [
                              Icon(Icons.favorite, color: Colors.pink, size: 35),
                              SizedBox(height: 4),
                              Text("706", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        InkWell(
                          onTap: () => print("Comment clicked $index"),
                          child: Column(
                            children: const [
                              Icon(Icons.comment, color: Colors.white, size: 35),
                              SizedBox(height: 4),
                              Text("16", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        InkWell(
                          onTap: () => print("Share clicked $index"),
                          child: Column(
                            children: const [
                              Icon(Icons.share, color: Colors.white, size: 35),
                              SizedBox(height: 4),
                              Text("10", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ================= VIDEO TITLE (BOTTOM LEFT) =================
                  Positioned(
                    left: 20,
                    bottom: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Samia Akter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Best guitar beats 🎸",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          /// ================= TOP TAB BAR =================
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorWeight: 3,
                tabs: const [
                  Tab(text: "New Trends"),
                  Tab(text: "For You"),
                  Tab(text: "Following"),
                ],
              ),
            ),
          ),

          /// =========================================================
          ///        GLASS EFFECT SCROLL DOWN BUTTON (BOTTOM)
          /// =========================================================
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: showScrollDownButton ? 20 : -120,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  final nextPage = (pageController.page ?? 0).round() + 1;
                  if (nextPage < controllers.length) {
                    pageController.animateToPage(
                      nextPage,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // EXTENDED GLASS BLUR BACKDROP BELOW BUTTON
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          height: 100, // taller than button
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),

                    // THE ARROW BUTTON
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
