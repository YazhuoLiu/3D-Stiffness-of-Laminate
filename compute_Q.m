function Q = compute_Q(metal)
% This function is used to compute stiffness matrix of metal lamina
% Author: Liu Yazhuo
  E = metal(1,1);
  mu = metal(1,2);

  Q11 = E/(1 - mu^2);
  Q12 = mu * E /(1 - mu^2);
  Q66 = E /( 2 * (1 + mu) );

  Q = zeros(3,3);
  Q(1,2) = Q12;
  Q(2,1) = Q12;
  Q(3,3) = Q66;

end
