% Dieaconu Vlad-Stefan 311CA

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	
  % Deschid fisierul din care se citeste graful sub forma listei de vecini
  fileID = fopen(nume,'r');
  
  % Citesc N, reprezentand numarul de noduri
  N = fscanf(fileID, '%f', 1);
  
  % Initializez A cu zero-uri. In A voi retine matricea de adiacenta
  A = zeros(N);
  
  % Retin in unuCol un vector coloana cu N linii pline de 1
  unuCol = ones(N,1);
  
  % Citesc din fisier listele de vecini si construiesc matricea de adiacenta,
  % pun 1 pe pozitia A(lin, col) daca "col" este in lista de vecini a lui "lin"
  for i = 1 : N
    lin = fscanf(fileID, '%f', 1);
    count = fscanf(fileID, '%f', 1);
    for j= 1 : count
      col = fscanf(fileID, '%f', 1);
      A(lin, col) = 1;
    endfor
  endfor
  
  % Inchid fisierul pentru ca am terminat citirea
  fclose(fileID);
  
  % Nu ne intereseaza daca o pagina are link-uri catre ea insasi, deci facem 0
  % pe diagonala principala
  for i = 1 : N
    A(i, i) = 0;
  endfor
  
  % Calculez numarul de linkuri detinut de fiecare pagina ca fiind suma
  % elementelor de pe fiecare linie
  for i = 1 : N
    L(i) = 0;
    for j = 1 : N
      L(i) = L(i) + A(i, j);
    endfor
  endfor
  
  % Intrucat K este o matrice diagonala, in loc sa calculez K si apoi sa ii
  % calculez inversa (folosind propietatea matematica), am calculat direct
  % invK ca fiind inversul fiecarui element de pe diagonala.
  K = zeros(N);
  for i = 1 : N
    invK(i, i) = 1 / L(i);
  endfor
  
  % Calculez matricea M folosind formula prezentata in enuntul temei
  M = (invK * A)';
  
  % Initializez R la pasul initial. Calculez R in afara while-ului pentru a
  % putea folosi norm(R - R0) drept conditie de oprire in while
  R0(1 : N, 1) = 1 / N;
  R = d * M * R0 + ((1 - d) / N) * unuCol;
  while norm(R - R0) >= eps
    R0 = R;
    R = d * M * R0 + (( 1 - d ) / N) * unuCol;
  endwhile
  
  % Functia returneaza R, care este R la pasul urmator. Pentru a nu schimba 
  % semnatura functiei, fac atribuirea:
  R = R0; 
endfunction
	