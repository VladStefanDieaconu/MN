% Dieaconu Vlad-Stefan 311CA

function [R1 R2] = PageRank(nume, d, eps)
	% Functie care calculeaza indicii PageRank pentru cele 3 cerinte si scrie 
	% fisierul de iesire nume.out
  
  % Deschid fisierul din care se citeste
  fileID = fopen(nume,'r');
  N = fscanf(fileID, '%f',1);
  
  % Parcurg tot fisierul citind, pentru a ajunge la ultimele 2 elemente
  for i = 1 : N
    aux1 = fscanf(fileID, '%f', 1);
    aux2 = fscanf(fileID, '%f', 1);
    for j = 1 : aux2
      aux3 = fscanf(fileID, '%f', 1);
    endfor
  endfor
  
  % Citesc val1 si val2 (ultimele 2 elemente din fisierul de input)
  val1 = fscanf(fileID, '%f', 1);
  val2 = fscanf(fileID, '%f', 1);
  
  % Inchid fisierul intrucat am terminat citirea
  fclose(fileID);
  
  % Concatenez .out la numele fisierului de input, pentru a construi numele 
  % fisierului de output
  outName = strcat(nume, '.out'); 
  
  % Deschid fisierul de output pentru scriere
  outID = fopen(outName, 'w'); 
  
  % Scriem pe prima linie numarul de pagini web analizate
  fprintf(outID, '%i \n', N);
  
  % Calculez vectorul PR folosind algoritmul Interative si il scriu in fisier
  R1 = Iterative(nume, d, eps);
  fprintf(outID, '%.6f \n', R1);
  fprintf(outID, '\n');
  
  % Calculez vectorul PR folosind algoritmul Algebraic si il afisez in fisier
  R2 = Algebraic(nume, d);
  fprintf(outID, '%.6f \n', R2);
  fprintf(outID, '\n');

  % Sortez descrescator vectorul obtinut prin algoritmul Algebraic si il salvez
  % in PR1. In index se retine vectorul j cerut, cu ordinea inainte de sortare
  [PR1, index] = sort(R2, 'descend');
  
  for i = 1 : N
    % Calculez apartenenta si afisez
    y = Apartenenta(PR1(i), val1, val2);
    fprintf(outID, '%i %i %.6f\n', i, index(i), y);
  endfor
  
  % Inchid fisierul de output.
  fclose(outID);
endfunction
