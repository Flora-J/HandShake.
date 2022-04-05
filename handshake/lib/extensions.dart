import 'package:flutter/material.dart';

extension NumExtensions on num {
  EdgeInsets get top => EdgeInsets.only(top: this.toDouble());
  EdgeInsets get left => EdgeInsets.only(left: this.toDouble());
  EdgeInsets get right => EdgeInsets.only(right: this.toDouble());
  EdgeInsets get bottom => EdgeInsets.only(bottom: this.toDouble());
  EdgeInsets get all => EdgeInsets.all(this.toDouble());
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this.toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this.toDouble());
}
