import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/api/apiService.dart';
import 'package:flutter_demo/model/foodCategories.dart';
import 'package:flutter_demo/utils/MyColors.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hover_effect/hover_effect.dart';
import 'package:http/http.dart';
import '../widgets/curve_clipper.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late bool isNotMobAndWeb;
  Future<List<Category>?> foodCategoriesList = Future(() => []);

  List<String> foodImages = [
    'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1560801619-01d71da0f70c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=819&q=80',
  ];

  List<String> foodTitle = [
    'Burger',
    'Italian Dishes',
    'Chinese',
    'Pasta',
  ];

  @override
  void dispose() {} // String getFoodImage(int index) {
  //   if (foodImages.asMap().containsKey(index)) {
  //     return foodImages[index];
  //   } else {
  //     return "https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
  //   }
  // }

  // String getTitle(int index) {
  //   if (foodTitle.asMap().containsKey(index)) {
  //     return foodTitle[index];
  //   } else {
  //     return "Default title";
  //   }
  // }

  var itemWebCategories = Column(
    children: [
      const Text(
        "Our Best Popular Recipes",
        style: TextStyle(fontFamily: 'bondoni', fontSize: 35),
      ),
      const SizedBox(
        height: 5,
      ),
      const SizedBox(
        width: 200,
        child: Divider(thickness: 6, color: Colors.red),
      ),
      const SizedBox(
        height: 20,
      ),
      Wrap(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: SizedBox(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.network(
                            height: 300,
                            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        child: Text(
                          "BreakFast",
                          style: TextStyle(fontFamily: 'bondoni', fontSize: 22),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            child: SizedBox(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.network(
                            height: 300,
                            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: Expanded(
                          child: const Text(
                            "BreakFast",
                            style:
                                TextStyle(fontFamily: 'bondoni', fontSize: 22),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            child: SizedBox(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.network(
                            height: 300,
                            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: const Text(
                          "BreakFast",
                          style: TextStyle(fontFamily: 'bondoni', fontSize: 22),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    ],
  );

  var itemAboutUs = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        "About Us",
        style: TextStyle(fontFamily: 'bondoni', fontSize: 35),
      ),
      const SizedBox(
        height: 5,
      ),
      const SizedBox(
        width: 100,
        child: Divider(thickness: 6, color: Colors.red),
      ),
      const SizedBox(
        height: 20,
      ),
      Image.asset('assets/images/about_us.jpg'),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        width: 700,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: Text(
            "Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable",
            style: TextStyle(fontSize: 18),
          ),
        ),
      )
    ],
  );

  var itemMobileCategories = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 80,
        height: 100,
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/1.png',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            const Text('food',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      SizedBox(
        width: 80,
        height: 100,
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/2.png',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            const Text('Instamart',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      SizedBox(
        width: 80,
        height: 100,
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/3.png',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            const Text('Dineout',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      SizedBox(
        width: 80,
        height: 100,
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/4.png',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            const Text('genie',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _getFoodList();
  }

  void _getFoodList() async {
    foodCategoriesList = ApiService().getFoodCategories();
    log("Home Page ${foodCategoriesList.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600.0;
    const webBreakPoint = 907.0;

    if (screenWidth >= breakpoint) {
      if (screenWidth <= webBreakPoint && screenWidth > breakpoint) {
        isNotMobAndWeb = true;
      } else {
        isNotMobAndWeb = false;
      }
      return Row(
        children: [
          /*SizedBox(
            width: 240,
            // TODO: make this configurable
            child: MyDrawer(),
          ),*/
          // vertical black line as separator
          /*Container(width: 0.5, color: Colors.black),*/
          // use Expanded to take up the remaining horizontal space
          Expanded(
            // TODO: make this configurable
            child: _getWebUI(),
          ),
        ],
      );
    } else {
      return _getMobileUI();
    }
  }

  Widget _getMainScreenUI() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // width: 300,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.search_sharp),
                              iconColor: Color(0xFFac1291),
                              border: InputBorder.none,
                              hintText: "Search",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    color: Color(0xFFac1291),
                    elevation: 7,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 12.0),
                      child: Icon(
                        color: Colors.white,
                        Icons.filter_list_outlined,
                        size: 26,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              SizedBox(
                  height: 150.0,
                  width: double.infinity,
                  child: Carousel(
                    images: const [
                      NetworkImage(
                          'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                      NetworkImage(
                          'https://img.freepik.com/free-psd/food-menu-restaurant-web-banner-template_106176-828.jpg?w=996&t=st=1683636077~exp=1683636677~hmac=fc9b5364ae21eeec53b426552601032d796f9b6e02c48167482eef649ec2a9d4'),
                      NetworkImage(
                          'https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=819&q=80'),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: const Color(0xFFac1291),
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.transparent,
                    borderRadius: true,
                    radius: const Radius.circular(13),
                  )),
              // Container(
              //     width: double.infinity,
              //     height: 180,
              //     margin: const EdgeInsets.all(10),
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(20),
              //       child: const Image(
              //         fit: BoxFit.fill,
              //         image: NetworkImage(
              //             'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'),
              //       ),
              //     )),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FutureBuilder(
                    future: foodCategoriesList,
                    builder:
                        (context, AsyncSnapshot<List<Category>?> snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            // padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4.0,
                                    mainAxisExtent: 230.0),
                            itemCount: snapshot.data?.length,
                            itemBuilder: ((context, index) {
                              return SizedBox(
                                height: 500,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.detailRoute,
                                        arguments: {
                                          'id': snapshot.data![index].idCategory
                                        });
                                  },
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    shadowColor:
                                        const Color.fromARGB(255, 177, 80, 159),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 6),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: const Icon(
                                              Icons.favorite_border,
                                            ),
                                          ),
                                          Flexible(
                                              child: SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 50.0,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    // getFoodImage(index),
                                                    snapshot.data![index]
                                                        .strCategoryThumb),
                                                radius: 100.0,
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              // getTitle(index),
                                              snapshot.data![index].strCategory,
                                              style: const TextStyle(
                                                fontFamily: 'oswald',
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: RatingBar(
                                              initialRating: 3,
                                              itemSize: 14.0,
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(Icons.star,
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                // width: double.infinity,
                                                child: Text(
                                                  '\$49',
                                                  style: TextStyle(
                                                    fontFamily: 'oswald',
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    child: Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xFFac1291),
                                                      ),
                                                      child: const Icon(
                                                        size: 20,
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }));
                      } else if (snapshot.hasError) {
                        return Text("Error occured ${snapshot.error}");
                      }

                      return const Center(
                          child: SpinKitHourGlass(color: Color(0xFFac1291))
                          // CircularProgressIndicator()
                          );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMobileUI() {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'FOOD APP',
        ),
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            color: const Color(0xFFac1291),
            width: 26,
            'assets/images/hamburger.png',
            fit: BoxFit.scaleDown,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 15),
              child: InkWell(
                onTap: () {
                  log("cart clicked");
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                child: const badges.Badge(
                    badgeContent:
                        Text('1', style: TextStyle(color: Colors.white)),
                    badgeAnimation: badges.BadgeAnimation.scale(
                      animationDuration: Duration(seconds: 2),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.easeInExpo,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeStyle: badges.BadgeStyle(
                      padding: EdgeInsets.all(5),
                      badgeColor: Color(0xFFac1291),
                      /*badgeGradient: badges.BadgeGradient.linear(
                      colors: [Colors.blue, Colors.yellow],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),*/
                      elevation: 5,
                    ),
                    child: Icon(Icons.shopping_bag_outlined, size: 26)),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // width: 300,
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SizedBox(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.search_sharp),
                                iconColor: Color(0xFFac1291),
                                border: InputBorder.none,
                                hintText: "Search",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Card(
                      color: Color(0xFFac1291),
                      elevation: 7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 12.0),
                        child: Icon(
                          color: Colors.white,
                          Icons.filter_list_outlined,
                          size: 26,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                /*SizedBox(
                    height: 150.0,
                    width: double.infinity,
                    child: Carousel(
                      images: const [
                        NetworkImage(
                            'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                        NetworkImage(
                            'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
                        NetworkImage(
                            'https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=819&q=80'),
                      ],
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: const Color(0xFFac1291),
                      indicatorBgPadding: 5.0,
                      dotBgColor: Colors.transparent,
                      borderRadius: true,
                      radius: const Radius.circular(13),
                    )),*/
                SizedBox(
                    height: 150.0,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              //borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(foodImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );

                          /*Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Image(image: NetworkImage(foodImages[index])),
                          );*/
                        },
                        options: CarouselOptions(
                          height: double.infinity,
                          autoPlay: true,
                        ))

                    /*Carousel(
                      images: const [
                        NetworkImage(
                            'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                        NetworkImage(
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Ffood%2F&psig=AOvVaw1sxqrQCgaM0zGJjOcRQ1ax&ust=1686638289069000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNDFkdyQvf8CFQAAAAAdAAAAABAE'
                            // 'https://img.freepik.com/free-psd/food-menu-restaurant-web-banner-template_106176-828.jpg?w=996&t=st=1683636077~exp=1683636677~hmac=fc9b5364ae21eeec53b426552601032d796f9b6e02c48167482eef649ec2a9d4'
                            ),
                        NetworkImage(
                            'https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=819&q=80'),
                      ],
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: const Color(0xFFac1291),
                      indicatorBgPadding: 5.0,
                      dotBgColor: Colors.transparent,
                      borderRadius: true,
                      radius: const Radius.circular(13),
                    )*/

                    ),
                const SizedBox(
                  height: 10,
                ),
                itemMobileCategories,
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Food Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FutureBuilder(
                      future: foodCategoriesList,
                      builder:
                          (context, AsyncSnapshot<List<Category>?> snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                              shrinkWrap: true,
                              primary: false,
                              // padding: const EdgeInsets.all(10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 4.0,
                                      mainAxisExtent: 230.0),
                              itemCount: snapshot.data?.length,
                              itemBuilder: ((context, index) {
                                return SizedBox(
                                  height: 500,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MyRoutes.detailRoute,
                                          arguments: {
                                            'id':
                                                snapshot.data![index].idCategory
                                          });
                                    },
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      shadowColor: const Color.fromARGB(
                                          255, 177, 80, 159),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 6),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topRight,
                                              child: const Icon(
                                                Icons.favorite_border,
                                              ),
                                            ),
                                            Flexible(
                                                child: SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 50.0,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      // getFoodImage(index),
                                                      snapshot.data![index]
                                                          .strCategoryThumb),
                                                  radius: 100.0,
                                                ),
                                              ),
                                            )),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                // getTitle(index),
                                                snapshot
                                                    .data![index].strCategory,
                                                style: const TextStyle(
                                                  fontFamily: 'oswald',
                                                  fontSize: 16,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: RatingBar(
                                                initialRating: 3,
                                                itemSize: 14.0,
                                                ratingWidget: RatingWidget(
                                                    full: const Icon(Icons.star,
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  // width: double.infinity,
                                                  child: Text(
                                                    '\$49',
                                                    style: TextStyle(
                                                      fontFamily: 'oswald',
                                                      fontSize: 19,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: InkWell(
                                                      child: Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Color(0xFFac1291),
                                                        ),
                                                        child: const Icon(
                                                          size: 20,
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }));
                        } else if (snapshot.hasError) {
                          return Text("Error occured ${snapshot.error}");
                        }

                        return const Center(
                            child: SpinKitHourGlass(color: Color(0xFFac1291))
                            // CircularProgressIndicator()
                            );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  Widget _getHeaderNotMobAndWebUI() {
    return Container(
      // height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 55,
                width: 400,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.search_sharp),
                          iconColor: Color(0xFF0B2239),
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
                width: 53,
                child: Card(
                  color: Color(0xFF0B2239),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 12.0),
                    child: Icon(
                      color: Colors.white,
                      Icons.filter_alt,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF0B2239)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ))),
                onPressed: () {},
                child: const Text(
                  'SEARCH',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
    );
  }

  Widget _getHeaderWebUI() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search_sharp),
                    iconColor: Color(0xFF0B2239),
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                ),
              ),
            ),
          ),
        ),
        const Card(
          color: Color(0xFF0B2239),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(17)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 12.0),
            child: Icon(
              color: Colors.white,
              Icons.filter_alt,
              size: 26,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          height: 45,
          width: 130,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF0B2239)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    /*side: const BorderSide(
                                                        color: Colors
                                                            .red)*/
                  ))),
              /*TextButton.styleFrom(
                                            minimumSize: const Size(130, 58),
                                            backgroundColor:
                                                const Color(0xFF0B2239))*/

              onPressed: () {},
              child: const Text(
                'SEARCH',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              )),
        ),
      ],
    );
  }

  Widget _getWebUI() {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: MyColors.mainColor,
        title: const Text(
          'FOOD APP',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        /*leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },

          icon: Image.asset(
            color: Colors.white,
            width: 26,
            'assets/images/hamburger.png',
            fit: BoxFit.scaleDown,
          ),
        ),*/
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: InkWell(
              onHover: (value) {},
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Profile",
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 35),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 15),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 35),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 15),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                onHover: (value) {},
                child: badges.Badge(
                    position: badges.BadgePosition.topEnd(end: -4),
                    badgeContent: const Text('1',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500)),
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      animationDuration: Duration(seconds: 2),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.easeInExpo,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      padding: EdgeInsets.all(5),
                      badgeColor: Color(0xFFb50505),

                      /*badgeGradient: badges.BadgeGradient.linear(
                      colors: [Colors.blue, Colors.yellow],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),*/
                      elevation: 8,
                    ),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        /*Text(
                          "Bag",
                          style: TextStyle(fontSize: 14),
                        )*/
                      ],
                    )),
              )),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  //color: const Color(0xFF4653FA),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              const Color(0xFF0514D7).withOpacity(1.0),
                              BlendMode.color),
                          child: Image.network(
                            fit: BoxFit.fill,
                            height: 700,
                            width: double.infinity,
                            "https://images.unsplash.com/photo-1495195134817-aeb325a55b65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80",
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          const Text(
                            "Discover Restaurant And Food",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50,
                              color: Color(0xFF0B2239),
                              fontFamily: 'bondoni',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "When looking at its layout. The point of using lorem ipsum ",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF0B2239)),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 900,
                              child: isNotMobAndWeb
                                  ? _getHeaderNotMobAndWebUI()
                                  : _getHeaderWebUI(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              itemWebCategories,
              const SizedBox(
                height: 150,
              ),
              itemAboutUs,
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 40),
                child: FutureBuilder(
                    future: foodCategoriesList,
                    builder:
                        (context, AsyncSnapshot<List<Category>?> snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            // padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 4.0,
                                    mainAxisExtent: 230.0),
                            itemCount: snapshot.data?.length,
                            itemBuilder: ((context, index) {
                              return SizedBox(
                                height: 500,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.detailRoute,
                                        arguments: {
                                          'id': snapshot.data![index].idCategory
                                        });
                                  },
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    shadowColor: const Color(0xC70514D7),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22.0, vertical: 14),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: const Icon(
                                              size: 30,
                                              Icons.favorite_border,
                                            ),
                                          ),
                                          Flexible(
                                              child: SizedBox(
                                            width: 130,
                                            height: 130,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 50.0,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    // getFoodImage(index),
                                                    snapshot.data![index]
                                                        .strCategoryThumb),
                                                radius: 100.0,
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              // getTitle(index),
                                              snapshot.data![index].strCategory,
                                              style: const TextStyle(
                                                fontFamily: 'oswald',
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: RatingBar(
                                              initialRating: 3,
                                              itemSize: 24.0,
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(Icons.star,
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                // width: double.infinity,
                                                child: Text(
                                                  '\$49',
                                                  style: TextStyle(
                                                    fontFamily: 'oswald',
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    child: Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xC70514D7),
                                                      ),
                                                      child: const Icon(
                                                        size: 20,
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }));
                      } else if (snapshot.hasError) {
                        return Text("Error occured ${snapshot.error}");
                      }

                      return const Center(
                          child: SpinKitHourGlass(color: Color(0xFFac1291))
                          // CircularProgressIndicator()
                          );
                    }),
              ),
              SizedBox(
                height: 400,
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      child: Container(
                    //width: double.infinity,
                    color: MyColors.mainColor,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(
                                height: 35,
                                width: 35,
                                child: Image(
                                    image: AssetImage(
                                  'assets/images/location.png',
                                ))),
                            SizedBox(
                              width: 100,
                            ),
                            SizedBox(
                                height: 45,
                                width: 45,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                      image: AssetImage(
                                    'assets/images/call.png',
                                  )),
                                )),
                            SizedBox(
                              width: 100,
                            ),
                            SizedBox(
                                height: 45,
                                width: 45,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                      image: AssetImage(
                                    'assets/images/mail.png',
                                  )),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Wrap(
                          spacing: 80,
                          alignment: WrapAlignment.spaceAround,
                          children: const [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "About",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Blog",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Testimonial",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        const Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Text(
                            "© 2023 All Rights Reserved By Rohit",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
      // drawer: MyDrawer(),
    );
  }

  Widget listItem(BuildContext context, int index) {
    return SizedBox(
      width: 100,
      height: 120,
      child: Column(
        children: [
          Card(
            elevation: 5,
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/${index + 1}.png',
                    height: 60,
                    width: 60,
                  ),
                ],
              ),
            ),
          ),
          Text(_getText(index),
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return 'food';

      case 1:
        return 'Instamart';

      case 2:
        return 'Dineout';

      case 3:
        return 'Genie';
    }
    return "";
  }
}
