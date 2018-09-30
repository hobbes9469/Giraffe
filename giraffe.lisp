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
                 (format t  "BANNED MOVE:(~D, ~D)~%" (nth 0 x) (nth 1 x))
                 )
          )
    (print a)
    )
  )

(pm 0 0)
