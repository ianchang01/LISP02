;;==========================================================================
(defun set_layer(lname col ltype)
  (if (tblsearch "LAYER" lname)
      (setvar "clayer" lname)
      (command ".layer" "m" lname "c" col lname "L" ltype lname "")
  )
)
;;==========================================================================
;;     X     
;;           
;; X   p0   X
;;           
;;     X     
(defun draw_hole(pt $x $y)
  (setq p0 (list (+ (car pt) $x) (+ (cadr pt) $y)))
  (setvar "clayer" "0")
  (command ".circle" p0 "d" dia)
  (set_layer "center" 4 "center")
  (setq dist (+ (/ dia 2) 3))
  (command ".line" (polar p0 pi dist) (polar p0 0 dist) "")
  (command ".line" (polar p0 (* 0.5 pi) dist) (polar p0 (* 1.5 pi) dist) "")
) 

;;==========================================================================
;;    P4---------p3  
;;    |          |   
;;    |          |   
;;    |          |   
;;    P1--------p2   
;;                   
(defun c:board_holes()
  (setq oldla (getvar "clayer"))
  (setq oldos (getvar "osmode"))
  (setvar "cmdecho" 0)
  (command ".vslide" "board_holes")
  (setq dia (getdist "\n孔徑: "))
  (setq dx (getdist "\nX= "))
  (setq dy (getdist "\nY= "))
  (redraw)
  (setq p1 (getpoint "\n左下角點: "))
  (setq p3 (getcorner p1 "\n右上角點: "))
  (setq p2 (list (car p3) (cadr p1)))
  (setq	p4 (list (car p1) (cadr p3)))
  (setvar "clayer" "0")
  (setvar "osmode" 0)
  (command ".line" p1 p2 p3 p4 "c")
  (draw_hole p1 dx dy) 
  (draw_hole p2 (* dx -1) dy)
  (draw_hole p3 (* dx -1) (* dy -1))
  (draw_hole p4 dx (* dy -1))  
  (setvar "clayer" oldla)
  (setvar "osmode" oldos)
  (princ)
)

