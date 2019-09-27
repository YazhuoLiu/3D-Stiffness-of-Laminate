function [A,B,D] = Metal_material_stiffness_matrix(Q , h_ply)
% This is a function used to calculate the stiffness matrix of metal composites,
% which is made up of same thickness with different materials.
% Author: Liu Yazhuo
% Q:        2D stiffness matrix in SI units
% h_ply:    Thickness of each layer in SI units

  [a,Nplies] = size(Q);
  thetadt = zeros(1 , Nplies);
  [A,B,D] = Composite_material_stiffness_matrix(Q , thetadt , h_ply);

end
