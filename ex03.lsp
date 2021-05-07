;;==============================================================================================
(defun c:lay_cur () 
  (setvar "cmdecho" 0)
  (setq ent (entsel)) ;;
  (setq ent (car ent)) ;;
  (setq data (entget ent)) ;;
  (setq la (cdr (assoc 8 data)))
  (setvar "clayer" la)
)  

;;==============================================================================================
(defun c:lay_off () 
  (setvar "cmdecho" 0)
  (while (setq ent (entsel))  ;;
    (setq ent (car ent)) ;;
    (setq data (entget ent)) ;;
    (setq la (cdr (assoc 8 data)))
    (command ".layer" "off" la "")
  )
  (princ)
)

;;==============================================================================================
(defun c:lay_on () 
  (setvar "cmdecho" 0)
  (command ".layer" "on" "*" "")
  (princ)
)

;;==============================================================================================
(defun c:chg_rad () 
  (initget 7) ;;(+ 1 2 4)
  (setq rad (getdist "\nNew Radius: "))
  (setq ent (entsel "\nSelect Circle: ")) 
  (setq ent (car ent)) 
  (setq data (entget ent)) 
  (setq old (assoc 40 data)) 
  (setq new (cons 40 rad)) 
  (setq data2 (subst new old data)) 
  (entmod data2) 
  (princ)
)


(defun c:chg_att () 
  (setvar "cmdecho" 0)
  (setq str (getstringt "\nNew text:")) 
  (setq ent (nentsel)) 
  (setq ent (car ent)) 
  (setq data (entget ent))
  (setq old (assoc 1 data)) 
  (setq new (cons 1 str)) 
  (entmod (subst new old data))
  (princ)
)

