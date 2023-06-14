import 'package:flutter/material.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/locolizations.dart';
import 'package:gymbud/helper/Extension.dart';
class UserHomePage extends StatefulWidget {

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Helper{
  BuildContext context;
  Size size;
  Function showProgressDialog, updateState;
  Helper(this.context, this.size, this.showProgressDialog, this.updateState);

  Widget paddingTop() {
    return Container(
      height: MediaQuery.of(context).padding.top,
      // color: CustomColor,
    );
  }

  // Widget appBar() {
  //   return Container(
  //     width: size.width,
  //     color: Theme.of(context).primaryColorDark,
  //     child: Padding(
  //       padding: EdgeInsets.only(
  //           bottom: size.width * 0.03,
  //           left: size.width * 0.03,
  //           right: size.width * 0.03),
  //       child: Column(
  //         children: [
  //           //App title, basket,bell and dropdown
  //           Container(
  //             height: 40,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     InkWell(
  //                       splashColor: Colors.transparent,
  //                       highlightColor: Colors.transparent,
  //                       onTap: () {
  //                         // scaffoldKey.currentState.openDrawer();
  //                       },
  //                       child: Container(
  //                         width: 25,
  //                         height: 20,
  //                         // child: Image.asset("assets/images/drawer.png"),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 2,
  //                     ),
  //                     Text(
  //                       AppLocalizations.of(context).trans('gymbud'.tr(context)),
  //                       maxLines: 2,
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 16.0,
  //                         fontFamily: 'bold',
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 // Row(
  //                 //   mainAxisAlignment: MainAxisAlignment.end,
  //                 //   children: [
  //                 //
  //                 //     InkWell(
  //                 //       onTap: () async {
  //                 //
  //                 //       },
  //                 //       child: Stack(
  //                 //         alignment: Alignment.topRight,
  //                 //         children: [
  //                 //           Container(
  //                 //             width: 30,
  //                 //             height: 20,
  //                 //             child: Center(
  //                 //               child: Image.asset(
  //                 //                 "assets/images/hart.png",
  //                 //                 width: size.width * 0.05,
  //                 //                 height: size.width * 0.05,
  //                 //                 color: Theme.of(context).accentColor,
  //                 //               ),
  //                 //             ),
  //                 //           ),
  //                 //           // Utilities.notificationCount > 0
  //                 //           //     ? Container(
  //                 //           //         width: size.width * 0.035,
  //                 //           //         height: size.width * 0.035,
  //                 //           //         decoration: BoxDecoration(
  //                 //           //             borderRadius:
  //                 //           //                 BorderRadius.circular(100),
  //                 //           //             color: Colors.white.withOpacity(0.8)),
  //                 //           //         child: Center(
  //                 //           //           child: Text(
  //                 //           //             Utilities.notificationCount.toString(),
  //                 //           //             maxLines: 1,
  //                 //           //             style: TextStyle(
  //                 //           //               color: Theme.of(context).primaryColor,
  //                 //           //               fontSize: 9.0,
  //                 //           //               fontFamily: 'medium',
  //                 //           //             ),
  //                 //           //           ),
  //                 //           //         ),
  //                 //           //       )
  //                 //           //     : SizedBox(),
  //                 //         ],
  //                 //       ),
  //                 //     ),
  //                 //     SizedBox(
  //                 //       width: size.width * 0.01,
  //                 //     ),
  //                 //     Container(
  //                 //       width: size.width * 0.12,
  //                 //       child: Center(
  //                 //         child: FittedBox(
  //                 //           child: DropdownButton(
  //                 //               dropdownColor:
  //                 //               Theme.of(context).primaryColorDark,
  //                 //               icon: Image.asset(
  //                 //                 "assets/images/dropdown.png",
  //                 //                 width: size.width * 0.02,
  //                 //               ),
  //                 //               underline: SizedBox(),
  //                 //               iconEnabledColor: Colors.white,
  //                 //               iconDisabledColor: Colors.white,
  //                 //               style: TextStyle(
  //                 //                   color: Colors.white,
  //                 //                   fontSize: 12.0,
  //                 //                   fontFamily: "medium"),
  //                 //               value: Utilities.currency,
  //                 //               onChanged: (newValue) async {
  //                 //                 Utilities.currency = newValue.toString().toLowerCase();
  //                 //                 listValue = newValue;
  //                 //                 updateState();
  //                 //                 await preferences.setString('currency', newValue);
  //                 //               },
  //                 //               items: [
  //                 //                 DropdownMenuItem(
  //                 //                   child: Center(
  //                 //                     child: Row(
  //                 //                       children: [
  //                 //                         Container(
  //                 //                           margin: EdgeInsets.symmetric(horizontal: 4),
  //                 //                           width: size.width * 0.05,
  //                 //                           height: size.width * 0.05,
  //                 //                           child: Image.asset(flag[0]),
  //                 //                         ),
  //                 //                         new Text(
  //                 //                           list[0].toUpperCase(),
  //                 //                           style: TextStyle(
  //                 //                               color: Colors.white,
  //                 //                               fontSize: 12.0,
  //                 //                               fontFamily: "medium"),
  //                 //                         ),
  //                 //                       ],
  //                 //                     ),
  //                 //                   ),
  //                 //                   value: list[0],
  //                 //                 ),
  //                 //                 DropdownMenuItem(
  //                 //                   child: Center(
  //                 //                     child: Row(
  //                 //                       children: [
  //                 //                         Container(
  //                 //                           margin: EdgeInsets.symmetric(horizontal: 4),
  //                 //                           width: size.width * 0.05,
  //                 //                           height: size.width * 0.05,
  //                 //                           child: Image.asset(flag[1]),
  //                 //                         ),
  //                 //                         new Text(
  //                 //                           list[1].toUpperCase(),
  //                 //                           style: TextStyle(
  //                 //                               color: Colors.white,
  //                 //                               fontSize: 12.0,
  //                 //                               fontFamily: "medium"),
  //                 //                         ),
  //                 //                       ],
  //                 //                     ),
  //                 //                   ),
  //                 //                   value: list[1],
  //                 //                 ),
  //                 //               ]),
  //                 //         ),
  //                 //       ),
  //                 //     ),
  //                 //   ],
  //                 // ),
  //               ],
  //             ),
  //           ),
  //           //By location and By keyword radio
  //           // Search field
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               // SearchField
  //               Container(
  //                 height: 50,
  //                 width: size.width / 1.25,
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(50)),
  //                 margin: EdgeInsets.only(top: size.width * 0.02),
  //                 child: Row(
  //                   children: [
  //                     // Advance search btn
  //                     InkWell(
  //                       onTap: () async {
  //                         await Navigator.of(context).push(MaterialPageRoute(
  //                             builder: (_) => AdvanceSearch())).then((value) => updateState());
  //
  //                       },
  //                       child: Container(
  //                         height: double.infinity,
  //                         decoration: BoxDecoration(
  //                           color: Color(0xffE2E3E4),
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Utilities.language == "en"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                             bottomLeft: Utilities.language == "en"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                             bottomRight: Utilities.language == "ar"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                             topRight: Utilities.language == "ar"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                           ),
  //                         ),
  //                         padding: EdgeInsets.symmetric(
  //                             horizontal: size.width * 0.02),
  //                         child: Center(
  //                           child: Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     left: size.width * 0.02,
  //                                     right: size.width * 0.02,
  //                                     top: size.width * 0.025),
  //                                 child: Image.asset(
  //                                   "assets/images/filter.png",
  //                                   width: size.width * 0.05,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 AppLocalizations.of(context).trans('filter'),
  //                                 style: TextStyle(
  //                                   color: Theme.of(context).primaryColor,
  //                                   fontSize: 12.0,
  //                                   fontFamily: 'medium',
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     // divider
  //                     Container(
  //                       width: 0.3,
  //                       height: double.infinity,
  //                       color: Colors.grey,
  //                     ),
  //                     //Sort Btn
  //                     InkWell(
  //                       onTap: () async {
  //                         await sortDialogBox().then((value) {
  //                           if (value != null) {
  //                             showProgressDialog(true);
  //                             page = 1;
  //                             apiViewStores();
  //                           }
  //                         });
  //                       },
  //                       child: Container(
  //                         height: double.infinity,
  //                         decoration: BoxDecoration(
  //                           color: Color(0xffE2E3E4),
  //                         ),
  //                         child: Center(
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     left: size.width * 0.02,
  //                                     right: size.width * 0.02,
  //                                     top: size.width * 0.025),
  //                                 child: Image.asset(
  //                                   "assets/images/sort.png",
  //                                   width: size.width * 0.05,
  //                                   height: size.width * 0.04,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 AppLocalizations.of(context).trans('sort'),
  //                                 style: TextStyle(
  //                                   color: Theme.of(context).primaryColor,
  //                                   fontSize: 12.0,
  //                                   fontFamily: 'medium',
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     //Search Field
  //                     Expanded(
  //                       child: Container(
  //                         margin: EdgeInsets.only(top: size.width * 0.01),
  //                         child: searchBy == "location"
  //                             ? InkWell(
  //                           onTap: () {
  //                             showPlacePicker();
  //                           },
  //                           child: Padding(
  //                             padding: EdgeInsets.symmetric(
  //                               horizontal: size.width * 0.025,
  //                             ),
  //                             child: SingleChildScrollView(
  //                               scrollDirection: Axis.horizontal,
  //                               child: Text(
  //                                 address,
  //                                 maxLines: 1,
  //                                 style: TextStyle(
  //                                   fontSize: 13.0,
  //                                   fontFamily: 'medium',
  //                                   color: Color(0xFFA3A3A3),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         )
  //                             : TextField(
  //                           textInputAction: TextInputAction.done,
  //                           controller: textController(searchKeyword),
  //                           onChanged: (value) {
  //                             if (page > 1) {
  //                               page = 1;
  //                             }
  //                             searchKeyword = value.trim();
  //                             updateState();
  //                           },
  //                           onSubmitted: (value) {
  //                             FocusScope.of(context)
  //                                 .requestFocus(FocusNode());
  //                           },
  //                           keyboardType: TextInputType.emailAddress,
  //                           decoration: InputDecoration(
  //                             hintText: AppLocalizations.of(context)
  //                                 .trans('search_store'),
  //                             hintStyle: TextStyle(
  //                               fontSize: 13.0,
  //                               fontFamily: 'medium',
  //                               color: Color(0xFFA3A3A3),
  //                             ),
  //                             border: OutlineInputBorder(
  //                                 borderSide: BorderSide.none),
  //                             contentPadding: EdgeInsets.symmetric(
  //                               horizontal: size.width * 0.025,
  //                             ),
  //                           ),
  //                           style: TextStyle(
  //                             fontSize: 13.0,
  //                             fontFamily: 'medium',
  //                             color: Color(0xFF666666),
  //                           ),
  //                           maxLines: 1,
  //                         ),
  //                       ),
  //                     ),
  //                     //Search Btn
  //                     searchKeyword == "" && searchBy == "keyword" ||
  //                         address ==
  //                             AppLocalizations.of(context)
  //                                 .trans('address') &&
  //                             searchBy == "location"
  //                         ? SizedBox()
  //                         : InkWell(
  //                       onTap: () {
  //                         searchKeyword = "";
  //                         address = AppLocalizations.of(context)
  //                             .trans('address');
  //                         FocusScope.of(context)
  //                             .requestFocus(FocusNode());
  //                         showProgressDialog(true);
  //                         apiViewStores();
  //                         updateState();
  //                       },
  //                       child: Container(
  //                         height: double.infinity,
  //                         child: Center(
  //                             child: Padding(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: size.width * 0.02),
  //                               child: Image.asset(
  //                                 "assets/images/crossWithBg.png",
  //                                 width: size.width * 0.05,
  //                               ),
  //                             )),
  //                       ),
  //                     ),
  //
  //                     InkWell(
  //                       onTap: () async {
  //                         if (page > 1) {
  //                           page = 1;
  //                         }
  //                         showProgressDialog(true);
  //                         await apiViewStores();
  //                       },
  //                       child: Container(
  //                         height: double.infinity,
  //                         decoration: BoxDecoration(
  //                           color: Theme.of(context).accentColor,
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Utilities.language == "ar"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                             bottomLeft: Utilities.language == "ar"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                             bottomRight: Utilities.language == "en"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                             topRight: Utilities.language == "en"
  //                                 ? Radius.circular(50)
  //                                 : Radius.circular(0),
  //                           ),
  //                         ),
  //                         child: Center(
  //                             child: Padding(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: size.width * 0.04),
  //                               child: Image.asset(
  //                                 "assets/images/search.png",
  //                                 width: size.width * 0.035,
  //                               ),
  //                             )),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               // Map icon and Text
  //               InkWell(
  //                 onTap: () {
  //                   if (viewByListOrMap == "list") {
  //                     viewByListOrMap = "map";
  //                     _controller = Completer();
  //                   } else {
  //                     viewByListOrMap = "list";
  //                   }
  //                   updateState();
  //                 },
  //                 child: Container(
  //                   margin: EdgeInsets.only(top: size.width * 0.02),
  //                   height: 45,
  //                   width: size.width * 0.12,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Container(
  //                         width: size.width * 0.06,
  //                         height: size.width * 0.06,
  //                         child: Image.asset(
  //                           viewByListOrMap == "list"
  //                               ? "assets/images/location.png"
  //                               : "assets/images/listing.png",
  //                           color: Theme.of(context).accentColor,
  //                         ),
  //                       ),
  //                       Text(
  //                         AppLocalizations.of(context).trans(
  //                             viewByListOrMap == "list" ? 'map' : 'list'),
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 12.0,
  //                           fontFamily: 'bold',
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget pageView() {
  //   return viewByListOrMap == "list"
  //       ? Stack(
  //     children: [
  //       CarouselSlider.builder(
  //         itemCount: Utilities.sliderList.length,
  //         itemBuilder: (BuildContext context, int itemIndex) => Container(
  //           width: size.width,
  //           child: Container(
  //             //   margin: EdgeInsets.symmetric(
  //             //       horizontal: size.width * 0.038,
  //             //       vertical: size.width * 0.038),
  //             child: Stack(
  //               children: [
  //                 Transform(
  //                   transform: Utilities.language == "ar"
  //                       ? Matrix4.rotationY((-2) * Math.pi / 2)
  //                       : Matrix4.rotationY(0),
  //                   alignment: Alignment.center,
  //                   child: Container(
  //                     width: size.width,
  //                     child: Image.network(
  //                       Utilities.resizeImage(
  //                           Utilities.sliderList[itemIndex].image,
  //                           100,
  //                           320,
  //                           1,
  //                           95),
  //                       errorBuilder: (BuildContext context,
  //                           Object exception, StackTrace stackTrace) {
  //                         return Image.asset(
  //                             'assets/images/storeListView _place_holder.jpg');
  //                       },
  //                       loadingBuilder: (BuildContext context,
  //                           Widget child,
  //                           ImageChunkEvent loadingProgress) {
  //                         if (loadingProgress == null) return child;
  //                         return Center(
  //                           child: CircularProgressIndicator(
  //                             value: loadingProgress.expectedTotalBytes !=
  //                                 null
  //                                 ? loadingProgress
  //                                 .cumulativeBytesLoaded /
  //                                 loadingProgress.expectedTotalBytes
  //                                 : null,
  //                           ),
  //                         );
  //                       },
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         options: CarouselOptions(
  //           viewportFraction: 1.0,
  //           aspectRatio: 847 / 287,
  //           initialPage: 0,
  //           onPageChanged: (index, non) {
  //             itemIndex = index;
  //             updateState();
  //           },
  //           reverse: false,
  //           autoPlay: true,
  //           autoPlayInterval: Duration(seconds: 6),
  //           autoPlayAnimationDuration: Duration(milliseconds: 1000),
  //           autoPlayCurve: Curves.easeInOut,
  //           scrollDirection: Axis.horizontal,
  //         ),
  //       ),
  //       Positioned(
  //         bottom: size.width * 0.035,
  //         child: Container(
  //           width: size.width,
  //           height: 8,
  //           child: Center(
  //             child: ListView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 shrinkWrap: true,
  //                 itemCount: Utilities.sliderList.length,
  //                 physics: ClampingScrollPhysics(),
  //                 itemBuilder: (_, index) {
  //                   return Container(
  //                     margin: EdgeInsets.symmetric(horizontal: 2),
  //                     width: 8,
  //                     height: 8,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(50),
  //                         color: itemIndex == index
  //                             ? Theme.of(context).primaryColor
  //                             : Theme.of(context).accentColor),
  //                   );
  //                 }),
  //           ),
  //         ),
  //       ),
  //     ],
  //   )
  //       : SizedBox();
  // }
}
