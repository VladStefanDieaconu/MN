function [A_k S] = cerinta3 (image, k)
  A = double(imread(image));
  [m n] = size(A);
  for i = 1 : m
    u(i) = sum(A(i, 1 : n)) / n;
    A(i, :) = A(i, :) - u(i);
  endfor
  Z = A' / ((n - 1) ^ (1 / 2));
  [U S V] = svd(Z);
  W = V(:, 1 : k);
  Y = W' * A;
  A_k = W * Y;
  for i = 1 : m
    A_k(i, :) = A_k(i, :) + u(i);
  endfor
endfunction
