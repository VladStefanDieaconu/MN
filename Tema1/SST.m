% Dieaconu Vlad-Stefan 311CA

function x = SST(A, b)
  % Functie care rezolva un sistem superior-triunghiular

  % Calculez marimea lui A
  [n n] = size(A);
  x(n) = b(n) / A(n, n);
  
  % Aplic formula prezentata in cadrul laboratorului 2 de MN pentru sisteme
  % superior-triunghiulare
  for i = (n - 1) : -1 : 1
    s = 0;
    for j = (i + 1) : n
      s = s + A(i, j) * x(j);
    endfor
    x(i) = (b(i) - s) / A(i, i);
  endfor
endfunction
