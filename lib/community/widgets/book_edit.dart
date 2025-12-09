import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookEdit extends StatelessWidget {
  const BookEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 329,
        height: 300,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, 0.00),
            end: Alignment(1.00, 1.00),
            colors: [const Color(0x7F59168B), const Color(0x7F1B388E)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.71),
          ),),
      child: Column(
        children: [
        Container(
        width: 329,
        height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('')),
          ),
          child: Column(
            children: [
              Container(
                width: 71.24,
                height: 19.07,
                padding: const EdgeInsets.only(
                  top: 3.18,
                  left: 6.36,
                  right: 9.54,
                  bottom: 3.18,
                ),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, 0.50),
                    end: Alignment(1.00, 0.50),
                    colors: [const Color(0xFFAC46FF), const Color(0xFFF6329A)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26665232),
                  ),
                ),
                child: Text(
                'Editor\'s Pick',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.54,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w700,
                  height: 1.33,
                ),
                              ),
        ),
              Container(
                width: 53.21,
                height: 19.07,
                decoration: ShapeDecoration(
                  color: Colors.black.withValues(alpha: 0.50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26665232),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined,color: Colors.white,),

                    Text(
                      '25,400',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.54,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        height: 1.33,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
          Container(
            width: 329,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0x339810FA),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 96,
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 6.36, vertical: 3.18),
                      decoration: ShapeDecoration(
                        color: const Color(0x339810FA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26665232),
                        ),
                      ),
                      child: Text(
                        'Historical Fiction',
                        style: TextStyle(
                          color: const Color(0xFFD9B1FF),
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        Text(
                          '11h 9m',
                          style: TextStyle(
                            color: const Color(0xFF90A1B8),
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.27,
                          ),
                        )

                      ],
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.yellow,),
                        Text(
                          '4.6',
                          style: TextStyle(
                            color: const Color(0xFFFDC700),
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        )

                      ],
                    )

                  ],
                ),
                Text(
                  'The Seven Husbands of Evelyn Hugo',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFFF0F4F9),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.43,
                  ),
                ),
                Text(
                  'by Taylor Jenkins Reid',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: const Color(0xFF90A1B8),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.33,
                  ),
                ),
                Text(
                  'Narrated by Alma Cuervo, Julia Whelan',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: const Color(0xFF61738D),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.20,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 96,
                      height: 29,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          Text(
                            'Listen now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.13,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              height: 1.43,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 6.36,
                          height: 6.36,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC27AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26665232),
                            ),
                          ),
                        ),
                        Gap(3),
                        Container(
                          width: 6.36,
                          height: 6.36,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC27AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26665232),
                            ),
                          ),
                        ),
                        Gap(3),
                        Container(
                          width: 6.36,
                          height: 6.36,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC27AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26665232),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )

        ],
      ),

        );
  }
}
