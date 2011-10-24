(DECLARE (COMPILE))
;; (PROCLAIM (QUOTE (OPTIMIZE (SPEED 3) (SAFETY 0) (DEBUG 0))))

(speed 3)
(load "tostring.qi") ;; contains a macro which must be loaded before imperativ_faust.qi is loaded.
(load "poing-imperatif-compiler.qi")

;; Quit when there is an error, that is.
(DEFUN QUIT-COMPILER ()
  (EXT:QUIT -1))

(DEFUN startup ()
  (SETF *LOAD-COMPILING* NIL)
  (das-main (CAR *ARGS*) (CADR *ARGS*))
  (QUIT))

(DEFUN save-compiler (filename)
  (EXT:SAVEINITMEM filename :EXECUTABLE T :INIT-FUNCTION 'startup :QUIET T))

#|
(save-compiler "faust-imp-compiler")
|#
