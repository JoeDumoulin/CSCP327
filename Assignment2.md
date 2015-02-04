#CPSC 327 Artificial Intelligence Spring 2015: Assignment 2#

The key to evaluating logic is to treat it as a particular language.  In this assignment you will create a recursive descent parser to evalute sentences in propositional logic.

To help you with this assignment, you should look at some of the www pages that describe how to create simple infix arithmatic calculators using recursive descent parsing.

also I will provide you with a grammar for designing the parser operations and some tests that your rogram should be able to successfully parse.

You may complete this assignment in either python or c++.  You may work in groups of up to three if you prefer.

If you are unfamilar with recursive descent parsing, I would recommend that you create running versions of the infix parsers on the example pages you read.  then use the grammar provided with this assignment to design the parser for propositional sentences.

There are many many examples of recursive descent parsing as well as excellent descriptions of the technique.  Some recommended ones are listed below:

###Recursive Descent Technique###
- [A fairly technical description](http://www.cs.engr.uky.edu/~lewis/essays/compilers/rec-des.html)
- [A very nice description with example in c and book and article references](http://en.wikipedia.org/wiki/Recursive_descent_parser)

###Examples in C++###
- [An example that is long, easy to understand, but full of bugs](http://www.dreamincode.net/forums/topic/234775-creating-a-recursive-descent-parser-oop-style/) Extra credit for identifying serious problems with this code.
- [A nice example from Stroustrop](http://www.cplusplus.com/forum/general/1116/2/)

###Examples in python###
- [Parser Combinator method without the evaluation step](http://www.onlamp.com/pub/a/python/2006/01/26/pyparsing.html?page=5)
- [A more complex and complete description of parsing](http://effbot.org/zone/simple-top-down-parsing.htm)
- [A clear description of all the steps for creating an infix calculator in python](http://blog.erezsh.com/how-to-write-a-calculator-in-70-python-lines-by-writing-a-recursive-descent-parser/)

###A Grammar for Propositional Sentences###
To create a parser for Propositional logic, we need a concrete representation of the structure of the language.   For this representation we use the following grammar:


>BiconditionalExpression -> ImplicationExpression '<=>' BiconditionalExpression

>BiconditionalExpression -> ImplicationExpression

>ImplicationExpression -> OrExpression '=>' ImplicationExpression

>ImplicationExpression -> OrExpression

>OrExpression -> AndExpression '|' OrExpression

>OrExpression -> AndExpression

>AndExpression -> NegateExpression '&' AndExpression

>AndExpression -> NegateExpression

>NegateExpression -> '~' Expression

>NegateExpression -> Expression

>Expression -> '(' BiConditionalExpression ')'

>Expression -> LiteralExpression

>LiteralExpression -> 'true'

>LiteralExpresion -> 'false'

The list of operators and their order of operations from least to most significant) is:

`<=>, =>, |, &, ~`

Use this grammar and the techniques you learn in the tutorials to create two operations.  One operation will read a line of propositional arithmatic like the following:

`false & (true <==> (false | true & ~false))`

And correctly parse it into an Abstract Syntax Tree.  Use the examples in the file `TestParse.txt` on this github site to test your parses.

The next operation is to Evaluate the tree.  In this operation your program will read the tree created by the parse and return the logical value of the expression represented in the Tree.

Test your program using the contents of the `TestParse.txt` file and determine if you are correctly evaluating each statement.

This assignment is due on **Friday, February 7 2015**.




