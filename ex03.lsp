;;==============================================================================================
(defun c:lay_cur () 
  (setvar "cmdecho" 0)
  (setq ent (entsel)) ;;(<圖元名稱: XXX> (x y 0.0))
  (setq ent (car ent)) ;;<圖元名稱: XXX>
  (setq data (entget ent)) ;;((0 . "圖元類型") (8 . "圖層") (10 x y 0.0) (40 . REAL)
  (setq la (cdr (assoc 8 data)))
  (setvar "clayer" la)
)  

;;==============================================================================================
(defun c:lay_off () 
  (setvar "cmdecho" 0)
  (while (setq ent (entsel))  ;;(<圖元名稱: XXX> (x y 0.0))
    (setq ent (car ent)) ;;<圖元名稱: XXX>
    (setq data (entget ent)) ;;((0 . "圖元類型") (8 . "圖層") (10 x y 0.0) (40 . REAL)
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
  (setq rad (getdist "\n輸入新半徑: "))
  (setq ent (entsel "\n選取圓: ")) ;;(<圖元名稱: XXX> (x y 0.0))
  (setq ent (car ent)) ;;<圖元名稱: XXX>
  (setq data (entget ent)) ;;((0 . "圖元類型") (8 . "圖層") (10 x y 0.0) (40 . REAL)
  (setq old (assoc 40 data)) ;;(40 . 目前半徑)
  (setq new (cons 40 rad)) ;;(40 . 新的半徑)
  (setq data2 (subst new old data)) ;;替換成新的關聯式串列(list)
  (entmod data2) ;;修改圖元資料
  (princ)
)


(defun c:chg_att () 
  (setvar "cmdecho" 0)
  (setq str (getstringt "\n輸入新的內容:")) ;;"XXXX"
  (setq ent (nentsel)) ;;(<圖元名稱:XXX> (x y 0.0))
  (setq ent (car ent)) ;;<圖元名稱: XXX>
  (setq data (entget ent))
  (setq old (assoc 1 data)) ;;(1 . 屬性值) (2 . 屬性標籤)
  (setq new (cons 1 str)) ;;(1 . "XXXX")
  (entmod (subst new old data))
  (princ)
)

;;;(setq ss (ssget	'(
;;;		  (-4 . "<OR")
;;;		  (-4 . "<AND")
;;;		  (0 . "CIRCLE")
;;;		  (8 . "圖層01")
;;;		  (-4 . "AND>")
;;;		  (-4 . "<AND")
;;;		  (0 . "LINE")
;;;		  (8 . "圖層02")
;;;		  (-4 . "AND>")
;;;		  (-4 . "OR>")
;;;		 )
;;;	 )
;;;)