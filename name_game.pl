game :-
    nl,
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    nl,
    menu([a,b,c]).

menu(Letters) :-
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    handle(Choice, Letters).

handle(1, Letters) :-
    write(Letters), nl,
    menu(Letters).

handle(2, Letters) :-
    write('Enter the letter: '), read(Letter),
    write('Enter the position: '), read(Position),
    insert_at(Letter, Position, Letters, NewLetters),
    menu(NewLetters).

handle(3, Letters) :-
    write('Enter the letter: '), read(Letter),
    menu([Letter|Letters]).

handle(4, Letters) :-
    write('Enter the letter: '), read(Letter),
    append(Letters, [Letter], NewLetters),
    menu(NewLetters).

handle(5, Letters) :-
    write('Enter the letter: '), read(Letter),
    delete(Letters, Letter, NewLetters),
    menu(NewLetters).

handle(6, _Letters) :-
    menu([]).

handle(7, _Letters) :-
    write('Goodbye'), nl.

insert_at(X, 1, L, [X|L]) :- !.
insert_at(X, N, [H|T], [H|R]) :-
    N > 1,
    N1 is N - 1,
    insert_at(X, N1, T, R).
insert_at(X, _, [], [X]).
