x = 0.001:0.001:1;
num = length(x);
thetadt = [90 90];
Qcell = cell(1,length(thetadt));
for i = 1:length(thetadt)
    Qcell{1,i} = [45e9 5e9 0 ; 5e9 13e9 0 ; 0 0 7e9];
end

for i = 1 : num
    h_ply = x(i);
    [A,B,D] = Composite_material_stiffness_matrix(Qcell,thetadt,h_ply);
  
   if B(1,1)>=0 && B(1,2)>=0 && B(2,2)>=0
       fprintf('ok,i is %d, h_ply is %d \n',i,x(i))
   end
   
end
fprintf('end \n')

[A,B,D] = Composite_material_stiffness_matrix(Qcell,thetadt,5e-3)

