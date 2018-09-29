(defun vm (x y)    ; Valid Moves
  (if (and (<= x 6) (>= x 0) (<= y 6) (>= y 0)) 
      t nil)
  )



(defun pm (x y)    ; Possible Moves
  (list
   (list (+ x 1) y)
   (list (- x 1) y)
   (list x (+ y 1))
   (list x (- y 1))
   )
  )

  
