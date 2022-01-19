library ray_tracing_engine;

import 'package:ray_tracing_engine/src/vec3.dart';

class ray{
  vec3 origin = new vec3(0,0,0);
  vec3 direction = new vec3(0,0,0);
  ray(vec3 origin, vec3 direction){
    this.origin=origin;
    this.direction=direction;
  }
  at(vec3 t){
    return this.origin+(this.direction*t);
  }
}
