import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthLogin extends StatelessWidget {
  AuthLogin({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 142.0, start: 36.0),
            Pin(size: 57.0, start: 60.0),
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
            Pin(size: 57.0, start: 60.0),
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
            Pin(size: 392.0, end: -220.7),
            Pin(size: 649.0, end: -351.3),
            child: Transform.rotate(
              angle: 0.5061,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xa1cf4e6c),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -157.6, end: 177.6),
            Pin(start: 124.5, end: -143.5),
            child: Transform.rotate(
              angle: -0.5411,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe8e8e8),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, middle: 0.4984),
            Pin(size: 27.0, middle: 0.1984),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 25,
                color: const Color(0xff303744),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 36.0, end: 37.0),
            Pin(size: 43.0, middle: 0.3061),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffe8e8e8)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.6, start: 45.2),
            Pin(size: 22.0, middle: 0.312),
            child:
                // Adobe XD layer: 'Icon material-accou…' (shape)
                SvgPicture.string(
              _svg_mgue5m,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 110.0, middle: 0.3509),
            Pin(size: 17.0, middle: 0.3138),
            child: Text(
              'Enter your Email',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 16,
                color: const Color(0xff9e9e9e),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 36.0, end: 37.0),
            Pin(size: 43.0, middle: 0.4119),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffe8e8e8)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 133.0, middle: 0.3843),
            Pin(size: 17.0, middle: 0.4154),
            child: Text(
              'Enter your Password',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 16,
                color: const Color(0xff9e9e9e),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.3, start: 47.7),
            Pin(size: 22.0, middle: 0.4124),
            child:
                // Adobe XD layer: 'Icon awesome-lock' (shape)
                SvgPicture.string(
              _svg_nyhkip,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.483),
            Pin(size: 50.0, middle: 0.5413),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffcf4e6c),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 61.0, middle: 0.5),
            Pin(size: 31.0, middle: 0.5409),
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
        ],
      ),
    );
  }
}

const String _svg_mgue5m =
    '<svg viewBox="45.2 201.2 22.6 22.0" ><path transform="translate(42.2, 198.22)" d="M 14.27789306640625 3 C 8.052495956420898 3 3 7.927999973297119 3 14 C 3 20.07199859619141 8.052495956420898 25 14.27789306640625 25 C 20.5032901763916 25 25.5557861328125 20.07200050354004 25.5557861328125 14 C 25.5557861328125 7.927999973297119 20.5032901763916 3 14.27789306640625 3 Z M 14.27789306640625 6.300000190734863 C 16.15002250671387 6.300000190734863 17.6612606048584 7.774000644683838 17.6612606048584 9.59999942779541 C 17.6612606048584 11.42599964141846 16.15002250671387 12.89999961853027 14.27789306640625 12.89999961853027 C 12.40576267242432 12.89999961853027 10.89452457427979 11.42599964141846 10.89452457427979 9.59999942779541 C 10.89452457427979 7.774000644683838 12.40576267242432 6.300000190734863 14.27789306640625 6.300000190734863 Z M 14.27789306640625 21.92000007629395 C 11.45841979980469 21.92000007629395 8.966004371643066 20.51199913024902 7.511157512664795 18.37800025939941 C 7.544991016387939 16.18899917602539 12.02231407165527 14.98999881744385 14.27789306640625 14.98999881744385 C 16.52219390869141 14.98999881744385 21.01079559326172 16.18899917602539 21.04462814331055 18.37799835205078 C 19.58978080749512 20.51199722290039 17.09736633300781 21.91999816894531 14.27789306640625 21.91999816894531 Z" fill="#9e9e9e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nyhkip =
    '<svg viewBox="47.7 266.0 18.3 22.0" ><path transform="translate(47.7, 266.0)" d="M 16.36904716491699 9.625 L 15.38690567016602 9.625 L 15.38690567016602 6.53125 C 15.38690567016602 2.930468559265137 12.59598159790039 0 9.166666984558105 0 C 5.737351417541504 0 2.946428537368774 2.930468559265137 2.946428537368774 6.53125 L 2.946428537368774 9.625 L 1.964285612106323 9.625 C 0.8798363208770752 9.625 -3.973643103449831e-08 10.548828125 -3.973643103449831e-08 11.6875 L -3.973643103449831e-08 19.9375 C -3.973643103449831e-08 21.076171875 0.8798363208770752 22 1.964285612106323 22 L 16.36904716491699 22 C 17.4534969329834 22 18.33333396911621 21.076171875 18.33333396911621 19.9375 L 18.33333396911621 11.6875 C 18.33333396911621 10.548828125 17.4534969329834 9.625 16.36904716491699 9.625 Z M 12.1130952835083 9.625 L 6.220237731933594 9.625 L 6.220237731933594 6.53125 C 6.220237731933594 4.825390815734863 7.542038440704346 3.4375 9.166666984558105 3.4375 C 10.79129505157471 3.4375 12.1130952835083 4.825390815734863 12.1130952835083 6.53125 L 12.1130952835083 9.625 Z" fill="#9e9e9e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
