function cerinta5()
  image = "./in/images/image2.gif";
  A = double(imread(image));
  [m n] = size(A);
  k = [1 : 19 20 : 20 : 99 100 : 30 : min(m, n)];
  
  #primul grafic
  subplot(2, 2, 1);
  [A_k S] = cerinta3 (image, k);
  plot(diag(S));
  
  #al doilea grafic
  subplot(2, 2, 2);
  for j = 1 : length(k)
    sum1 = 0;
    sum2 = 0;
    for i = 1 : k(j)
      sum1 = sum1 + S(i, i);
    endfor
    for i = 1 : min(m, n)
      sum2 = sum2 + S(i, i);
    endfor
    info(j) = sum1 / sum2;
  endfor
  plot(k, info);
  
  #al treilea grafic
  subplot(2, 2, 3);
  for i = 1 : length(k)
    [A_k S] = cerinta3 (image, k(i));
    dif = A - A_k;
    dif = dif .^ 2 ;
    error(i) = 0;
    for it1 = 1 : m
      for it2 = 1 : n
        error(i) = error(i) + dif(it1, it2) / (m * n);
      endfor
    endfor
  endfor
  plot(k, error);
  
  #al patrulea grafic
  subplot(2, 2, 4);
  for i = 1 : length(k)
    compression(i) = (2 * k(i) + 1 ) / n;
  endfor
  plot(k, compression);
endfunction
