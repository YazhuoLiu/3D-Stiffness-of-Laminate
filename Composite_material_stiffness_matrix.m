function [A,B,D] = Composite_material_stiffness_matrix(Qcell, thetadt, h_ply)
% This is a function used to calculate the stiffness matrix of fiber reinforced composites,
% which is made up of same Lamina in different angles.
% Author: Liu Yazhuo
% Q:        2D stiffness matrix in SI units
% thetadt:  Angle from top in degree
% h_ply:    Thickness of each layer in SI units

%% Laminate definition (plies of equal thickness)
    Nplies = length(thetadt);   %层数
    h = Nplies * h_ply;         %总厚度
    thetadb = fliplr(thetadt);  %自下而上的角度
    
    % The position of the neutral surface of each layer
    % zbar(i) = 0.5*(z(i)-z(i-1))
    zbar = zeros(Nplies);
    for i = 1:Nplies
        zbar(i) = - (h + h_ply)/2 + i*h_ply;  
    end
   
%% computing

    A = zeros(3,3);
    B = zeros(3,3);
    D = zeros(3,3);

    for i = 1:Nplies
        
        Q = Qcell{1,i};
        T = Coordinate_transformation_matrix(thetadb(i));
        Qbar = (T^(-1)) * Q * (T^(-1))' ;
  
        A = A + Qbar * h_ply;
        B = B + Qbar * h_ply * zbar(i); 
        D = D + Qbar * (h_ply * zbar(i)^2  + h_ply^3 / 12);
  
    end
    
end 