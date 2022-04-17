import 'package:flutter/material.dart';
import 'package:flutter_patterns/src/models/mv_list_obj.dart';
import 'package:flutter_patterns/utils/helper.dart';
import 'package:flutter_patterns/utils/url.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MvGridItem extends StatelessWidget {
  final MvResults? mv;

  const MvGridItem(this.mv);

  @override
  Widget build(BuildContext context) {
    double _percent = double.parse(mv!.voteAverage!) / 10;
    var _percentRate = (double.parse(mv!.voteAverage!) * 10).toStringAsFixed(0);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FadeInImage.assetNetwork(
                width: double.infinity,
                placeholder: 'assets/images/mv_placeholder.png',
                image: BASE_IMAGE_URL + '${mv!.posterPath}',
                fit: BoxFit.cover),
          ),
          Row(
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black87),
                child: CircularPercentIndicator(
                  progressColor: Color(Helper.colorIndicator(_percent)),
                  backgroundWidth: 2,
                  lineWidth: 3,
                  radius: 20,
                  animation: true,
                  backgroundColor: Colors.grey,
                  percent: _percent,
                  center: Container(
                    child: Text(
                      '${_percentRate} %',
                      style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Flexible(
                child: Text(
                  mv!.originalTitle ?? "",
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
