% Dieaconu Vlad-Stefan 311CA

function B = GramSchmidt(A)
  
  % Calculez marimea lui A. Fiind matrice patratica nr linii = nr coloane
	n = size(A); 
  
  % Initializez matricile Q si R cu 0
  Q = zeros(n);
  R = zeros(n);
  
  % Calculez matricile Q si R folosind GS modificat, intrucat are mai putine
  % erori de round off decat GS clasic
  for k = 1 : n
    R(k, k) = norm(A(:, k));
    Q(:, k) = A(:, k) / R(k, k);
    R(k, k + 1 : n) = Q(:, k)' * A(:, k + 1 : n);
    A(:, k + 1 : n ) = A(:, k + 1 : n) - Q(:, k) * R(k, k+1 : n);
  endfor
  
  % Initializez matricea B cu 0
  B = zeros(n);
  
  % Initializez I cu matricea identitate
  I = eye(n);
  
  % Rezolvarea sistemului superior-triunghiular folosind metoda prezentata in
  % cadrul laboratorului 2 de MN (exercitiul 3), aplicat pentru fiecare coloana
  for i = 1 : n
    x = SST(R, Q' * I(:, i));
    B(:, i) = x;
  endfor
endfunction
