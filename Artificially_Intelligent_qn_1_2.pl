/* Facts */
company(sumsum).
company(appy).

competitor(sumsum, appy).
develop(sumsum, galactica-s3).
smartphonetechnology(galactica-s3).

steal(stevey, galactica-s3).
boss(stevey, appy).

/* Rules */
competitor(X, Y):-
	competitor(Y, X).

rival(X, Y):-
	competitor(X, Y).

business(X):-
	smartphonetechnology(X).

unethical(A):-
	boss(A, B), steal(A, D), business(D), develop(C, D), rival(B, C), company(C).

/* Explanantion:

This is the key rule. A is unethical if all of the follwing rules hold

1. A is the boss of company B
2. A steals business D
3. D was developed by company C
4. C is a rival of company B

*/