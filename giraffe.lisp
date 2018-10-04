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
    (loop for x in movelist  ; TODO: change the if to append to list a
          do (if (vm (nth 0 x) (nth 1 x))
                 (setq a (append a (list x)))
                ;(format t  "(~D, ~D)~%" (nth 0 x) (nth 1 x))
                 ;(format t  "BANNED MOVE:(~D, ~D)~%" (nth 0 x) (nth 1 x))
                 )
          )
    a 
    )
  )




(defun gir (L)
  (format t "CURRENT MOVELIST (L): ~S" L)
  (format t "~%POSSIBLE MOVES: ~S~%" (pm (car (car L)) (car (cdr (car L)))))
  (if (= (list-length L) 49)
      (return-from gir L))
  (setq b '())
  (loop for square in (pm (car (car L)) (car (cdr (car L))))
        do (format t "square is: ~S~%" square)
        (format t "L is: ~S~%" L)
           (format t "~S~%" (member square L :test 'equal) ) )
  )

(gir '((0 0) (1 0)))




