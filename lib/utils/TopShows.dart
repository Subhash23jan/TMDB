


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopShows extends StatelessWidget {
  TopShows(this.topShows);
  List topShows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Padding( padding:EdgeInsets.only(bottom: 20,top: 20,left: 20),
            child: Text("Top Shows And Movies",style:GoogleFonts.breeSerif(color: Colors.white,fontSize: 20),)),
        Container(
          height:270,
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topShows.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){},
                child: Container(
                  width: 170,
                  child:Column(
                    children: [
                      Container(
                        height: 200,
                        decoration:BoxDecoration(
                            image:DecorationImage(
                                image:NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${topShows[index]['poster_path']}' ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-cqjL4caCBctC5_k9FHJSpgfrwlaxzVeW-4_6pzqhfQ&s'
                                ),
                              )
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('${topShows[index]['original_name']??'loading..'}',style:GoogleFonts.breeSerif(color: Colors.white,fontSize: 15))
                    ],
                  ),
                ),
              );
            },),
        )
      ],
    );
  }
}
