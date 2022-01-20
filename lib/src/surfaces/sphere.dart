library ray_tracing_engine;

import 'package:ray_tracing_engine/src/hittable.dart';
import 'package:ray_tracing_engine/src/ray.dart';
import 'package:ray_tracing_engine/src/vec3.dart';
import 'dart:math';

class sphere extends hittable{
  vec3 center= vec3(0.0,0.0,0.0);
  double radius=0.0;
  sphere(vec3 c, double rad){
    center=c;
    radius=rad;
  }
  @override
  bool hit(ray r, double t_min,double t_max, hit_record rec){
    var oc=r.origin - center;
    var a =  r.direction.length_squared;
    var half_b = vec3.dot(oc,r.direction);
    var c = oc.length_squared-radius*radius;
    var disc = half_b*half_b-a*c;
    if(disc<0){
      return false;
    }
    var sqrtd = sqrt(disc);

    var root = (-half_b-sqrtd)/a;
    if (root < t_min || t_max < root) {
      root = (-half_b+sqrtd)/a;
      if (root < t_min || t_max < root) {return false;}
    }
    rec.t=root;
    rec.p=r.at(rec.t);
    rec.normal=(rec.p-center).div(radius);
    var outward_normal = (rec.p - center).div(radius);
    rec.set_face_normal(r, outward_normal);

    return true;
  }
}
