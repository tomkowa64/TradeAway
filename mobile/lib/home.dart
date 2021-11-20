import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Shop.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 165.0, start: 53.0),
            child:
                // Adobe XD layer: 'Promotion section' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 144.0, end: 21.0),
                  Pin(size: 22.0, middle: 0.2028),
                  child: Text(
                    'PROMOTION',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: const Color(0xcc303744),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 144.0, end: 21.0),
                  Pin(size: 12.0, start: 17.0),
                  child: Text(
                    'Time limited',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      color: const Color(0xffcf4e6c),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 88.0, end: 21.0),
                  Pin(size: 21.0, end: 13.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 58.0, end: 36.0),
                  Pin(size: 10.0, end: 18.0),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 10,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 10.0, end: 24.0),
                  Pin(size: 10.0, end: 18.0),
                  child:
                      // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
                      SvgPicture.string(
                    _svg_ampg2o,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 144.0, end: 21.0),
                  Pin(size: 41.0, middle: 0.6613),
                  child: Text(
                    'Buy any product and we will\ndouble your TA points gain',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      color: const Color(0xcc303744),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 35.0, middle: 0.2592),
            child:
                // Adobe XD layer: 'Category section' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 89.0, start: 20.0),
                  Pin(size: 12.0, middle: 0.5217),
                  child: Text(
                    'Trending',
                    style: TextStyle(
                      fontFamily: 'Bodoni MT',
                      fontSize: 10,
                      color: const Color(0xffe8e8e8),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 88.0, middle: 0.4983),
                  Pin(size: 12.0, middle: 0.5217),
                  child: Text(
                    'Sale',
                    style: TextStyle(
                      fontFamily: 'Bodoni MT',
                      fontSize: 10,
                      color: const Color(0xff303744),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 89.0, end: 21.0),
                  Pin(size: 12.0, middle: 0.5217),
                  child: Text(
                    'Your picks',
                    style: TextStyle(
                      fontFamily: 'Bodoni MT',
                      fontSize: 10,
                      color: const Color(0xffe8e8e8),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 88.0, middle: 0.4983),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_loc40z,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 583.0, end: 40.0),
            child:
                // Adobe XD layer: 'Product list' (shape)
                Container(
              decoration: BoxDecoration(
                color: const Color(0xfff5f5f5),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 69.0, end: 0.0),
            child:
                // Adobe XD layer: 'Nav bottom' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 41.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff303744),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 56.0, middle: 0.5016),
                  Pin(size: 56.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.5, end: 21.0),
                  Pin(size: 20.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'Icon awesome-user' (shape)
                      SvgPicture.string(
                    _svg_gen8ax,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 20.0, start: 20.0),
                  Pin(size: 20.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'Icon open-magnifyin…' (shape)
                      SvgPicture.string(
                    _svg_ka26zi,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 20.0, middle: 0.8268),
                  Pin(size: 20.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'Icon ionic-ios-paper' (shape)
                      PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        pageBuilder: () => Shop(),
                      ),
                    ],
                    child: SvgPicture.string(
                      _svg_eovgzt,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.5015),
                  Pin(size: 46.0, start: 5.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0xffcf4e6c),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 23.1, middle: 0.5085),
                        Pin(size: 23.1, middle: 0.5085),
                        child:
                            // Adobe XD layer: 'Icon awesome-plus' (shape)
                            SvgPicture.string(
                          _svg_u9xt9w,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.5, middle: 0.7091),
                  Pin(size: 20.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'Icon awesome-shoppi…' (shape)
                      SvgPicture.string(
                    _svg_pkj4ud,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 53.0, start: 0.0),
            child:
                // Adobe XD layer: 'Nav top' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff303744),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 21.9, end: 24.5),
                  Pin(size: 25.0, middle: 0.5),
                  child:
                      // Adobe XD layer: 'Icon awesome-bell' (shape)
                      SvgPicture.string(
                    _svg_qu3eix,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 28.1, middle: 0.8365),
                  Pin(size: 25.0, middle: 0.5),
                  child:
                      // Adobe XD layer: 'Icon awesome-shoppi…' (shape)
                      SvgPicture.string(
                    _svg_g455,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 13.9, end: 54.1),
                  Pin(size: 13.9, middle: 0.7417),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, end: 57.0),
                  Pin(size: 8.0, middle: 0.7111),
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 7,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 29.7, start: 20.0),
                  Pin(size: 25.0, middle: 0.5),
                  child:
                      // Adobe XD layer: 'Icon awesome-bars' (shape)
                      SvgPicture.string(
                    _svg_hlmmn,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 100.0, middle: 0.3127),
                  Pin(size: 24.0, middle: 0.4828),
                  child: Text(
                    'Trade',
                    style: TextStyle(
                      fontFamily: 'Lucida Calligraphy',
                      fontSize: 19,
                      color: const Color(0xffffffff),
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 83.0, middle: 0.6404),
                  Pin(size: 24.0, middle: 0.4828),
                  child: Text(
                    'Away',
                    style: TextStyle(
                      fontFamily: 'Lucida Calligraphy',
                      fontSize: 19,
                      color: const Color(0xffffffff),
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 13.9, end: 21.0),
                  Pin(size: 13.9, middle: 0.7417),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, end: 23.9),
                  Pin(size: 8.0, middle: 0.7111),
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 7,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 21.0),
            Pin(size: 105.0, middle: 0.345),
            child:
                // Adobe XD layer: 'Product Card' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, start: 15.0),
                  Pin(start: 10.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'backpack' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 18.0, start: 10.0),
                  child: Text(
                    'Backpack Adidas',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      color: const Color(0xff303744),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 36.0, end: 13.0),
                  Pin(size: 18.0, start: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xb26fb680),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1d000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, end: 18.0),
                  Pin(size: 10.0, start: 14.0),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 8,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 9.0, middle: 0.2917),
                  child: Text(
                    '200 items left',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 8,
                      color: const Color(0xff9e9e9e),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 34.1, middle: 0.3537),
                  Pin(size: 12.1, end: 7.5),
                  child: Text(
                    '69.99\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      color: const Color(0xff9e9e9e),
                      decoration: TextDecoration.lineThrough,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, middle: 0.5628),
                  Pin(size: 22.3, end: 6.5),
                  child: Text(
                    '29.99\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: const Color(0xffcf4e6c),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.7883),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 13.0),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.785),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 14.0),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 15.0, middle: 0.7737),
                  Pin(size: 13.3, end: 13.5),
                  child:
                      // Adobe XD layer: 'Icon awesome-cart-a…' (shape)
                      SvgPicture.string(
                    _svg_fbfvgp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 9.3, end: 48.3),
                  Pin(size: 7.5, middle: 0.8313),
                  child:
                      // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
                      SvgPicture.string(
                    _svg_calgl,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 15.0),
                  Pin(size: 8.0, middle: 0.8351),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 8,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 26.0, middle: 0.4937),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 6,
                      color: const Color(0xff303744),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, start: 15.0),
                  Pin(start: 10.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'backpack' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 21.0),
            Pin(size: 105.0, middle: 0.5305),
            child:
                // Adobe XD layer: 'Product Card' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, start: 15.0),
                  Pin(start: 10.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'blender' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 18.0, start: 10.0),
                  child: Text(
                    'Blender',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      color: const Color(0xff303744),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 36.0, end: 13.0),
                  Pin(size: 18.0, start: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xb2d6dc1d),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1d000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, end: 18.0),
                  Pin(size: 10.0, start: 14.0),
                  child: Text(
                    'USED',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 8,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 9.0, middle: 0.2917),
                  child: Text(
                    '2 items left',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 8,
                      color: const Color(0xff9e9e9e),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 34.1, middle: 0.3537),
                  Pin(size: 12.1, end: 7.5),
                  child: Text(
                    '29.99\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      color: const Color(0xff9e9e9e),
                      decoration: TextDecoration.lineThrough,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, middle: 0.5628),
                  Pin(size: 22.3, end: 6.5),
                  child: Text(
                    '19.99\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: const Color(0xffcf4e6c),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.7883),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 13.0),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.785),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 14.0),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 15.0, middle: 0.7737),
                  Pin(size: 13.3, end: 13.5),
                  child:
                      // Adobe XD layer: 'Icon awesome-cart-a…' (shape)
                      SvgPicture.string(
                    _svg_fbfvgp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 9.3, end: 48.3),
                  Pin(size: 7.5, middle: 0.8313),
                  child:
                      // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
                      SvgPicture.string(
                    _svg_calgl,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 15.0),
                  Pin(size: 8.0, middle: 0.8351),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 8,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 26.0, middle: 0.4937),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 6,
                      color: const Color(0xff303744),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 21.0),
            Pin(size: 105.0, middle: 0.716),
            child:
                // Adobe XD layer: 'Product Card' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, start: 15.0),
                  Pin(start: 10.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'shoe' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 18.0, start: 10.0),
                  child: Text(
                    'NIKE Shoes',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      color: const Color(0xff303744),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 36.0, end: 13.0),
                  Pin(size: 18.0, start: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xb2f11717),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1d000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, end: 18.0),
                  Pin(size: 9.0, start: 15.0),
                  child: Text(
                    'DMG',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 8,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 9.0, middle: 0.2917),
                  child: Text(
                    '1 items left',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 8,
                      color: const Color(0xff9e9e9e),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 34.1, middle: 0.3537),
                  Pin(size: 12.1, end: 7.5),
                  child: Text(
                    '30.50\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      color: const Color(0xff9e9e9e),
                      decoration: TextDecoration.lineThrough,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, middle: 0.5628),
                  Pin(size: 22.3, end: 6.5),
                  child: Text(
                    '19.69\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: const Color(0xffcf4e6c),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.7883),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 13.0),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.785),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 14.0),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 15.0, middle: 0.7737),
                  Pin(size: 13.3, end: 13.5),
                  child:
                      // Adobe XD layer: 'Icon awesome-cart-a…' (shape)
                      SvgPicture.string(
                    _svg_fbfvgp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 9.3, end: 48.3),
                  Pin(size: 7.5, middle: 0.8313),
                  child:
                      // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
                      SvgPicture.string(
                    _svg_calgl,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 15.0),
                  Pin(size: 8.0, middle: 0.8351),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 8,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 26.0, middle: 0.4937),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 6,
                      color: const Color(0xff303744),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 21.0),
            Pin(size: 105.0, end: 76.0),
            child:
                // Adobe XD layer: 'Product Card' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, start: 15.0),
                  Pin(start: 10.0, end: 10.0),
                  child:
                      // Adobe XD layer: 'dress' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 18.0, start: 10.0),
                  child: Text(
                    'Dress',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      color: const Color(0xff303744),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 36.0, end: 13.0),
                  Pin(size: 18.0, start: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xb26fb680),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1d000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, end: 17.0),
                  Pin(size: 12.0, start: 13.0),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 9.0, middle: 0.2917),
                  child: Text(
                    '10 items left',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 8,
                      color: const Color(0xff9e9e9e),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 34.1, middle: 0.3537),
                  Pin(size: 12.1, end: 7.5),
                  child: Text(
                    '20.00\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      color: const Color(0xff9e9e9e),
                      decoration: TextDecoration.lineThrough,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 85.0, middle: 0.5628),
                  Pin(size: 22.3, end: 6.5),
                  child: Text(
                    '15.50\$',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: const Color(0xffcf4e6c),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.7883),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 13.0),
                  Pin(size: 27.0, end: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffff517a),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, middle: 0.785),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 14.0),
                  Pin(size: 26.0, end: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcf4e6c),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 15.0, middle: 0.7737),
                  Pin(size: 13.3, end: 13.5),
                  child:
                      // Adobe XD layer: 'Icon awesome-cart-a…' (shape)
                      SvgPicture.string(
                    _svg_fbfvgp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 9.3, end: 48.3),
                  Pin(size: 7.5, middle: 0.8313),
                  child:
                      // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
                      SvgPicture.string(
                    _svg_calgl,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 15.0),
                  Pin(size: 8.0, middle: 0.8351),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 8,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 177.0, middle: 0.6757),
                  Pin(size: 26.0, middle: 0.4937),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 6,
                      color: const Color(0xff303744),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ampg2o =
    '<svg viewBox="341.0 190.0 10.0 10.0" ><path transform="translate(340.44, 189.44)" d="M 5.5625 0.5625 C 8.32459831237793 0.5625 10.5625 2.800403356552124 10.5625 5.5625 C 10.5625 8.32459831237793 8.32459831237793 10.5625 5.5625 10.5625 C 2.800403356552124 10.5625 0.5625 8.32459831237793 0.5625 5.5625 C 0.5625 2.800403356552124 2.800403356552124 0.5625 5.5625 0.5625 Z M 3.223790645599365 6.449597358703613 L 5.5625 6.449597358703613 L 5.5625 7.87903356552124 C 5.5625 8.094758987426758 5.824597358703613 8.203630447387695 5.975806713104248 8.050403594970703 L 8.280242919921875 5.733870983123779 C 8.375 5.639113426208496 8.375 5.487903118133545 8.280242919921875 5.393145561218262 L 5.975806713104248 3.074596881866455 C 5.82258129119873 2.921370983123779 5.5625 3.030241727828979 5.5625 3.245967626571655 L 5.5625 4.675403594970703 L 3.223790645599365 4.675403594970703 C 3.090725898742676 4.675403594970703 2.981854915618896 4.784274101257324 2.981854915618896 4.917338848114014 L 2.981854915618896 6.207661628723145 C 2.981854915618896 6.340725898742676 3.090725898742676 6.449597358703613 3.223790645599365 6.449597358703613 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_loc40z =
    '<svg viewBox="143.0 253.0 88.0 1.0" ><path transform="translate(143.0, 253.0)" d="M 0 0 L 88 0" fill="none" stroke="#cf4e6c" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gen8ax =
    '<svg viewBox="336.5 637.0 17.5 20.0" ><path transform="translate(336.5, 637.0)" d="M 8.75 10 C 11.51171875 10 13.75 7.76171875 13.75 5 C 13.75 2.238281011581421 11.51171875 0 8.75 0 C 5.988280773162842 0 3.75 2.23828125 3.75 5 C 3.75 7.76171875 5.988280773162842 10 8.75 10 Z M 12.24999904632568 11.24999904632568 L 11.59765529632568 11.24999904632568 C 10.73046779632568 11.6484375 9.765624046325684 11.87499904632568 8.749999046325684 11.87499904632568 C 7.734375 11.87499904632568 6.773437023162842 11.6484375 5.902343273162842 11.24999904632568 L 5.249999523162842 11.24999904632568 C 2.351562261581421 11.24999904632568 0 13.6015625 0 16.5 L 0 18.125 C 0 19.16015625 0.83984375 20 1.875 20 L 15.625 20 C 16.66015625 20 17.5 19.16015625 17.5 18.125 L 17.5 16.5 C 17.5 13.6015625 15.14843654632568 11.24999904632568 12.24999904632568 11.24999904632568 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ka26zi =
    '<svg viewBox="20.0 637.0 20.0 20.0" ><path transform="translate(20.0, 637.04)" d="M 8.671462059020996 -0.02022442221641541 C 3.889770269393921 -0.02022442221641541 0 3.869546413421631 0 8.651239395141602 C 0 13.4329309463501 3.889770269393921 17.32270240783691 8.671462059020996 17.32270240783691 C 10.13322353363037 17.32270240783691 11.5702075958252 16.97584342956543 12.78421306610107 16.3069019317627 C 12.88145637512207 16.42392539978027 12.98927211761475 16.53174018859863 13.10629463195801 16.62898254394531 L 15.5838565826416 19.10654449462891 C 16.20720481872559 19.80795478820801 17.16787719726563 20.10621643066406 18.07886123657227 19.88117599487305 C 18.98984718322754 19.65613555908203 19.70113182067871 18.94485092163086 19.92617607116699 18.03386497497559 C 20.15121459960938 17.12287902832031 19.85295104980469 16.16220664978027 19.15154266357422 15.53885746002197 L 16.67398262023926 13.06129741668701 C 16.55329513549805 12.94056606292725 16.42045402526855 12.83263206481934 16.27757453918457 12.73921585083008 C 16.9465160369873 11.52520942687988 17.36770057678223 10.11299991607666 17.36770057678223 8.626462936401367 C 17.36770057678223 3.844770669937134 13.47793006896973 -0.04500007629394531 8.69623851776123 -0.04500007629394531 Z M 8.671462059020996 2.45733642578125 C 12.11527252197266 2.45733642578125 14.86536407470703 5.2074294090271 14.86536407470703 8.651239395141602 C 14.86536407470703 10.28642845153809 14.27074909210205 11.79774188995361 13.23017406463623 12.91264247894287 C 13.20539855957031 12.93741989135742 13.18062305450439 12.96219539642334 13.15584754943848 12.98697185516357 C 13.03882503509521 13.08421230316162 12.93100738525391 13.19202995300293 12.83376502990723 13.30905246734619 C 11.74363899230957 14.30007743835449 10.25710201263428 14.86991500854492 8.646687507629395 14.86991500854492 C 5.202878475189209 14.86991500854492 2.452785968780518 12.11982440948486 2.452785968780518 8.676013946533203 C 2.452785968780518 5.232203006744385 5.202878475189209 2.482111215591431 8.646687507629395 2.482111215591431 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u9xt9w =
    '<svg viewBox="11.8 11.8 23.1 23.1" ><path transform="translate(11.76, 9.51)" d="M 21.42146301269531 11.31292724609375 L 14.00634098052979 11.31292724609375 L 14.00634098052979 3.897804975509644 C 14.00634098052979 2.987907648086548 13.26843357086182 2.250000238418579 12.35853672027588 2.250000238418579 L 10.71073150634766 2.250000238418579 C 9.800834655761719 2.250000238418579 9.062926292419434 2.987907648086548 9.062926292419434 3.897804975509644 L 9.062926292419434 11.31292724609375 L 1.647804975509644 11.31292724609375 C 0.7379076480865479 11.31292724609375 0 12.05083465576172 0 12.96073150634766 L 0 14.60853672027588 C 0 15.51843452453613 0.7379076480865479 16.2563419342041 1.647804975509644 16.2563419342041 L 9.062926292419434 16.2563419342041 L 9.062926292419434 23.67146492004395 C 9.062926292419434 24.58135986328125 9.800834655761719 25.31926918029785 10.71073150634766 25.31926918029785 L 12.35853672027588 25.31926918029785 C 13.26843357086182 25.31926918029785 14.00634098052979 24.58135986328125 14.00634098052979 23.67146492004395 L 14.00634098052979 16.2563419342041 L 21.42146301269531 16.2563419342041 C 22.33135986328125 16.2563419342041 23.06926918029785 15.51843452453613 23.06926918029785 14.60853672027588 L 23.06926918029785 12.96073150634766 C 23.06926918029785 12.05083465576172 22.33135986328125 11.31292724609375 21.42146301269531 11.31292724609375 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_eovgzt =
    '<svg viewBox="293.5 637.0 20.0 20.0" ><path transform="translate(290.13, 633.63)" d="M 7.028846263885498 4.913461208343506 L 7.028846263885498 20.39423179626465 C 7.028846263885498 20.76442527770996 6.725962162017822 21.06730842590332 6.355769634246826 21.06730842590332 L 6.355769634246826 21.06730842590332 C 5.985577583312988 21.06730842590332 5.682692527770996 20.76442527770996 5.682692527770996 20.39423179626465 L 5.682692527770996 6.451923370361328 L 4.913461208343506 6.451923370361328 C 4.0625 6.451923370361328 3.375 7.13942289352417 3.375 7.990385055541992 L 3.375 21.83654022216797 C 3.375 22.68750190734863 4.0625 23.375 4.913461208343506 23.375 L 21.88942337036133 23.375 C 22.70673179626465 23.375 23.375 22.71154022216797 23.375 21.88942337036133 L 23.375 4.913461208343506 C 23.375 4.0625 22.68750190734863 3.375 21.83654022216797 3.375 L 8.47115421295166 3.471153736114502 C 7.620192527770996 3.471153736114502 7.028846263885498 4.0625 7.028846263885498 4.913461208343506 Z M 10.20192432403564 6.451923370361328 L 14.24038505554199 6.451923370361328 C 14.6105785369873 6.451923370361328 14.91346263885498 6.754807949066162 14.91346263885498 7.125000476837158 L 14.91346263885498 7.125000476837158 C 14.91346263885498 7.495193004608154 14.6105785369873 7.798077583312988 14.24038505554199 7.798077583312988 L 10.20192432403564 7.798077583312988 C 9.831731796264648 7.798077583312988 9.528847694396973 7.495193004608154 9.528847694396973 7.125000476837158 L 9.528847694396973 7.125000476837158 C 9.528847694396973 6.754807949066162 9.831731796264648 6.451923370361328 10.20192432403564 6.451923370361328 Z M 10.20192432403564 14.14423084259033 L 17.31730842590332 14.14423084259033 C 17.6875 14.14423084259033 17.99038505554199 14.44711589813232 17.99038505554199 14.81730842590332 L 17.99038505554199 14.81730842590332 C 17.99038505554199 15.18750190734863 17.6875 15.49038696289063 17.31730842590332 15.49038696289063 L 10.20192432403564 15.49038696289063 C 9.831731796264648 15.49038696289063 9.528847694396973 15.18750190734863 9.528847694396973 14.81730842590332 L 9.528847694396973 14.81730842590332 C 9.528847694396973 14.44711589813232 9.831731796264648 14.14423084259033 10.20192432403564 14.14423084259033 Z M 19.625 19.33654022216797 L 10.20192432403564 19.33654022216797 C 9.831731796264648 19.33654022216797 9.528847694396973 19.03365325927734 9.528847694396973 18.66346168518066 L 9.528847694396973 18.66346168518066 C 9.528847694396973 18.29326820373535 9.831731796264648 17.99038505554199 10.20192432403564 17.99038505554199 L 19.625 17.99038505554199 C 19.99519348144531 17.99038505554199 20.2980785369873 18.29326820373535 20.2980785369873 18.66346168518066 L 20.2980785369873 18.66346168518066 C 20.2980785369873 19.03365325927734 19.99519348144531 19.33654022216797 19.625 19.33654022216797 Z M 19.625 11.64423084259033 L 10.20192432403564 11.64423084259033 C 9.831731796264648 11.64423084259033 9.528847694396973 11.34134769439697 9.528847694396973 10.97115421295166 L 9.528847694396973 10.97115421295166 C 9.528847694396973 10.60096263885498 9.831731796264648 10.2980785369873 10.20192432403564 10.2980785369873 L 19.625 10.2980785369873 C 19.99519348144531 10.2980785369873 20.2980785369873 10.60096263885498 20.2980785369873 10.97115421295166 L 20.2980785369873 10.97115421295166 C 20.2980785369873 11.34134769439697 19.99519348144531 11.64423084259033 19.625 11.64423084259033 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pkj4ud =
    '<svg viewBox="253.5 637.0 17.5 20.0" ><path transform="translate(253.5, 637.0)" d="M 13.75 6.249999523162842 L 13.75 5 C 13.75 2.242968797683716 11.50699138641357 0 8.75 0 C 5.992969036102295 0 3.75 2.242968797683716 3.75 5 L 3.75 6.249999523162842 L 0 6.249999523162842 L 0 16.875 C 0 18.60089683532715 1.399101495742798 20 3.124999761581421 20 L 14.375 20 C 16.10089683532715 20 17.5 18.60089683532715 17.5 16.875 L 17.5 6.249999523162842 L 13.75 6.249999523162842 Z M 6.249999523162842 5 C 6.249999523162842 3.621484518051147 7.371484279632568 2.5 8.75 2.5 C 10.12851524353027 2.5 11.24999904632568 3.621484518051147 11.24999904632568 5 L 11.24999904632568 6.249999523162842 L 6.249999523162842 6.249999523162842 L 6.249999523162842 5 Z M 12.49999904632568 9.6875 C 11.98222637176514 9.6875 11.56249904632568 9.267772674560547 11.56249904632568 8.75 C 11.56249904632568 8.232226371765137 11.98222637176514 7.8125 12.49999904632568 7.8125 C 13.01777172088623 7.8125 13.4375 8.232226371765137 13.4375 8.75 C 13.4375 9.267772674560547 13.01777172088623 9.6875 12.49999904632568 9.6875 Z M 5 9.6875 C 4.482226371765137 9.6875 4.0625 9.267772674560547 4.0625 8.75 C 4.0625 8.232226371765137 4.482226371765137 7.8125 5 7.8125 C 5.517773628234863 7.8125 5.937499523162842 8.232226371765137 5.937499523162842 8.75 C 5.937499523162842 9.267772674560547 5.517773628234863 9.6875 5 9.6875 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qu3eix =
    '<svg viewBox="328.6 14.0 21.9 25.0" ><path transform="translate(328.63, 14.0)" d="M 10.93748378753662 25 C 12.66209411621094 25 14.06101894378662 23.60107421875 14.06101894378662 21.875 L 7.813950538635254 21.875 C 7.813950538635254 23.60107421875 9.212875366210938 25 10.93748378753662 25 Z M 21.45457458496094 17.68993949890137 C 20.5112133026123 16.67626762390137 18.74608039855957 15.1513671875 18.74608039855957 10.15625 C 18.74608039855957 6.3623046875 16.0859203338623 3.325194597244263 12.49900817871094 2.580077648162842 L 12.49900817871094 1.5625 C 12.49900817871094 0.69970703125 11.79978942871094 -2.024676959422322e-08 10.93748378753662 -2.024676959422322e-08 C 10.07518100738525 -2.024676959422322e-08 9.375961303710938 0.69970703125 9.375961303710938 1.5625 L 9.375961303710938 2.580078125 C 5.789048194885254 3.3251953125 3.128891706466675 6.3623046875 3.128891706466675 10.15625 C 3.128891706466675 15.1513671875 1.363754391670227 16.67626953125 0.4203950464725494 17.68993949890137 C 0.1274262666702271 18.0048828125 -0.00245657516643405 18.38134574890137 -1.514360883447807e-05 18.75 C 0.005355950444936752 19.55078125 0.6337741017341614 20.3125 1.567367672920227 20.3125 L 20.30760192871094 20.3125 C 21.24119758605957 20.3125 21.8701000213623 19.55078125 21.87498664855957 18.75 C 21.87742614746094 18.38134574890137 21.74754524230957 18.00439453125 21.45457458496094 17.68993949890137 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g455 =
    '<svg viewBox="290.2 14.0 28.1 25.0" ><path transform="translate(290.17, 14.0)" d="M 25.787109375 14.7128438949585 L 28.09536170959473 4.556591987609863 C 28.26200866699219 3.823291063308716 27.70463752746582 3.125 26.95263671875 3.125 L 7.773828506469727 3.125 L 7.326269149780273 0.93701171875 C 7.214746475219727 0.3916504383087158 6.734863758087158 0 6.178174495697021 0 L 1.17187511920929 0 C 0.5246581435203552 0 0 0.524658203125 0 1.171875238418579 L 0 1.953125 C 0 2.600341796875 0.5246581435203552 3.125 1.17187511920929 3.125 L 4.584130764007568 3.125 L 8.014208793640137 19.894287109375 C 7.193604469299316 20.3662109375 6.640624523162842 21.25107574462891 6.640624523162842 22.265625 C 6.640624523162842 23.77578163146973 7.864843368530273 25 9.375000953674316 25 C 10.88515472412109 25 12.10937404632568 23.77578163146973 12.10937404632568 22.265625 C 12.10937404632568 21.50029373168945 11.79458045959473 20.80883598327637 11.28789043426514 20.3125 L 21.52456092834473 20.3125 C 21.01791954040527 20.80883598327637 20.703125 21.50029373168945 20.703125 22.265625 C 20.703125 23.77578163146973 21.92734146118164 25 23.43749809265137 25 C 24.94765663146973 25 26.17187309265137 23.77578163146973 26.17187309265137 22.265625 C 26.17187309265137 21.18300819396973 25.54257583618164 20.24746131896973 24.62993049621582 19.80444526672363 L 24.89931488037109 18.61909294128418 C 25.06596374511719 17.88579368591309 24.50859260559082 17.18750190734863 23.75658988952637 17.18750190734863 L 10.65024375915527 17.18750190734863 L 10.33066177368164 15.625 L 24.64438629150391 15.625 C 25.19155120849609 15.625 25.66586875915527 15.24638843536377 25.787109375 14.7128438949585 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hlmmn =
    '<svg viewBox="20.0 14.0 29.7 25.0" ><path transform="translate(20.0, 9.78)" d="M 1.062029123306274 8.810586929321289 L 28.67478561401367 8.810586929321289 C 29.26135444641113 8.810586929321289 29.7368106842041 8.353761672973633 29.7368106842041 7.790177822113037 L 29.7368106842041 5.239158630371094 C 29.7368106842041 4.675573825836182 29.26135444641113 4.218749523162842 28.67478561401367 4.218749523162842 L 1.062029123306274 4.218749523162842 C 0.475457102060318 4.218749523162842 0 4.675573825836182 0 5.239158630371094 L 0 7.790177822113037 C 0 8.353761672973633 0.475457102060318 8.810586929321289 1.062029123306274 8.810586929321289 Z M 1.062029123306274 19.01466941833496 L 28.67478561401367 19.01466941833496 C 29.26135444641113 19.01466941833496 29.7368106842041 18.5578441619873 29.7368106842041 17.99425888061523 L 29.7368106842041 15.44323921203613 C 29.7368106842041 14.87965774536133 29.26135444641113 14.42283248901367 28.67478561401367 14.42283248901367 L 1.062029123306274 14.42283248901367 C 0.475457102060318 14.42283248901367 0 14.87965774536133 0 15.44323921203613 L 0 17.99425888061523 C 0 18.5578441619873 0.475457102060318 19.01466941833496 1.062029123306274 19.01466941833496 Z M 1.062029123306274 29.21875 L 28.67478561401367 29.21875 C 29.26135444641113 29.21875 29.7368106842041 28.76193046569824 29.7368106842041 28.19834518432617 L 29.7368106842041 25.64732360839844 C 29.7368106842041 25.08374214172363 29.26135444641113 24.62691497802734 28.67478561401367 24.62691497802734 L 1.062029123306274 24.62691497802734 C 0.475457102060318 24.62691497802734 0 25.08374214172363 0 25.64732360839844 L 0 28.19834518432617 C 0 28.76193046569824 0.475457102060318 29.21875 1.062029123306274 29.21875 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fbfvgp =
    '<svg viewBox="266.8 344.2 15.0 13.3" ><path transform="translate(266.82, 344.15)" d="M 13.11716938018799 8.316531181335449 L 5.498577117919922 8.316531181335449 L 5.668676853179932 9.148183822631836 L 12.64463424682617 9.148183822631836 C 13.04489231109619 9.148183822631836 13.34155941009521 9.519855499267578 13.25285816192627 9.910161018371582 L 13.10947608947754 10.54107284545898 C 13.59523868560791 10.7768726348877 13.93018817901611 11.27482414245605 13.93018817901611 11.8510570526123 C 13.93018817901611 12.6619701385498 13.26697063446045 13.31798839569092 12.45337963104248 13.30629348754883 C 11.67830371856689 13.29514503479004 11.04086875915527 12.66615295410156 11.01994705200195 11.89126110076904 C 11.00851154327393 11.46797657012939 11.17809104919434 11.08432483673096 11.45664405822754 10.81146335601807 L 6.008069038391113 10.81146335601807 C 6.277758598327637 11.07567119598389 6.445310592651367 11.44370269775391 6.445310592651367 11.8510570526123 C 6.445310592651367 12.67784976959229 5.75586986541748 13.34364128112793 4.92052698135376 13.30483818054199 C 4.178796291351318 13.2704029083252 3.575562000274658 12.67109203338623 3.536578178405762 11.92957019805908 C 3.506482839584351 11.35692501068115 3.807801008224487 10.85218906402588 4.265599727630615 10.58889389038086 L 2.439939737319946 1.66330623626709 L 0.6237397789955139 1.66330623626709 C 0.2792534530162811 1.66330623626709 0 1.384052753448486 0 1.039566397666931 L 0 0.6237398386001587 C 0 0.2792535126209259 0.2792534530162811 0 0.6237397789955139 0 L 3.288382053375244 0 C 3.584684371948242 0 3.840079784393311 0.2084590345621109 3.899464845657349 0.4987319707870483 L 4.137681007385254 1.66330623626709 L 14.34575366973877 1.66330623626709 C 14.74601459503174 1.66330623626709 15.0426778793335 2.034977197647095 14.9539794921875 2.42528223991394 L 13.72539234161377 7.831027507781982 C 13.66086101531982 8.115012168884277 13.40840339660645 8.316531181335449 13.11716938018799 8.316531181335449 Z M 10.47438335418701 4.98991870880127 L 9.356096267700195 4.98991870880127 L 9.356096267700195 3.430569171905518 C 9.356096267700195 3.258339166641235 9.216456413269043 3.118699073791504 9.04422664642334 3.118699073791504 L 8.420487403869629 3.118699073791504 C 8.248255729675293 3.118699073791504 8.108616828918457 3.258339166641235 8.108616828918457 3.430569171905518 L 8.108616828918457 4.98991870880127 L 6.990329265594482 4.98991870880127 C 6.712479114532471 4.98991870880127 6.573333263397217 5.325854301452637 6.769811630249023 5.522306442260742 L 8.511837959289551 7.264333724975586 C 8.633624076843262 7.38611888885498 8.831088066101074 7.38611888885498 8.952899932861328 7.264333724975586 L 10.69492816925049 5.522306442260742 C 10.89137935638428 5.325854301452637 10.75223350524902 4.98991870880127 10.47438335418701 4.98991870880127 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_calgl =
    '<svg viewBox="296.4 347.1 9.3 7.5" ><path transform="translate(296.41, 344.41)" d="M 3.941319227218628 3.149362325668335 L 4.400622844696045 2.768283367156982 C 4.595102310180664 2.606925964355469 4.909580230712891 2.606925964355469 5.101991653442383 2.768283367156982 L 9.123998641967773 6.103578567504883 C 9.318478584289551 6.264936447143555 9.318478584289551 6.525854587554932 9.123998641967773 6.68549633026123 L 5.101990699768066 10.0225076675415 C 4.907510757446289 10.18386459350586 4.593033313751221 10.18386459350586 4.400622367858887 10.0225076675415 L 3.941319227218628 9.641427993774414 C 3.744770288467407 9.478354454040527 3.748908042907715 9.212285995483398 3.949594736099243 9.052645683288574 L 6.442661285400391 7.082023620605469 L 0.4965441823005676 7.082023620605469 C 0.2213759422302246 7.082023620605469 -1.913329228386829e-08 6.898350715637207 -1.913329228386829e-08 6.670046806335449 L -1.913329228386829e-08 6.120744228363037 C -1.913329228386829e-08 5.892440319061279 0.2213759422302246 5.708767890930176 0.4965441823005676 5.708767890930176 L 6.442661285400391 5.708767890930176 L 3.949594736099243 3.73814582824707 C 3.74683952331543 3.57850456237793 3.742701292037964 3.312436103820801 3.941319227218628 3.149362325668335 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
