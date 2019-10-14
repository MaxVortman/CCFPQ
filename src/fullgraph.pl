:- use_module(library(statistics)).
:- discontiguous a/2.
:- consult('../data/FullGraph/Matrices/fullgraph_80000.txt').
%:- table r/2.


r(X,Y) :- a(X,Z), r(Z,Y).
r(X,Y) :- a(X,Y).


eval:-
    open('output-fg.txt', write, Out, [create([write])]),
    time(forall(r(X,Y), format(Out, "X=~a Y=~a~n", [X, Y]))),
    close(Out).
:-eval.
:-halt.