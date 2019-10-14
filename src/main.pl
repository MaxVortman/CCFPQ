:- use_module(library(statistics)).
:- discontiguous sco/2.
:- discontiguous scor/2.
:- discontiguous tr/2.
:- discontiguous t/2.
:- discontiguous other/2.
:- consult('../data/RDF/Matrices/go.txt').
:- table s/2.
:- table r/2.
:- table s5/2.
:- table s6/2.

% s s1 s5
% s s3 s6
% s s1 s2
% s s3 s4
% s5 s s2
% s6 s s4
% s1 SCOR
% s2 SCO
% s3 TR
% s4 T

s(X, Y) :- s1(X, Z), s5(Z, Y).
s(X, Y) :- s3(X, T), s6(T, Y).
s(X, Y) :- s1(X, T), s2(T, Y).
s(X, Y) :- s3(X, T), s4(T, Y).
s5(X, Y) :- s(X, T), s2(T, Y).
s6(X, Y) :- s(X, T), s4(T, Y).
s1(X, Y) :- scor(X, Y).
s2(X, Y) :- sco(X, Y).
s3(X, Y) :- tr(X, Y).
s4(X, Y) :- t(X, Y).

r(X,Y) :- tr(X,Z), r(Z,W), t(W,Y).
r(X,Y) :- scor(X,Z), r(Z,W), sco(W,Y).
r(X,Y) :- tr(X,Z), t(Z,Y).
r(X,Y) :- scor(X,Z), sco(Z,Y).


%saveQueries(FileName) :-
%    protocol(FileName).

%stopQueriesSaving :-
%    noprotocol.

% writeinfile(X, Y):-
%     open('output.txt', write, Out, [create([write])]),
%     format(Out, "X=~a Y=~a~n", [X, Y]),
%     close(Out).

%:-saveQueries('log.txt').
%:-time(forall(s(X,Y), format("X=~a Y=~a~n", [X, Y]))).
eval:-
    open('outputGO.txt', write, Out, [create([write])]),
    time(forall(s(X,Y), format(Out, "X=~a Y=~a~n", [X, Y]))),
    close(Out).
%:-stopQueriesSaving.
:-eval.
:-halt.