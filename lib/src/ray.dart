library ray_tracing_engine;

import 'package:ray_tracing_engine/src/vec3.dart';
import 'dart:math';

class ray{
  vec3 origin = vec3(0,0,0);
  vec3 direction = vec3(0,0,0);
  ray(vec3 origin, vec3 direction){
    this.origin=origin;
    this.direction=direction;
  }
  vec3 at(double t){
    return origin+(direction.mult(t));
  }
  static double hit_sphere(vec3 ce, double rad,ray r_){
  var oc=r_.origin - ce;
    var a =  r_.direction.length_squared;
    var half_b = vec3.dot(oc,r_.direction);
    var c = oc.length_squared-rad*rad;
    var disc = half_b*half_b-a*c;
    if(disc<0){
      return -1.0;
    }else{
      return (-half_b - sqrt(disc) ) / a;
    }


    }
}
