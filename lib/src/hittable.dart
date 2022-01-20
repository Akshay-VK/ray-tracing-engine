library ray_tracing_engine;

import 'package:ray_tracing_engine/src/ray.dart';
import 'package:ray_tracing_engine/src/vec3.dart';

class hit_record{
  var p=vec3(0.0, 0.0, 0.0);
  var normal = vec3(0.0, 0.0, 0.0);
  var t = 0.0;
  var front_face=false;

  void set_face_normal(ray r, vec3 outward_normal) {
    front_face = vec3.dot(r.direction, outward_normal) < 0;
    normal = front_face ? outward_normal : outward_normal.mult(-1.0);
  }
}
class hittable{
  bool hit(ray r, double t_min,double t_max, hit_record rec){return false;}
}