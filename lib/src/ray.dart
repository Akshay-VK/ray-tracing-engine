library ray_tracing_engine;

import 'package:ray_tracing_engine/src/vec3.dart';
import 'dart:math';

class ray{
  vec3 origin = new vec3(0,0,0);
  vec3 direction = new vec3(0,0,0);
  ray(vec3 origin, vec3 direction){
    this.origin=origin;
    this.direction=direction;
  }
  at(double t){
    return this.origin+(this.direction.mult(t));
  }
  static double hit_sphere(vec3 ce, double rad,ray r_){
    vec3 oc=r_.origin - ce;
    double a =  r_.direction.length_squared;
    double half_b = vec3.dot(oc,r_.direction);
    double c = oc.length_squared-rad*rad;
    double disc = half_b*half_b-a*c;
    if(disc<0){
      return -1.0;
    }else{
      return (-half_b - sqrt(disc) ) / a;
    }
  }
}
