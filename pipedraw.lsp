(defun c:pipedraw ( / active-layer pt1 pt2 sset entity target-layer loop-main loop-draw )
  (vl-load-com)
  
  (setq active-layer (getvar "CLAYER"))
  (setq loop-main t)
  
  (while loop-main
    (initget "Select Layer Exit")
    (setq pt1 (getpoint "\nPick start point or [Select existing pipe / Layer / Exit] <Exit>: "))
    
    (cond
      ((or (null pt1) (equal pt1 "Exit"))
       (setq loop-main nil)
       (princ "\nPipe drawing engine closed.")
      )
      
      ((equal pt1 "Layer")
       (setq target-layer (getstring t (strcat "\nEnter target layer name <" active-layer ">: ")))
       (if (and target-layer (/= target-layer ""))
         (if (tblsearch "layer" target-layer)
           (setq active-layer target-layer)
           (princ "\nLayer does not exist. Keeping current layer.")
         )
       )
      )
      
      ((equal pt1 "Select")
       (setq entity (entsel "\nSelect pipe to match layer: "))
       (if entity
         (progn
           (setq active-layer (cdr (assoc 8 (entget (car entity)))))
           (setvar "CLAYER" active-layer)
           (princ (strcat "\nMatched layer: " active-layer ". Ready to draw."))
         )
       )
      )
      
      ((listp pt1)
       (setq loop-draw t)
       (while loop-draw
         (setq pt2 (getpoint pt1 "\nPick next point (Press Enter to finish this run): "))
         (if pt2
           (progn
             (entmake (list
                        '(0 . "LINE")
                        '(100 . "AcDbEntity")
                        '(100 . "AcDbLine")
                        (cons 8 active-layer)
                        (cons 10 pt1)
                        (cons 11 pt2)
                      ))
             (setq pt1 pt2)
           )
           (setq loop-draw nil)
         )
       )
      )
    )
  )
  (princ)
)
(princ)
