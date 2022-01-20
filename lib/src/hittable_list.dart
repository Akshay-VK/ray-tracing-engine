library ray_tracing_engine;

import 'package:ray_tracing_engine/src/hittable.dart';
import 'package:ray_tracing_engine/src/ray.dart';

class hittable_list extends hittable{
  List<hittable> objects = [];
  hittable_list(){}
  void add(hittable obj){
    objects.add(obj);
  }
  void clear(){
    objects=[];
  }
  @override
  bool hit(ray r, double t_min,double t_max, hit_record rec){
    late var temp_rec = hit_record();
    var hit_anything = false;
    // ignore: unused_local_variable
    var closest_so_far = t_max;
    for(var obj in objects){
      if(obj.hit(r, t_min, t_max, rec)){
        hit_anything = true;
        closest_so_far = temp_rec.t;
        rec = temp_rec;
      }
    }
    return hit_anything;
  }
}