% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Each cell contains exactly one number from 1 to 9
1 { sudoku(X,Y,N) : N=1..9 } 1 :- X=1..9, Y=1..9.

% Keep the numbers that are already given in the puzzle
:- initial(X,Y,N), not sudoku(X,Y,N).

% The same number cannot appear twice in one row
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% The same number cannot appear twice in one column
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Map each cell to one of the four 3x3 subgrids
subgrid(X,Y,1+(((X-1)/3)*3+(Y-1)/3)) :- X=1..9, Y=1..9.

% The same number cannot appear twice in one subgrid
:- subgrid(X1,Y1,G),
   subgrid(X2,Y2,G),
   sudoku(X1,Y1,N),
   sudoku(X2,Y2,N),
   (X1,Y1) != (X2,Y2).

#show sudoku/3.
