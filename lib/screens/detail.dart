import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/api/apiService.dart';
import 'package:flutter_demo/api/api_constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../model/foodDetail.dart';
import '../utils/MyColors.dart';

class Detail extends StatefulWidget {
  String foodID = '52772';

  // String foodID ="";
  Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  //String foodID;
  Future<Fooddetail?> foodDetail = Future(
    () {},
  );

  _DetailState();

  @override
  void initState() {
    super.initState();
    log("init state called");
    //_getFoodDetail();
  }

  Future<Fooddetail?> _getFoodDetail(String foodID) {
    log('API CALLED');
    foodDetail = ApiService().getFoodDetails(foodID);
    return foodDetail;
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as Map;
    String id = arg['id'];
    log('Food Id on detail screen $id');
    // _getFoodDetail("52772");

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(backgroundColor: Colors.transparent),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 0.0, bottom: 25),
              child: FutureBuilder(
                future: _getFoodDetail('52772'),
                builder: (context, AsyncSnapshot<Fooddetail?> snapshot) {
                  if (snapshot.hasData) {
                    log("Snapshoot data : ${snapshot.data?.meals[0].strMeal}");
                    return Column(
                      children: [
                        /*SizedBox(
                          width: double.infinity,
                          child: Stack(
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                            alignment: Alignment.topRight,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    height: 360.0,
                                    width: double.infinity,
                                    child: Carousel(
                                      dotSize: 5.0,
                                      dotSpacing: 15.0,
                                      dotColor: MyColors.mainColor,
                                      indicatorBgPadding: 5.0,
                                      dotBgColor: Colors.transparent,
                                      images: const [
                                        NetworkImage(
                                            'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                                        NetworkImage(
                                            'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
                                        NetworkImage(
                                            'https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=819&q=80'),
                                      ],
                                    )),
                              ),
                              Positioned(
                                  left: 10,
                                  top: 10,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0x90e1e1e1),
                                          shape: BoxShape.circle),
                                      padding: const EdgeInsets.all(3),
                                      width: 40,
                                      height: 40,
                                      child: const Icon(
                                        Icons.arrow_back_ios_sharp,
                                        size: 20,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),*/
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  //SCrolling Image
                                  Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Stack(
                                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                                              alignment: Alignment.topRight,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: SizedBox(
                                                      height: 360.0,
                                                      width: double.infinity,
                                                      child: Carousel(
                                                        dotSize: 5.0,
                                                        dotSpacing: 15.0,
                                                        dotColor:
                                                            MyColors.mainColor,
                                                        indicatorBgPadding: 5.0,
                                                        dotBgColor:
                                                            Colors.transparent,
                                                        images: const [
                                                          NetworkImage(
                                                              'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                                                          NetworkImage(
                                                              'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
                                                          NetworkImage(
                                                              'https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=819&q=80'),
                                                        ],
                                                      )),
                                                ),
                                                Positioned(
                                                    left: 10,
                                                    top: 10,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Color(
                                                                    0x90e1e1e1),
                                                                shape: BoxShape
                                                                    .circle),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3),
                                                        width: 40,
                                                        height: 40,
                                                        child: const Icon(
                                                          Icons
                                                              .arrow_back_ios_sharp,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),

                                  //Other detail text
                                  Expanded(
                                      flex: 1,
                                      child: Padding(

                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  //Japnes (Mea,Casserole)
                                                  child: Text(
                                                    // getTitle(index),
                                                    "${snapshot.data!.meals[0].strArea} (${snapshot.data!.meals[0].strTags})",
                                                    style: const TextStyle(
                                                      // fontFamily: 'oswald',
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                //rating star
                                                Expanded(
                                                  child: RatingBar(
                                                    initialRating: 3,
                                                    itemSize: 16.0,
                                                    ratingWidget: RatingWidget(
                                                        full: const Icon(
                                                            Icons.star,
                                                            color: Colors.orange),
                                                        half: const Icon(
                                                          Icons.star_half,
                                                          color: Colors.orange,
                                                        ),
                                                        empty: const Icon(
                                                          Icons.star_outline,
                                                          color: Colors.orange,
                                                        )),
                                                    onRatingUpdate: (value) {},
                                                  ),
                                                ),
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            //Title
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                // getTitle(index),
                                                snapshot.data!.meals[0].strMeal,
                                                style: const TextStyle(
                                                  // fontFamily: 'oswald',
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),

                                            //Free Delivery
                                            SizedBox(

                                              child: Padding(

                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "Free Delivery",
                                                    style: TextStyle(
                                                      // fontFamily: 'oswald',
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: 2,
                                                      background: Paint()
                                                        ..color = Colors.red
                                                        ..strokeWidth = 17
                                                        ..strokeJoin =
                                                            StrokeJoin.round
                                                        // ..strokeCap = StrokeCap.round
                                                        ..style =
                                                            PaintingStyle.stroke,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),

                                            //description
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                // getTitle(index),
                                                snapshot.data!.meals[0]
                                                    .strInstructions,
                                                style: const TextStyle(
                                                  // fontFamily: 'oswald',
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error occured ${snapshot.error}");
                  }

                  return const Center(
                      child: SpinKitHourGlass(color: MyColors.mainColor)
                      // CircularProgressIndicator()
                      );
                },
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
          width: double.infinity,
          height: 120,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.add, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          fixedSize: const Size(12, 12),
                          shape: const CircleBorder(),
                          // padding: EdgeInsets.all(10),
                        ),
                      ),
                      const Text(
                        "1",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF000000),
                          fontFamily: 'oswald',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.remove, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          fixedSize: const Size(12, 12),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      minimumSize: const Size(160, 45),
                      backgroundColor: MyColors.mainColor),
                  onPressed: () {},
                  child: const Text('Add To Cart')),
              const SizedBox(height: 10)
            ],
          ),

          /* ),*/
        ),
      ),
    );
  }
}
