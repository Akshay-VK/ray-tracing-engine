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
    return this.x*this.x+this.y*this.y+this.z*this.z;
  }
  double get length{
    return sqrt(this.length_squared);
  }
  vec3 operator +(vec3 b){
    return new vec3(this.x+b.x,this.y+b.y,this.z+b.z);
  }
  vec3 add(double a){
    return new vec3(this.x+a,this.y+a,this.z+a);
  }
  vec3 operator -(vec3 b){
    return new vec3(this.x-b.x,this.y-b.y,this.z-b.z);
  }
  vec3 sub(double a){
    return new vec3(this.x-a,this.y-a,this.z-a);
  }
  vec3 operator *(vec3 b){
    return new vec3(this.x*b.x,this.y*b.y,this.z*b.z);
  }
  vec3 mult(double a){
    return new vec3(this.x*a,this.y*a,this.z*a);
  }
  vec3 operator /(vec3 b){
    return new vec3(this.x/b.x,this.y/b.y,this.z/b.z);
  }
  vec3 div(double a){
    return new vec3(this.x/a,this.y/a,this.z/a);
  }
  vec3 normalize(){
    double l = this.length;
    return new vec3(this.x/l,this.y/l,this.z/l);
  }
  void normalizeSelf(){
    double l = this.length;
    this.x/=l;
    this.y/=l;
    this.z/=l;
  }
}
