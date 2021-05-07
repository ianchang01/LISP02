;;==============================================================================================
(defun c:lay_cur () 
  (setvar "cmdecho" 0)
  (setq ent (entsel)) ;;(<�Ϥ��W��: XXX> (x y 0.0))
  (setq ent (car ent)) ;;<�Ϥ��W��: XXX>
  (setq data (entget ent)) ;;((0 . "�Ϥ�����") (8 . "�ϼh") (10 x y 0.0) (40 . REAL)
  (setq la (cdr (assoc 8 data)))
  (setvar "clayer" la)
)  

;;==============================================================================================
(defun c:lay_off () 
  (setvar "cmdecho" 0)
  (while (setq ent (entsel))  ;;(<�Ϥ��W��: XXX> (x y 0.0))
    (setq ent (car ent)) ;;<�Ϥ��W��: XXX>
    (setq data (entget ent)) ;;((0 . "�Ϥ�����") (8 . "�ϼh") (10 x y 0.0) (40 . REAL)
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
  (setq rad (getdist "\n��J�s�b�|: "))
  (setq ent (entsel "\n�����: ")) ;;(<�Ϥ��W��: XXX> (x y 0.0))
  (setq ent (car ent)) ;;<�Ϥ��W��: XXX>
  (setq data (entget ent)) ;;((0 . "�Ϥ�����") (8 . "�ϼh") (10 x y 0.0) (40 . REAL)
  (setq old (assoc 40 data)) ;;(40 . �ثe�b�|)
  (setq new (cons 40 rad)) ;;(40 . �s���b�|)
  (setq data2 (subst new old data)) ;;�������s�����p����C(list)
  (entmod data2) ;;�ק�Ϥ����
  (princ)
)


(defun c:chg_att () 
  (setvar "cmdecho" 0)
  (setq str (getstringt "\n��J�s�����e:")) ;;"XXXX"
  (setq ent (nentsel)) ;;(<�Ϥ��W��:XXX> (x y 0.0))
  (setq ent (car ent)) ;;<�Ϥ��W��: XXX>
  (setq data (entget ent))
  (setq old (assoc 1 data)) ;;(1 . �ݩʭ�) (2 . �ݩʼ���)
  (setq new (cons 1 str)) ;;(1 . "XXXX")
  (entmod (subst new old data))
  (princ)
)

;;;(setq ss (ssget	'(
;;;		  (-4 . "<OR")
;;;		  (-4 . "<AND")
;;;		  (0 . "CIRCLE")
;;;		  (8 . "�ϼh01")
;;;		  (-4 . "AND>")
;;;		  (-4 . "<AND")
;;;		  (0 . "LINE")
;;;		  (8 . "�ϼh02")
;;;		  (-4 . "AND>")
;;;		  (-4 . "OR>")
;;;		 )
;;;	 )
;;;)