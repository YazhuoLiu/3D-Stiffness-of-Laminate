x = 0.001:0.001:1;
num = length(x);

steel = [210e9 0.30];
aluminum = [70e9 0.33];

Qcell = cell(1,2);
Qcell{1,1} = compute_Q(steel);
Qcell{1,2} = compute_Q(aluminum);


for i = 1 : num
    h_ply = x(i);
    [A,B,D] = Metal_material_stiffness_matrix(Qcell,h_ply);
    
   if B(1,1)>=0 && B(1,2)>=0 && B(2,2)>=0
       fprintf('ok,i is %d, h_ply is %d \n',i,x(i))
   end
   
end
fprintf('end \n')

