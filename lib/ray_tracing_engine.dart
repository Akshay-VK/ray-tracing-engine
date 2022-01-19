library ray_tracing_engine;

import 'package:ray_tracing_engine/src/vec3.dart';
import 'package:ray_tracing_engine/src/ray.dart';
import 'dart:io';
import 'package:image/image.dart';

vec3 ray_color(ray r){
  vec3 rDir = r.direction;
  vec3 unit_dir=rDir.normalize();
  double t = 0.5*(unit_dir.y+1.0);
  vec3 cA=new vec3(1.0-t,1.0-t,1.0-t);
  vec3 cB=new vec3(0.5*t,0.7*t,1.0*t);
  return cA+cB;
}

void run(){
  print('Initializing vars...');
  double aspect_ratio = 16.0/9.0;
  int img_width=400;
  int img_height = (img_width / aspect_ratio).toInt();

  double viewport_height = 2.0;
  double viewport_width = aspect_ratio * viewport_height;
  double focal_length = 1.0;

  vec3 origin = new vec3(0.0,0.0,0.0);
  vec3 hor = new vec3(viewport_width,0.0,0.0);
  vec3 vert = new vec3(0.0,viewport_height,0.0);
  vec3 Zfoc_len = new vec3(0,0,focal_length);
  vec3 lower_left_corner = origin - hor.div(2.0) - vert.div(2.0) - Zfoc_len;

  print('Initializing image...');
  Image img = new Image(img_width,img_height);
  fill(img, getColor(0, 255, 0));
  print('Ray tracing...');
  for (int j = img_height-1; j >= 0; --j) {
    for (int i = 0; i < img_width; ++i) {
      double u = i / (img_width-1);
      double v = j / (img_height-1);
      ray r = new ray(origin, lower_left_corner + hor.mult(u) + vert.mult(v) - origin);
      vec3 pixel_color = ray_color(r);
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
