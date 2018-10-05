(defvar movelist)
(defvar b)

(defun vm (x y)    ; Valid Moves
  (if (and (<= x 6) (>= x 0) (<= y 6) (>= y 0)) 
      t nil)   ; If x and y between 0 and 6, valid.
  )            ; Else, nil


(defun pm (x y)    ; Possible Moves
  (let ((a '()))
    (setq movelist (list
                    (list (+ x 1) y)  ; 4 1-space moves
                    (list (- x 1) y)
                    (list x (+ y 1))
                    (list x (- y 1))
                    (list (- x 1) (- y 2))  ; 8 knight moves
                    (list (+ x 1) (- y 2))
                    (list (+ x 2) (- y 1))
                    (list (+ x 2) (+ y 1))
                    (list (+ x 1) (+ y 2))
                    (list (- x 1) (+ y 2))
                    (list (- x 2) (+ y 1))
                    (list (- x 2) (- y 1))
                    ) )
    (loop for x in movelist  
          do (if (vm (nth 0 x) (nth 1 x))
                 (setq a (append a (list x)))
                 )
          )
    a 
    )
  )




(defun gir (L)
  ;(format t "CURRENT MOVELIST (L): ~S" L)
  ;(format t "~%POSSIBLE MOVES: ~S~%" (pm (car (car L)) (car (cdr (car L)))))
  (if (= (list-length L) 49)
      (format t "L: ~S~%" L) )      ; Print out the current path if length is 49
  (if (= (list-length L) 49)
      (return-from gir L))
  (setq b '())
  (loop for square in (pm (car (car L)) (car (cdr (car L))))
        do (if (not (member square L :test 'equal))
               (setq b (append b (list (list (car square) (car (cdr square)))))) 
               )
        )
  ;(format t "searchlist: ~S~%" b)
  (loop for x in b
        do (gir (cons x L)))
  (return-from gir nil)
  )

(print (gir '((0 0)))) 


