 import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EventCard extends StatefulWidget {
   const EventCard({super.key});

   @override
   State<EventCard> createState() => _EventCardState();
 }

 class _EventCardState extends State<EventCard> {
   @override
   Widget build(BuildContext context) {
     return Container(
       width: 326,
       height: 212,
       padding: EdgeInsets.all(14),
       decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment(0.00, 0.50),
           end: Alignment(1.00, 0.50),
           colors: [const Color(0xFFAC46FF), const Color(0xFF2B7FFF)],
         ),
       ),
       child: Column(
         children: [
         Container(
         width: 64,
         height: 20,
         alignment: Alignment.center,
         padding: const EdgeInsets.symmetric(horizontal: 6.34, vertical: 3.17),
         decoration: ShapeDecoration(
           gradient: LinearGradient(
             begin: Alignment(0.00, 0.50),
             end: Alignment(1.00, 0.50),
             colors: [const Color(0xFFAC46FF), const Color(0xFF2B7FFF)],
           ),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(26580998),
           ),
         ),
         child: Text(
           'Workshop',
           style: TextStyle(
             color: Colors.white,
             fontSize: 10,
             fontFamily: 'Inter',
             fontWeight: FontWeight.w500,
             height: 1.27,
           ),
         ),
         ),
           Gap(10),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Icon(Icons.calendar_today_outlined,color: const Color(0xFF8492AB),size: 15,),
               Gap(10),
               Text(
                 'Dec 28, 2024',
                 style: TextStyle(
                   color: const Color(0xFF8492AB),
                   fontSize: 12,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w400,
                   height: 1.33,
                 ),
               )

             ],
           ),
           Gap(10),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Icon(Icons.watch_later_outlined,color: const Color(0xFF8492AB),size: 15,),
               Gap(10),
               Text(
                 'Dec 28, 2024',
                 style: TextStyle(
                   color: const Color(0xFF8492AB),
                   fontSize: 12,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w400,
                   height: 1.33,
                 ),
               )

             ],
           ),
           Gap(10),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Icon(Icons.location_on_outlined,color: const Color(0xFF8492AB),size: 15,),
               Gap(10),
               Text(
                 'Virtual',
                 style: TextStyle(
                   color: const Color(0xFF8492AB),
                   fontSize: 12,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w400,
                   height: 1.33,
                 ),
               )

             ],
           ),
           Gap(10),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                  Icon(Icons.group_outlined,color: Colors.white.withValues(alpha: 0.80),),
                   Text(
                     '45/50 attending',
                     style: TextStyle(
                       color: Colors.white.withValues(alpha: 0.80),
                       fontSize: 12,
                       fontFamily: 'Inter',
                       fontWeight: FontWeight.w400,
                       height: 1.33,
                     ),
                   ),
                 ],
               ),
               Container(
                 width: 50.70,
                 height: 6.34,
                 padding: const EdgeInsets.only(right: 5.07),
                 decoration: ShapeDecoration(
                   color: const Color(0xFF314158),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(26580998),
                   ),
                 ),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       width: double.infinity,
                       height: 6.34,
                       decoration: ShapeDecoration(
                         gradient: LinearGradient(
                           begin: Alignment(0.00, 0.50),
                           end: Alignment(1.00, 0.50),
                           colors: [const Color(0xFFAC46FF), const Color(0xFF2B7FFF)],
                         ),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(26580998),
                         ),
                       ),
                     ),
                   ],
                 ),
               )
             ],
           ),
           Gap(10),
           Container(
             width: 301,
             height: 31,
             decoration: ShapeDecoration(
               gradient: LinearGradient(
                 begin: Alignment(1.01, 0.51),
                 end: Alignment(-0.00, 0.51),
                 colors: [const Color(0xFFBC0974), const Color(0xFF50226A)],
               ),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(7.92),
               ),
             ),
             child: Text(
               'Join Event',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 12,
                 fontFamily: 'Inter',
                 fontWeight: FontWeight.w500,
                 height: 1.67,
               ),
             ),
           )
         ],
       ),
     );
   }
 }
