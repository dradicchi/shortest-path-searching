;;;; Shortest-path Searching

;;; An implementation to "shortest-path" searching solution, with breadth-first 
;;; approach, to search in two-way networks.

;;; A basic two-way network with 4 nodes:
;;;
;;;    { A } < -- > { B } < -- > { F }
;;;      ^            ^
;;;      |            |
;;;      |            v
;;;       ------- > { C } < -- > { D }
;;;                   ^
;;;                   |
;;;                   v
;;;                 { E }
;;;
;;; A assoc-list representation of this network:
;;;
;;;   ((a b c) (b a c f) (c b d e) (d c) (e c) (f b))
;;;

;;; A heuristic to find the shortest path:
;;;
;;; (01) Test if there are new subpaths to trace in the pathlist: If not, return
;;;      NIL; Else...
;;; (02) Test if there is a solution in the pathlist: If there is one, return 
;;;      it; Else...
;;; (03) Extend (or fork) the picked subpath to the next unknown nodes and 
;;;      append the result at the end of the pathlist;
;;; (04) Return to (1) 

(defun shortest-path (start end network)
    (trace-paths (list (list start)) end network))

    
;;; An auxiliar function to trace possible paths and return the shortest one.
(defun trace-paths (pathlist end network)
    (if (null pathlist)
        nil ; If all subpaths are traced without a solution.
        (let ((solutionpath (assoc end pathlist)))
             (if solutionpath ; Tests if the last recursion found a solution.
                 (reverse solutionpath)
                 ;; Traces the next layer of nodes.
                 (trace-paths (append (cdr pathlist) 
                                         (next-step-path (car pathlist) network))
                                  end network)))))


;;; An auxiliar function to extend (or fork) next step(s) to a traced path.
(defun next-step-path (subpath network)
    (let ((curnode (car subpath)))
         ;; Catches all new (discards known nodes) possible next nodes for a 
         ;; traced path.
         (let ((nextnodes (set-difference (cdr (assoc curnode network)) 
                                          subpath)))
              ;; Returns a list of updated subpaths
              (mapcar #'(lambda (elt) (cons elt subpath)) nextnodes))))


