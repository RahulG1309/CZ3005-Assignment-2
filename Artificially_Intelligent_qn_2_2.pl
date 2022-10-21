/* Facts */
monarch(queen_elizabeth).
female(queen_elizabeth).

male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edwards).

older(prince_charles, princess_ann).
older(princess_ann, prince_andrew).
older(prince_andrew, prince_edwards).

offspring(prince_charles, queen_elizabeth).
offspring(princess_ann, queen_elizabeth).
offspring(prince_andrew, queen_elizabeth).
offspring(prince_edwards, queen_elizabeth).


/* Rules */
older_than(X, Y):- 
	older(X, Y)

/* This recursive rule adds transitivity to the older than relationship */
older_than(X, Y):-
	older(X, A), older_than(A, Y)


/* Now, let us define the NEW succession rules that will be used in our sorting function later */
/* 
	Now there would be only one rule that is gender independent. The older child would come before the younger one. 
	Do ensure none of the children are the monarch herself!
*/
infront_of(X, Y):- 
	offspring(X, A), offspring(Y, A),
	not(monarch(X)), not(monarch(Y)),
	older_than(X, Y).


/* Finally, let us define the insertion sort algorithm that will return the output sorted in the order of birth */
insertion_sort([Head|List], SortedList):- 
	insertion_sort(List, Temp),
	insert_object(Head, Temp, SortedList).	

insertion_sort([],[]).

/* If we are inserting Header before X in the list then insert the X in the tail part of the list */
insert_object(X, [Head|List], [Head|SortedList]):- 
	infront_of(Head, X), !, insert_object(X, List, SortedList).

/* Otherwise the X will be the head element of the list so insert it at the front */													
insert_object(X, List, [X|List]).


/* Using findall to query a list of all the offsprings. Then can perform the insertion_sort and return the sorted output! */
sort_succession_list(X, Result):- 
	findall(A, offspring(A, X), Offsprings),
	insertion_sort(Offsprings, Result).