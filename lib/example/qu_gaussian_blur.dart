import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterqukit/constants/qu_colors.dart';
import '../src/qu_gaussian_blur.dart';
import '../util/qu_screen.dart';
import '../src/qu_scaffold.dart';
import '../src/qu_button.dart';

class QuGaussianBlur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
      title: 'QuGaussianBlur',
      bottomColor: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'lib/images/wuming_vertical2.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 220 * X,
            left: 37.5 * X,
            child: QuBlurRect(
              width: 300 * X,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Catchphrase',
                    style: TextStyle(
                      fontSize: 16 * X,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'He who seize the right moment, is the right man. '
                      'Victory won‘t come to me unless I go to it.'
                      'A strong man will struggle with the storms of fate.'
                      'The shortest way to do many things is to only one thing at a time.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 150),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                QuBlurOval(
                  widget: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return BlurImagePage();
                      }));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: QuBlurOval(
                    widget: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                QuBlurOval(
                  widget: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 30,
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

class BlurImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(
     title: '',
      body: Column(
        children: <Widget>[
        QuCoverBlur(
          sigma: 8,
          image: AssetImage(
            'lib/images/wuming_cross1.png',
          ),
          imgH: 180 * X,
          imgW: 365 * X,
          topWidget: Center(
              child: QuButton(
            primaryColor: QuColors.theme,
            width: 100 * X,
            height: 30 * X,
            text: '充值查看',
            textSize: 14 * X,
            onTap: () {
              print('查看原图');
            },
          )),
        ),
        SizedBox(
          width: 375 * X,
          height: 50 * X,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            QuCoverBlur(
              sigma: 8,
              image: AssetImage(
                'lib/images/wuming_vertical1.jpg',
              ),
              imgH: 365 * X,
              imgW: 180 * X,
              topWidget: Center(
               child: Container(
                width: 100 * X,
                height: 30 * X,
                 child: Text(
                  '不充钱不让看',
                  style: TextStyle(
                    color: QuColors.white,
                  ),
                ),
              )),
            ),
            QuCoverBlur(
              sigma: 8,
              image: AssetImage(
                'lib/images/wuming_vertical4.jpg',
              ),
              imgH: 365 * X,
              imgW: 180 * X,
              topWidget: _profile(X),
            ),
          ],
        ),
      ]),
    );
  }
 //人物简介
  Widget _profile(X) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipOval(
          child: Container(
            height: 50 * X,
            width: 50 * X,
            child: Image.asset('lib/images/wuming_head1.jpg',fit: BoxFit.cover,),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            '无名，甲铁城的卡巴内瑞的女主，头发颜色是黑色，长度到肩旁，瞳色为红色。',
            style: TextStyle(color: QuColors.white),
          ),
        ),
      ],
    );
  }
}
