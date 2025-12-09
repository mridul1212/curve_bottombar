import 'package:appbar3d/community/widgets/post_function.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 448,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172B),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(height: 179, color: Colors.red),
          Gap(10),
          Text(
            'From stories to textbooks—it\'s like a poetic, \nmagical library.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1.43,
            ),
          ),
          Gap(10),
          SizedBox(
            height: 90,
            child: Text(
              'Some habits never truly change with time—they simply take on new forms.Those of us who spent our childhood afternoons engrossed in Tin Goyenda, Masud Rana, or translated foreign adventure novels know well—how stories shape a person.',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF8492AB),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
          ),
          Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
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
                    Gap(5),
                    Column(
                      children: [
                        Text(
                          'Samia Hamid',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                    )
                  ],
                ),
              ),
              Gap(10),
              Text(
                'Read More  ↗',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              )
              
            ],
          ),
          Gap(15),
          Row(
            children: [
              PostFunction(
                 likeCount: 10,
                likedIcon: Icons.thumb_up_off_alt,
                isLiked: false,
              ),
              Gap(10),
              PostFunction(
                likeCount: 0,
                likedIcon: Icons.thumb_down_alt_outlined,
                isLiked: false,
              ),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.comment_bank_rounded,color: const Color(0xFF6A7282),),
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
    );
  }
}
