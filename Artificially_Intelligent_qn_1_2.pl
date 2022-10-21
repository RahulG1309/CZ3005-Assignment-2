/* Facts */
company(sumsum).
company(appy).
competitor_of(sumsum, appy).

developed_by(sumsum, galactica-s3).
smart_phone_technology(galactica-s3).

stolen_by(galactica-s3, stevey).
boss_of(stevey, appy).


/* Rules */
competitor_of(X, Y):-
	competitor_of(Y, X).

rival_of(X, Y):-
	competitor_of(X, Y).

business(X):-
	smart_phone_technology(X).

unethical(A):-
	boss_of(A, B), stolen_by(D, A), business(D), developed_by(C, D), rival_of(B, C), company(C).


/* Explanantion:

This is the key rule. A is unethical if all of the follwing rules hold

1. A is the boss of company B
2. Business D is stolen by A
3. D was developed by company C
4. C is a rival of company B

*/