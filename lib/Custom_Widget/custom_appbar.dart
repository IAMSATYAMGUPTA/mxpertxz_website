import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {

  VoidCallback onTab;

  CustomAppBar({
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    var _mediaQuerry = MediaQuery.of(context).size;
    return _mediaQuerry.width<=800? Container(
      color: Colors.black,
      child: Column(
        children: [

          SizedBox(height: 20,),

          // -----------------app bar according to small size---------------------
          SizedBox(
            height: 80,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.dehaze,color: Colors.white,size: 45),
                onPressed: onTab,
              ),
              backgroundColor: Colors.black,
              elevation: 0,
              centerTitle: true,
              title: Column(
                children: [
                  Text("MARC PRIDMORE" ,
                      style: GoogleFonts.getFont('Roboto Slab',color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20
                  )),
                  SizedBox(height: 4,),
                  Text("LUXURY FURNISHINGS" , style: TextStyle(color: Colors.white,fontSize: 9)),
                ],
              ),
              actions: const [
                Icon(Icons.shopping_cart_outlined , color: Colors.white,size: 35,),
                SizedBox(width: 20,)
              ],
            ),
          ),
        ],
      ),
    ):Column(
      children: [
        SizedBox(height: 20,),

        // -----------------app bar according to large size---------------------
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              Text("MARC PRIDMORE" ,
                  style: GoogleFonts.getFont('Roboto Slab',fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black)),
              SizedBox(height: 4,),
              Text("LUXURY FURNISHINGS" ,
                  style: TextStyle(fontSize: 10,color: Colors.black)),
            ],
          ),
          actions: [
            Icon(Icons.location_on_outlined ,size: 25,color: Colors.black87,),
            SizedBox(width: _mediaQuerry.width<=1000.0?20:30,),
            Icon(Icons.shopping_cart_outlined ,size: 25,color: Colors.black87,),
            SizedBox(width: _mediaQuerry.width<=1000.0?20:30,),
            Icon(Icons.person_outline_outlined ,size: 25,color: Colors.black87,),
            SizedBox(width: _mediaQuerry.width<=1000.0?20:30,),
            Icon(Icons.search ,size: 25,color: Colors.black87,),
            SizedBox(width: _mediaQuerry.width<=1000.0?20:30,),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20.0,bottom: 20.0,),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 40.0,
            runSpacing: 20.0,
            children: [
              Text("LIVING ROOM"),
              Text("BEDROOM ROOM"),
              Text("OCCASIONAL"),
              Text("LEATHER"),
              Text("LIGHTING"),
              Text("HOME OFFICE"),
              Text("DINING ROOM"),
              Text("ACCESSORIES"),
              Text("OUTDOOR"),
              Text("MEET MARC"),
              Text("SHOWROOM"),
              Text("DESIGN SERVICES"),
            ],
          ),
        )
      ],
    );
  }
}
