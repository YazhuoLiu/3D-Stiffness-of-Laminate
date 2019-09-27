function T = Coordinate_transformation_matrix(angle)

  theta  = angle * pi / 180; % ply i angle in radians, from bottom
  c = cos(theta) ;
  s = sin(theta) ;
  T = [ c^2 , s^2 , 2*c*s;      s^2 , c^2 , -2*c*s;      -c*s , c*s , (c^2 - s^2)];

end