library ray_tracing_engine;

import 'package:ray_tracing_engine/src/constants.dart';
import 'package:ray_tracing_engine/src/hittable.dart';
import 'package:ray_tracing_engine/src/hittable_list.dart';
import 'package:ray_tracing_engine/src/surfaces/sphere.dart';
import 'package:ray_tracing_engine/src/vec3.dart';
import 'package:ray_tracing_engine/src/ray.dart';
import 'dart:io';
import 'package:image/image.dart';

vec3 ray_color(ray r, hittable world){
  var rec = hit_record();
  if(world.hit(r, 0, INFINITY, rec)){
    return (rec.normal + vec3(1,1,1)).mult(0.5);
  }
  var rDir = r.direction;
  var unit_dir=rDir.normalize();

  var t = 0.5*(unit_dir.y+1.0);
  var cA=vec3(1.0-t,1.0-t,1.0-t);
  var cB=vec3(0.5*t,0.7*t,1.0*t);
  return cA+cB;
}

void run(){
  print('Initializing vars...');
  //Image
  var aspect_ratio = 16.0/9.0;
  var img_width=400;
  var img_height = img_width ~/ aspect_ratio;

  //World
  var world = hittable_list();
  world.add(sphere(vec3(0,0,-1),0.5));
  world.add(sphere(vec3(0,-100.5,-1), 100));

  //Camera
  var viewport_height = 2.0;
  var viewport_width = aspect_ratio * viewport_height;
  var focal_length = 1.0;

  var origin = vec3(0.0,0.0,0.0);
  var hor = vec3(viewport_width,0.0,0.0);
  var vert = vec3(0.0,viewport_height,0.0);
  var Zfoc_len = vec3(0,0,focal_length);
  var lower_left_corner = origin - hor.div(2.0) - vert.div(2.0) - Zfoc_len;

  //Render
  print('Initializing image...');
  var img = Image(img_width,img_height);
  fill(img, getColor(0, 255, 0));
  print('Ray tracing...');
  for (var j = img_height-1; j >= 0; --j) {
    for (var i = 0; i < img_width; ++i) {
      var u = i / (img_width-1);
      var v = j / (img_height-1);
      var r = ray(origin, lower_left_corner + hor.mult(u) + vert.mult(v) - origin);
      var pixel_color = ray_color(r,world);
      drawPixel(
        img,
	i,
	img_height-j-1,
	getColor(
	  (255.99*pixel_color.x).toInt(),
	  (255.99*pixel_color.y).toInt(),
	  (255.99*pixel_color.z).toInt()
	)
      );
    }
  }
  print('Writing to file...');
  File('test.png').writeAsBytesSync(encodePng(img));
  print('Done.');
}
