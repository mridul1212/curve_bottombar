import 'package:appbar3d/community/widgets/post_function.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PostViewWidgets extends StatelessWidget {
  const PostViewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
              Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Samia Hamid',
                        maxLines:1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',

                      fontWeight: FontWeight.w500,
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
          Container(
            height: 100,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: const Color(0xFF364153),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 79.79,
                  height: 81.43,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/80x81"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(13),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'মমতাদি',
                     style: TextStyle(
                       color: Colors.white /* Backgrounds-Tertiary */,
                       fontSize: 18,
                       fontFamily: 'Inter',
                       fontWeight: FontWeight.w600,
                       height: 1.11,
                     ),
                   ),
                   Text(
                     'মানিক বন্দ্যোপাধ্যায়',
                     style: TextStyle(
                       color: const Color(0xFF8492AB),
                       fontSize: 12,
                       fontFamily: 'Inter',
                       fontWeight: FontWeight.w400,
                       height: 1.67,
                     ),
                   ),
                 ],
               )
              ],
            ),
          ),
          Gap(10),
          Text(
            'Just finished this masterpiece! The way it explores parallel lives and choices is mind-bowing. The narrators voice was perfect too.Highly recommend!',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: const Color(0xFF8492AB),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          Gap(10),
          Divider(
            color: Colors.white.withOpacity(0.2),
            thickness: 1,
            height: 1,
          ),
          Gap(5),
          Row(
            children: [
              PostFunction(isLiked: true,likeCount: 1001,likedIcon: Icons.thumb_up,unlikedIcon: Icons.thumb_up_off_alt,),
              Gap(5),
              PostFunction(isLiked: true,likeCount: 90,likedIcon: Icons.message,),
              Gap(5),
              PostFunction(isLiked: true,likeCount: 10,likedIcon: Icons.share,),
            ],
          )
        ],
      ),
    );
  }
}
