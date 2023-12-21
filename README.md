# Shortest-path Searching

<br>

An implementation to "shortest-path" searching solution, with breadth-first approach, to search in two-way networks.

Example: A basic two-way network with 4 nodes:

<br>
  
     { A } < -- > { B } < -- > { F }  
       ^            ^  
       |            |  
       |            v  
        ------- > { C } < -- > { D }  
                    ^  
                    |  
                    v  
                  { E }  
  
A assoc-list representation of this network:  
  
> ((a b c) (b a c f) (c b d e) (d c) (e c) (f b))

<br>

### The heuristic used to find the shortest path:

Given a network, a start node and a end node:

1.  Test if there are new subpaths to trace in the pathlist: If not, return NIL; Else...
2. Test if there is a solution in the pathlist: If there is one, return it; Else...
3. Extend (or fork) the picked subpath to the next unknown nodes and append the result at the end of the pathlist;
4. Return to first step. 
