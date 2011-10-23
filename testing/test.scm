#!/bin/sh
# -*- scheme -*-
exec guile -e main -s $0 $*
!#

(use-modules (ice-9 rdelim)
	     (ice-9 pretty-print)
	     (srfi srfi-1))


(define <-> string-append)

(define *files-error* (map (lambda (name)
                             (<-> (symbol->string name) ".dsp"))
                           '(accumulator_error
                             illegal1
                             )))

(define *files-unsure* (map (lambda (name)
                             (<-> (symbol->string name) ".dsp"))
                           '(                       
                             allpass1
                             am_pitchshift
                             am_pitchshift_opt
                             rateshifter
                             )))


(define *files* (map (lambda (name)
                       (<-> (symbol->string name) ".dsp"))
                     '(
                       intervals
                       vol 
                       quickclass
                       reserved
                       retmultsignals
                       return
                       accumulator
                       else
                       bank
                       osc1
                       array2
                       methodcalls
                       osc2
                       fixp16
                       classvar
                       osc3
                       emptyclass
                       higherorder
                       account
                       typing
                       )))

(define *poing-imperatif* "../poing-imperatif")

(define *a.out-args* "-n 40")

(define *correct-directory* "correct/")
(define *test-directory* "test/")

(define *temp-dir* "/tmp/")


(define (c-for-each func . lists)
  (let ((n 0))
    (apply for-each (cons (lambda els
			    (apply func (cons n els))
			    (set! n (1+ n)))
			  lists))))

(define (c-display . args)
  (c-for-each (lambda (n arg)
		(if (> n 0)
		    (display " "))
		(display arg))
	      args)
  (newline))


(define (my-system . args)
  (set! args (apply <-> args))
  (c-display "         Runs: \"" args "\"")
  (if (= (system args) 0)
      #t
      #f))

(define system-output-result #t)

(define (get-system-output . command)
  (set! command (apply <-> command))
  (let ((logfilename (<-> *temp-dir* "snd-ls-logtemp")))
    (set! system-output-result (my-system command " > " logfilename))
    (let* ((ret "")
	   (fd (open-file logfilename "r"))
	   (line (read-line fd)))
      (while (not (eof-object? line))
	     (set! ret (<-> ret line "\n"))
	     (set! line (read-line fd)))
      (close fd)
      (my-system "rm " logfilename)
      ret)))


(define (get-result-filename directory file)
  (<-> directory file "_result.txt"))


(define (gen-result file directory)
  (if (not (my-system *poing-imperatif* 
                      " --keep -a plot.cpp "
                      file
                      " >temp.cpp && g++ temp.cpp && ./a.out " *a.out-args* " >"
                      (get-result-filename directory file)))
      (throw 'error)))

(define (gen-all-correct)
  (for-each (lambda (file)
              (c-display "\nGenerating " file)
              (gen-result file *correct-directory*))
            *files*))

(define (check-correct file)
  (c-display "\nChecking " file)
  (gen-result file *test-directory*)
  (let ((ret (get-system-output "diff "
                                (get-result-filename *correct-directory* file) " "
                                (get-result-filename *test-directory* file))))
    (if (not (string=? "" ret))
        (throw (string->symbol (<-> "Wrong result for " file "\n" ret))))))


(define (check-all-correct)
  (for-each check-correct *files*)
  (c-display "\nAll seems correct."))


(define (print-help args)
  (c-display (car args) "[gen-correct | check]"))

(define (main args)
  (cond ((null? (cdr args))
         (print-help args))

        ((string=? (cadr args) "gen-correct")
         (gen-all-correct))

        ((string=? (cadr args) "check")
         (check-all-correct))

        (else
         (print-help args))))

#!
(gen-all-correct)
(check-all-correct)
!#





