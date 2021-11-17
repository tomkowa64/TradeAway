import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Auth extends StatelessWidget {
  Auth({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 142.0, start: 36.0),
            Pin(size: 57.0, middle: 0.3475),
            child: Text(
              'Trade',
              style: TextStyle(
                fontFamily: 'Lucida Calligraphy',
                fontSize: 45,
                color: const Color(0xff303744),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 148.0, end: 41.0),
            Pin(size: 57.0, middle: 0.3475),
            child: Text(
              'Away',
              style: TextStyle(
                fontFamily: 'Lucida Calligraphy',
                fontSize: 45,
                color: const Color(0xffcf4e6c),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.483),
            Pin(size: 15.0, middle: 0.4126),
            child: Text(
              'The easiest way to sell unused things away ',
              style: TextStyle(
                fontFamily: 'Calibri',
                fontSize: 13,
                color: const Color(0xff9e9e9e),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.483),
            Pin(size: 50.0, middle: 0.5186),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffcf4e6c),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.483),
            Pin(size: 50.0, middle: 0.658),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff9e9e9e),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 61.0, middle: 0.5),
            Pin(size: 31.0, middle: 0.5189),
            child: Text(
              'Log In',
              style: TextStyle(
                fontFamily: 'Calibri',
                fontSize: 25,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 155.0, middle: 0.5),
            Pin(size: 31.0, middle: 0.6541),
            child: Text(
              'Create Account',
              style: TextStyle(
                fontFamily: 'Calibri',
                fontSize: 25,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 59.4, middle: 0.5),
            Pin(size: 59.4, end: 44.6),
            child:
                // Adobe XD layer: 'Icon metro-question' (shape)
                SvgPicture.string(
              _svg_e7b2h1,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_e7b2h1 =
    '<svg viewBox="157.8 563.0 59.4 59.4" ><path transform="translate(155.25, 561.07)" d="M 28.5389289855957 42.73524475097656 L 35.95842361450195 42.73524475097656 L 35.95842361450195 50.15473937988281 L 28.5389289855957 50.15473937988281 L 28.5389289855957 42.73524475097656 Z M 43.37791442871094 16.76702117919922 C 45.42673873901367 16.76702117919922 47.08766174316406 18.42794227600098 47.08766174316406 20.47676849365234 L 47.08766174316406 31.60600852966309 L 35.95842361450195 39.0255012512207 L 28.5389289855957 39.0255012512207 L 28.5389289855957 35.31575393676758 L 39.66816711425781 27.89626312255859 L 39.66816711425781 24.18651580810547 L 21.11943435668945 24.18651580810547 L 21.11943435668945 16.76701927185059 L 43.37791442871094 16.76701927185059 Z M 32.24867248535156 7.492654323577881 C 25.8077392578125 7.492654323577881 19.75238990783691 10.0009069442749 15.19798183441162 14.55531692504883 C 10.6435718536377 19.10972595214844 8.135321617126465 25.16507339477539 8.135321617126465 31.60600471496582 C 8.135321617126465 38.04693222045898 10.64357376098633 44.1022834777832 15.19798374176025 48.65669631958008 C 19.75239181518555 53.21110534667969 25.80774116516113 55.71935653686523 32.24867248535156 55.71935653686523 C 38.68960571289063 55.71935653686523 44.74495697021484 53.21110534667969 49.29936218261719 48.65669631958008 C 53.8537712097168 44.1022834777832 56.36203002929688 38.04693603515625 56.36203002929688 31.60600471496582 C 56.36203002929688 25.16507148742676 53.85377502441406 19.1097240447998 49.29942321777344 14.5553150177002 C 44.74507141113281 10.00090503692627 38.68960571289063 7.492652416229248 32.24867248535156 7.492652416229248 Z M 32.24867248535156 1.92803418636322 C 48.63937377929688 1.92803418636322 61.9266471862793 15.21530342102051 61.9266471862793 31.60600852966309 C 61.9266471862793 47.99671173095703 48.63937377929688 61.28397750854492 32.24867248535156 61.28397750854492 C 15.85797214508057 61.28397750854492 2.570700407028198 47.99670791625977 2.570700407028198 31.60600852966309 C 2.570700407028198 15.21530723571777 15.8579683303833 1.928035140037537 32.24867248535156 1.928035140037537 Z" fill="#303744" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
