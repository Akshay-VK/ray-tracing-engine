library ray_tracing_engine;
import 'dart:math';
class vec3{
  double x=0.0,y=0.0,z=0.0;
  vec3(double x,double y,double z){
    this.x=x;
    this.y=y;
    this.z=z;
  }
  double get length_squared{
    return x*x+y*y+z*z;
  }
  double get length{
    return sqrt(length_squared);
  }
  vec3 operator +(vec3 b){
    return vec3(x+b.x,y+b.y,z+b.z);
  }
  vec3 add(double a){
    return vec3(x+a,y+a,z+a);
  }
  vec3 operator -(vec3 b){
    return vec3(x-b.x,y-b.y,z-b.z);
  }
  vec3 sub(double a){
    return vec3(x-a,y-a,z-a);
  }
  vec3 operator *(vec3 b){
    return vec3(x*b.x,y*b.y,z*b.z);
  }
  vec3 mult(double a){
    return vec3(x*a,y*a,z*a);
  }
  vec3 operator /(vec3 b){
    return vec3(x/b.x,y/b.y,z/b.z);
  }
  vec3 div(double a){
    return vec3(x/a,y/a,z/a);
  }
  vec3 normalize(){
    var l = length;
    return vec3(x/l,y/l,z/l);
  }
  void normalizeSelf(){
    var l = length;
    x/=l;
    y/=l;
    z/=l;
  }
  static double dot(vec3 a,vec3 b){
    return a.x*b.x+a.y*b.y+a.z*b.z;
  }
}
