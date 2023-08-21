import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mxpertxz_website/Custom_Widget/custom_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var introImageList = [
    "https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    "https://cdn.pixabay.com/photo/2014/08/11/21/39/wall-416060_640.jpg",
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZnVybml0dXJlfGVufDB8fDB8fHww&w=1000&q=80"
  ];

  List<Map<String,dynamic>> oldWorkListImg = [
    {
      'img' : "https://cdn.pixabay.com/photo/2014/08/11/21/39/wall-416060_640.jpg",
      'isSelect' : false
    },
    {
      'img' : "https://images.unsplash.com/photo-1669653862523-904e92ee90b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NHxBNVlaTDhaNzhjZ3x8ZW58MHx8fHx8&w=1000&q=80",
      'isSelect' : false
    },
    {
      'img' : "https://5.imimg.com/data5/SQ/LG/MY-16526586/study-room-interior-500x500.jpg",
      'isSelect' : false
    },
    {
      'img' : "https://media.istockphoto.com/id/1275104046/photo/modern-bathroom-interior-stock-photo.jpg?s=612x612&w=0&k=20&c=ztvVO5u7ZHiQU9KlQhl6ZZy_D-aXP-6ZhL4rg-q9fcA=",
      'isSelect' : false
    },
    {
      'img' : "https://images.unsplash.com/photo-1539922980492-38f6673af8dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bW9kdWxhciUyMGtpdGNoZW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      'isSelect' : false
    },
    {
      'img' : "https://www.orangetree.in/cdn/shop/articles/gallery-5_mazi_bedside_buy_online-scaled_1100x.jpg?v=1680845960",
      'isSelect' : false
    },
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _mediaQuerry = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            // ------------------owner details container----------------------
            _mediaQuerry.width<=800.0 ? Container(
              height: 40,
              child: Center(child: Text("CALL US | (888) 334-0538")),
            ):Container(
              padding: EdgeInsets.all(_mediaQuerry.width<=850.0 ? 0:18.0),
              color: Colors.grey.shade200,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: _mediaQuerry.width<=900.0 ? 0:150),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("VISIT OUR SHOWROOM"),
                        SizedBox(height: 5,),
                        Text("Mon - Sat: 10am - 6pm & Sun:12pm - 5 pm"),
                      ],
                    ),
                    Text("CALL US | (888) 334-0538")
                  ],
                ),
              ),
            ),

            // ---------------------set custom app bar---------------------
            CustomAppBar(onTab: (){},),

            // --------------- show company Name--------------------------------
            Container(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              color: Colors.black,
              child: Center(
                child: Text("SOUTHERN  CALIFORNIA'S  LARGEST  LUXURY  FURNITURE  &  INTERIOR  DESIGN  SHOWROOM",
                  style: GoogleFonts.getFont('PT Serif',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
              )
            ),

            // show previous work images
            Padding(
              padding: const EdgeInsets.only(top: 10.0,bottom: 10),
              child: CarouselSlider(
                items: introImageList
                    .map(
                      (item) => Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                    .toList(),
                options: CarouselOptions(
                  height: _mediaQuerry.width<=950.0 ? 300:600,
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),

            // ----------------------show all design work Name----------------------
            Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40,top: 15,bottom: 28),
              child: Text("Recent Interior Design Work",
                style: GoogleFonts.getFont('Quicksand',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
            ),

            // ----------------------show all design work Image----------------------
            Wrap(
              direction: _mediaQuerry.width<=800.0 ?Axis.vertical:Axis.horizontal,
              spacing: 20,
              runSpacing: 20,
              children: [
                WrapImages("Heaven View-Conteporary",images: oldWorkListImg[0]['img'],index: 0),
                WrapImages("Newport Beach-Tuscon",images: oldWorkListImg[1]['img'],index: 1),
                WrapImages("Orchard Newport Beach",images: oldWorkListImg[2]['img'],index: 2),
                WrapImages("Crystal Cone Interior Design",images: oldWorkListImg[3]['img'],index: 3),
                WrapImages("Lemon's Height Interior Design",images: oldWorkListImg[4]['img'],index: 4),
                WrapImages("Pellican Hill Interior Design",images: oldWorkListImg[5]['img'],index: 5),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40,top: 40,bottom: 8),
              child: Text("LUXURY FURNITURE FOR UNIQUE INTERIORS",
                style: GoogleFonts.getFont('Quicksand',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
            ),

            // company front image
            SizedBox(
              width: double.infinity,
                child: Image.network("https://mar-rsg8wnx.s3.amazonaws.com/uploads/.thumbnails/mc_hp03.jpg/mc_hp03-666x408.jpg",fit: BoxFit.cover,)
            ),

            SizedBox(height: 50,),
            
            Wrap(
              runSpacing: 40,
              spacing: 50,
              children: [
                Container(
                  height: 60,
                  width: 250,
                  color: Colors.black,
                  child: Center(child: Text("SHOP ON-LINE NOW",style: TextStyle(color: Colors.white,fontSize: 18),),),
                ),
                Container(
                  height: 60,
                  width: 250,
                  child: Center(child: Text("VISIT SHOWROOM",style: TextStyle(color: Colors.black,fontSize: 18),),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0), // Set border color and width
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 50,),

            Text("DESIGN  SERVICES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Text("OPEN NEW HORIZONS OF CREATIVITY & EXPRESSION",
                  style: GoogleFonts.getFont('PT Serif',fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center),
            ),
            SizedBox(height: 30,),

            Text("LEARN HOW",style: TextStyle(fontWeight: FontWeight.w500),),

            SizedBox(height: 80,),


            // ------------------ Owner Intro------------------------------
            Wrap(
              spacing: 20,
              children: [
                SizedBox(
                    height: 480,
                    child: Image.network("https://i0.wp.com/www.marcpridmore.com/wp-content/uploads/2020/10/marc-scaled.jpg?resize=1122%2C1536&ssl=1")
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40,15,15,15),
                  child: SizedBox(
                    width: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("INTERIOR DESIGN & LUXURY FURNITURE SHOWROOM",
                            style: GoogleFonts.getFont('PT Serif',fontWeight: FontWeight.bold,fontSize: 30),),

                        SizedBox(height: 15),


                        const Text("Marc Pridmore is the designer and consultant for Southern California’s most"
                            "discerning clientele. additionally serving international clients with unique "
                            "Interior Design and Luxury Furniture pieces around the globe.",
                          style: TextStyle(fontSize: 20),),

                        SizedBox(height: 15),

                        Text("Marc Pridmore Designs was established in 2012 in Costa Mesa, California, serving homes both"
                            " locally and internationally with custom interior design and high-end furniture. With a showroom "
                            "spanning 50,000 sq ft, we offer some of the most exclusive luxury furniture on the market. Possibly"
                            " the only one of its kind in North America for its breadth of luxury furnishings, our showroom curates"
                            " an experience that is able to do these peerless pieces justice.",
                        style: TextStyle(color: Colors.grey.shade600,fontSize:18),),

                        SizedBox(height: 10),

                        Container(
                          height: 50,
                          width:320,
                          child: Center(child: Text("BOOK A DESIGN CONSULTATION",style: TextStyle(color: Colors.black,fontSize: 18),),),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2.0), // Set border color and width
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 90,),

            //------------------our Contact-------------------------
            Container(
              padding: EdgeInsets.all(50),
              width: double.infinity,
              color: Colors.black87,
              child: Wrap(
                direction: _mediaQuerry.width<=800.0 ?Axis.vertical:Axis.horizontal,
                spacing: 40,
                runSpacing: 40.0,
                children: [

                  SizedBox(height: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Customer Services",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("Contact Us",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 7,),
                      Text("Shippinh Information",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 7,),
                      Text("Return Policy",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 7,),
                      Text("Terms and Conditions",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 7,),
                      Text("Return Policy",style: TextStyle(color: Colors.white,fontSize: 12),),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("About Us",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("Meet Marc",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 7,),
                      Text("howroom",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 7,),
                      Text("Design Services",style: TextStyle(color: Colors.white,fontSize: 12),),

                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("VISIT OUR SHOWROOM",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white),),
                      SizedBox(height: 12,),
                      Text("Marc Pridmore Designs\n3089 Bristol St.\nCosta Mesa, CA 92626",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 10,),
                      Text("Mon-Sat: 10am-6pm\nSun:12pm-5pm",style: TextStyle(color: Colors.white,fontSize: 12),),
                      SizedBox(height: 10,),
                      Text("CALL US:(888) 445-6786",style: TextStyle(color: Colors.white,fontSize: 12),),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Don't miss out on sales, new arrivals and more",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white),),
                      SizedBox(height: 22,),
                      Wrap(
                        children: [
                          Text("Enter Your Email",style: TextStyle(fontSize: 15,color: Colors.white38),),
                          SizedBox(width: 100,),
                          Text("Sign-UP",style: TextStyle(fontSize: 18,color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text("______________________________________________________________",style: TextStyle(color: Colors.white),),
                      SizedBox(height: 20,),
                      Wrap(
                        children: [
                          SizedBox(width: 40,),
                          SizedBox(height: 30,child: Image.asset("asset/iconimages/facebook.png")),
                          SizedBox(width: 60,),
                          SizedBox(height: 30,child: Image.asset("asset/iconimages/inta.png")),
                          SizedBox(width: 60,),
                          SizedBox(height: 30,child: Image.asset("asset/iconimages/twitter.png")),
                          SizedBox(width: 60,),
                          SizedBox(height: 30,child: Image.asset("asset/iconimages/youtube.png")),
                        ]
                      )
                    ],
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget WrapImages(String text,{required String images,required int index}){
    var _mediaQuerry = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_) {
        oldWorkListImg[index]['isSelect'] = true;
        setState(() {

        });
      },
      onExit: (_) {
        oldWorkListImg[index]['isSelect'] = false;
        setState(() {

        });
      },
      child: SizedBox(
        height: _mediaQuerry.width<=800.0 ? 550 : 150,
        width: _mediaQuerry.width<=800.0 ? _mediaQuerry.width *0.95:180,
        child: oldWorkListImg[index]['isSelect'] ? Container(height: double.infinity,width: double.infinity,
            color: Colors.black,
            child: Center(child: Text(text, style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,))):
        Image.network(images,fit: BoxFit.cover,),
      )
    );
  }

}
