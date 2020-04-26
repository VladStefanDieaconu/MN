Dieaconu Vlad-Stefan 311CA

Tema 1 MN - PageRank

Cerinta 1. Algoritmul Iterative:
Am inceput rezolvarea cerintei prin a citi din fisierul de input element cu
element, folosind for-uri. Am construit matricea de adiacenta A pentru graf-ul 
primit ca lista de vecini, punand 1 pe pozitia A(i,j) daca j se afla in lista de
vecini a lui i. Restul elementelor din matrice sunt 0 (am initializat inainte
matricea cu zero-uri). In continuare am calculat numarul de linkuri detinut de
fiecare pagina, facand suma elementelor de pe fiecare linie. Intrucat K este o
matrice diagonala, inversa ei este inversul fiecarui element de pe diagonala
principala. Pentru a scapa de operatii inutile, am calculat direct invK folosind
propietatea matematica. In final, calculez intr-un while R la pasul curent si la
pasul urmator. Ma opresc atunci a fost satisfacuta conditia
|R(t + 1) − R(t)| < eps.

Cerinta 2. Algoritmul Algebraic:
In rezolvarea acestei cerinte am pornit de la codul folosit pentru algoritmul
Interative (pentru citire si construirea matricei de adiacenta), la care am
adaugat functiile GramSchmidt si SST. 

Functia GramSchmidt foloseste algoritmul GS modificat pentru a genera matricile
Q(ortogonala) si R(superior triunghiulara), astfel incat A = Q * R. In
continuare, apelez functia SST pentru a rezolva sistemul superior triunghiular
format si a calculat inversa matricii B. 
Am folosit algoritmul GramSchmidt Modificat intrucat, folosind GS clasic, pe
sisteme de 32 de biti nu primeam punctajul pe checker. Problema venea de la
modul in care am abordat rezolvarea PageRank-ului, facand sortarea folosind
sort(R2, 'descend'). Functia sort nu poate sorta pentru "descend or equal", deci
in cazul in care 2 valori returnate de GS clasic sunt egale, acestea nu mai erau
interschimbate. Cum GS clasic are erori de round-off mai mari, a aparut problema
in care aveam elemente egale. Problema a fost rezolvata folosind GS modificat,
ce are erori de round-off mult mai mici.
Functia SST rezolva un sistem superior-triunghiular folosind metoda prezentata
in cadrul laboratorului 2 de MN (la exercitiul 3).

Cerinta 3. Gradul de Apartenenta:
Pentru rezolvarea acestei cerinte am folosit conditiile de coliniaritate
invatate in liceu, anume ca valoarea functiei la stanga si la dreapta trebuie sa
fie egale. Astfel a rezultat un sistem de 2 ecuatii cu 2 necunoscute, ce a putut
fi rezolvat foarte rapid printr-un calcul simplu, neffind nevoie de aplicarea
unei metode invatate la MN.

Functia PageRank:
Aceasta functie apeleaza functiile precedente pentru a calcula vectorul PR
folosind algoritmii Iterative si Algebraic. In continuare, sortez vectorul
rezultat din algoritmul Algebraic folosind "sort(R2, 'descend')". Pe langa
vectorul sortat descendent, aceasta functie returneaza si un vector unde retinem
index-ul fiecarui element inainte de sortare (acesta fiind exact vectorul J
cerut in enuntul temei).

Feedback:
Consider ca tema a fost bine venita in intelegerea necesitatii folosirii unor
algoritmi cu erori de round-off cat mai mici. Principalele probleme intampinate
au fost legate de sortarea corecta, inturcat folosind GS clasic rezultatele erau
diferite de cele din ref.
Timp de rezolvare: 7 ore
Dificultate: medie
