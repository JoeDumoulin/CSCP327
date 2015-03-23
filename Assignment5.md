#CPSC 327 Artificial Intelligence Spring 2015: Assignment 5#

In this assignment you will solve a game using the algorithm A\*.  The idea behind A\* is to combine a least cost path search with a best first strategy to quickly converge on the solution without a bunch of deep or wide node traversals.  

for reference, here are some useful sites which describ the A\* method in varying degrees of detail.

1. [A\* for beginners](http://www.policyalmanac.org/games/aStarTutorial.htm) This is a very nice introduction with illustrations to the concepts needed for A*.  
2. [Introduction to A\*](http://www.redblobgames.com/pathfinding/a-star/introduction.html) A great intro to A\* which compares it to other search methods. 
3. [How does Dijkstra's Algorithm and A-Star compare?](http://stackoverflow.com/questions/1332466/how-does-dijkstras-algorithm-and-a-star-compare) Here is a nice stack overflow article on A\* versus Dijkstra's algorithm.
4. [A\* Pathfinding Tutorial](https://www.youtube.com/watch?v=C0qCR18gXdU)  This is a very easy-to-understand tutorial, short and well-presented.  based on link 1 above.  The video has a few issues which we will discuss in class after the break.

You will use A* to solve the eight puzzle which is described [here](http://www.aiai.ed.ac.uk/~gwickler/eightpuzzle-uninf.html).  There is an example javascript implementation of the game that you can play [here](http://himanshug.info/8puzzle/8puzzle.html).  

Your solution will be in **prolog**.  [Here](http://cse630.artifice.cc/prolog-examples.html) is an example solution of the 8-puzzle that is a good starting point, but the solution on this page uses depth first search not A\*.  

This assignment will be due on **March 25**.

