import 'package:appbar3d/community/widgets/blog_screen.dart';
import 'package:appbar3d/community/widgets/book_edit.dart';
import 'package:appbar3d/community/widgets/event_card.dart';
import 'package:appbar3d/community/widgets/post_function.dart';
import 'package:appbar3d/community/widgets/post_widgets.dart';
import 'package:appbar3d/community/widgets/see_all.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildFeedTab() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        Gap(20),
        Container(
          height: 131,
          decoration: ShapeDecoration(
            color: const Color(0xFF0F172B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/40x40"),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Gap(10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF354152),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 40, // Minimum height
                          maxHeight: 200, // Maximum height before scrolling
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: TextField(
                            style: const TextStyle(
                              color: Color(0xFF697282),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.43,
                            ),
                            cursorColor: const Color(0xFF697282),
                            decoration: const InputDecoration(
                              hintText: 'Whats on your mind...',
                              hintStyle: TextStyle(
                                color: Color(0xFF697282),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null, // Allows expanding vertically
                          ),
                        ),
                      ),
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 64,
                          height: 24,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 1,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: const Color(0xFF364153),
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Text(
                            'Select a Book',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.75,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 24,
                          padding: const EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, 0.50),
                              end: Alignment(-0.00, 0.50),
                              colors: [
                                const Color(0xFFBC0974),
                                const Color(0xFF50226A),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Text(
                            'Post',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.67,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gap(20),
        SeeAll(title: "Community Posts", onPressed: () {}),
        Gap(15),
        PostViewWidgets(),
        Gap(20),
        SeeAll(title: "Kabbik Blog", onPressed: () {}),
        Gap(15),
        BlogScreen(),
        Gap(20),
        SeeAll(title: "Kabbik upcoming events", onPressed: () {}),
        Gap(15),
        EventCard(),
        Gap(20),
        BookEdit(),
        Gap(20),
      ],
    );
  }

  Widget _buildStatsTab() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        Row(
          children: [
            Icon(Icons.bookmarks_outlined),
            Gap(5),
            Text(
              'your listening stats',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.43,
              ),
            ),
          ],
        ),
        Gap(15),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 179 / 112, // your container ratio
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: ShapeDecoration(
                color: const Color(0x7F0F172B),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.89, color: Color(0x7F314157)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 28.52,
                    height: 28.52,
                    padding: const EdgeInsets.all(7.13),
                    decoration: ShapeDecoration(
                      color: const Color(0x1951A2FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.91),
                      ),
                    ),
                    child: const Icon(Icons.watch_later_outlined, size: 16),
                  ),
                  const Text(
                    '42.5h',
                    style: TextStyle(
                      color: Color(0xFF50A2FF),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.40,
                    ),
                  ),
                  Text(
                    'Hours Listened',
                    style: TextStyle(
                      color: Color(0xFF90A1B8),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Gap(20),
        Row(
          children: [
            Icon(Icons.mic_none),
            Gap(5),
            Text(
              'Featured Author',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.43,
              ),
            ),
          ],
        ),
        Gap(10),
        Container(
          width: 370,
          height: 110,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.96),
              end: Alignment(0.01, 0.02),
              colors: [const Color(0xFFBC0974), const Color(0xFF50226A)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/40x40"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.79,
                      color: const Color(0x4CC17AFF),
                    ),
                    borderRadius: BorderRadius.circular(29988234),
                  ),
                ),
              ),
              Gap(10),
              Column(
                children: [
                  Text(
                    'মানিক বন্দ্যোপাধ্যায়',
                    style: TextStyle(
                      color: const Color(0xFFF0F4F9),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                    ),
                  ),
                  Gap(5),
                  Text(
                    'Master Author',
                    style: TextStyle(
                      color: const Color(0xFF90A1B8),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '142',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFDC0277),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                          Text(
                            'Books',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '12,400',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF50A2FF),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                          Text(
                            'Listeners',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text(
                                '4.6',
                                style: TextStyle(
                                  color: const Color(0xFFFDC700),
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Rating',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(10),
        Container(
          width: 370,
          height: 110,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.96),
              end: Alignment(0.01, 0.02),
              colors: [const Color(0xFFBC0974), const Color(0xFF50226A)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/40x40"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.79,
                      color: const Color(0x4CC17AFF),
                    ),
                    borderRadius: BorderRadius.circular(29988234),
                  ),
                ),
              ),
              Gap(10),
              Column(
                children: [
                  Text(
                    'মানিক বন্দ্যোপাধ্যায়',
                    style: TextStyle(
                      color: const Color(0xFFF0F4F9),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                    ),
                  ),
                  Gap(5),
                  Text(
                    'Master Author',
                    style: TextStyle(
                      color: const Color(0xFF90A1B8),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '142',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFDC0277),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                          Text(
                            'Books',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '12,400',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF50A2FF),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                          Text(
                            'Listeners',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text(
                                '4.6',
                                style: TextStyle(
                                  color: const Color(0xFFFDC700),
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Rating',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(20),
        Row(
          children: [
            Icon(Icons.local_fire_department_outlined),
            Gap(5),
            Text(
              'Popular Genres',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.43,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 59,
          padding: const EdgeInsets.symmetric(horizontal: 10.72),
          decoration: ShapeDecoration(
            color: const Color(0x7F0F172B),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.89, color: const Color(0x7F314157)),
              borderRadius: BorderRadius.circular(8.94),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 28.60,
                height: 28.60,
                padding: const EdgeInsets.only(right: 0.01),
                decoration: ShapeDecoration(
                  color: Colors.white.withValues(alpha: 0.10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29988234),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 28.60,
                      height: 28.60,
                      padding: const EdgeInsets.only(right: 0.01),
                      decoration: ShapeDecoration(
                        color: Colors.white.withValues(alpha: 0.10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29988234),
                        ),
                      ),
                      child: Text(
                        '#1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.51,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700,
                          height: 1.43,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Fantasy',
                          style: TextStyle(
                            color: const Color(0xFFE1E8F0),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        ),
                        SizedBox(
                          width: 77.75,
                          child: Text(
                            '23,400 listeners',
                            style: TextStyle(
                              color: const Color(0xFF90A1B8),
                              fontSize: 10.72,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              height: 1.33,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 31,
                          height: 31,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://placehold.co/31x31"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContributionTab() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        Center(
          child: Text(
            'Top Contributors',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Gap(20),
        Container(
          height: 160,
          width: 279,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  width: 279,
                  height: 122,
                  decoration: ShapeDecoration(
                    color: Colors.white.withValues(alpha: 0.20),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.98,
                        color: const Color(0xFFBC0974),
                      ),
                      borderRadius: BorderRadius.circular(7.80),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Ralph Edwards',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 77.36,
                            padding: const EdgeInsets.all(4.95),
                            decoration: ShapeDecoration(
                              color: Colors.white.withValues(alpha: 0.10),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(3.09),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 6.19,
                              children: [
                                SizedBox(
                                  width: 67.46,
                                  child: Text(
                                    'Listening Hour',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.50,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 67.46,
                                  child: Text(
                                    '15 hour',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7.43,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 77.36,
                            padding: const EdgeInsets.all(4.95),
                            decoration: ShapeDecoration(
                              color: Colors.white.withValues(alpha: 0.10),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(3.09),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 6.19,
                              children: [
                                SizedBox(
                                  width: 67.46,
                                  child: Text(
                                    'Listening Hour',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.50,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 67.46,
                                  child: Text(
                                    '15 hour',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7.43,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 77.36,
                            padding: const EdgeInsets.all(4.95),
                            decoration: ShapeDecoration(
                              color: Colors.white.withValues(alpha: 0.10),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(3.09),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 6.19,
                              children: [
                                SizedBox(
                                  width: 67.46,
                                  child: Text(
                                    'Listening Hour',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.50,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 67.46,
                                  child: Text(
                                    '15 hour',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7.43,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: (MediaQuery.of(context).size.width / 2) - (72 / 2),
                top: 0,

                child: Container(
                  width: 72.18,
                  height: 72.18,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/72x72"),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 0.98,
                        color: const Color(0xFFBC0974),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: (MediaQuery.of(context).size.width / 2) - (80 / 2),
                top: 0,
                child: Container(
                  width: 19.51,
                  height: 19.51,
                  padding: const EdgeInsets.all(3.90),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF272727),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.75),
                    ),
                  ),
                  child: Icon(Icons.shield_moon_outlined),
                ),
              ),
            ],
          ),
        ),
        Gap(20),
        Container(
          width: 370,
          height: 478,
          decoration: ShapeDecoration(
            color: const Color(0xFF0F172B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Interact with Kabbik',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.33,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://placehold.co/36x36"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Alex fixxser',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                        ),
                      ),
                      Text(
                        '10:16 pm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(10),
              TextField(
                minLines: 4,
                maxLines: null,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Type your message...",
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,

                  // 🔥 border design same as your container
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFF354152),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFF354152),
                    ),
                  ),
                ),
              ),
              Gap(10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // important for gradient
                  elevation: 2, // you can change this
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.transparent, // must be transparent
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(1.00, 0.50),
                      end: Alignment(0.0, 0.50),
                      colors: [Color(0xFFBC0974), Color(0xFF50226A)],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.43,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Comment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://placehold.co/36x36"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Alex fixxser',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                          ),
                          Gap(5),
                          Text(
                            '10:16 pm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'That\'s a terrifying story! Gave me goosebumps.',
                        style: TextStyle(
                          color: const Color(0xFFD0D5DB),
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),
                      Gap(10),
                      Row(
                        children: [
                          PostFunction(
                            isLiked: false,
                            likeCount: 10,
                            likedIcon: Icons.thumb_up_outlined,

                          ),
                          PostFunction(
                            isLiked: false,
                            likeCount: 2,
                            likedIcon: Icons.thumb_down_alt_outlined,

                          ),
                          Row(
                            children: [
                              Icon(Icons.comment_bank),
                              Text(
                                'Reply',
                                style: TextStyle(
                                  color: const Color(0xFF697282),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.33,
                                ),
                              )

                            ],
                          )
                        ],
                      ),
                      Gap(20),
                      Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://placehold.co/36x36"),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Alex fixxser',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.25,
                                    ),
                                  ),
                                  Gap(5),
                                  Text(
                                    '10:16 pm',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.40,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'That\'s a terrifying story! Gave me goosebumps.',
                                style: TextStyle(
                                  color: const Color(0xFFD0D5DB),
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.40,
                                ),
                              ),
                              Gap(10),
                              Row(
                                children: [
                                  PostFunction(
                                    isLiked: false,
                                    likeCount: 10,
                                    likedIcon: Icons.thumb_up_outlined,

                                  ),
                                  PostFunction(
                                    isLiked: false,
                                    likeCount: 2,
                                    likedIcon: Icons.thumb_down_alt_outlined,

                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.comment_bank),
                                      Text(
                                        'Reply',
                                        style: TextStyle(
                                          color: const Color(0xFF697282),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.33,
                                        ),
                                      )

                                    ],
                                  )
                                ],
                              )

                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardTab() {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Card(
          color: Color(0xFF1C2033),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text('User #$index', style: TextStyle(color: Colors.white)),
            subtitle: Text(
              'Points: ${100 - index * 5}',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0E1A), // Dark background
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0E1A),
        title: const Text('Community', style: TextStyle(color: Colors.white)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.pink,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.feed), text: 'Feed'),
            Tab(icon: Icon(Icons.bar_chart), text: 'Stats'),
            Tab(icon: Icon(Icons.star), text: 'Contribution'),
            Tab(icon: Icon(Icons.leaderboard), text: 'Leaderboard'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFeedTab(),
          _buildStatsTab(),
          _buildContributionTab(),
          _buildLeaderboardTab(),
        ],
      ),
    );
  }
}
