(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(ede-project-directories (quote ("/home/aylons/projetos/afcipm")))
 '(inhibit-startup-screen t)
 '(org-file-apps
   (quote
	((auto-mode . emacs)
	 ("\\.mm\\'" . default)
	 ("\\.x?html?\\'" . default)
	 ("\\.pdf::\\([0-9]+\\)\\'" . "evince \"%s\" -p %1"))))
 '(package-archives
  (quote
   (("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/"))))
 '(org-todo-keywords
   (quote
	((sequence "TODO(t)" "DONE(d)" "WAITING(w)" "SOMEDAY(s)"))))
 '(py-shell-name "ipython3")
 '(vhdl-copyright-string
   "-------------------------------------------------------------------------------
-- Copyright (c) <year> <company>    

-- This program is free software: you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this program. If not, see
-- <http://www.gnu.org/licenses/>.

"))




;; for spotify
(require 'dbus)
(require 'cl) 
(setq spotify-enable-song-notifications t)
(define-key global-map (kbd "C-<f6>") 'spotify-previous)
(define-key global-map (kbd "C-<f7>") 'spotify-playpause)
(define-key global-map (kbd "C-<f8>") 'spotify-next)


;; Magit configuration
(global-set-key (kbd "C-x g") 'magit-status)



(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

;; (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)



;; Rainbow delimiters
(add-to-list 'load-path "~/.emacs.d/rainbow_delimiters/")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Org-mode:
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;;(load "~/org-files.el")

(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)

(add-hook 'org-clock-in-hook (lambda ()
      (if (not org-timer-current-timer) 
		  (org-timer-set-timer '(16)))))

(require 'ox-latex)


;; Billauer latex class
(add-to-list 'org-latex-classes
	     '("hitec"
	       "\\documentclass{hitec}"
	       ("\\chapter{%s}" . "\\chapter*{%s}")
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	                   )

;; Octave mode
(autoload 'octave-mode "octave-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Anonymous Pro" :foundry "unknown" :slant normal :weight normal :height 128 :width normal))))
 '(magit-diff-added ((t (:background "#335533" :foreground "blue"))))
 '(magit-diff-added-highlight ((t (:background "#336633" :foreground "blue"))))
 '(magit-sequence-done ((t (:foreground "grey"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "DeepSkyBlue1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "goldenrod1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "aquamarine1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "dark magenta"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "indian red"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "DarkSeaGreen1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "HotPink1"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "goldenrod4"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "DodgerBlue3")))))
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)


;; ;; Set octave mode for .m files
;; (autoload 'octave-mode "octave" nil t)
;; (setq auto-mode-alist
;;       (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; RET adds a newline and indents it 
(add-hook 'octave-mode-hook 
	  '(lambda nil
	     (define-key octave-mode-map [(control space)]
	       'octave-complete-symbol) ;; I prefere C-SPC
	     (define-key octave-mode-map [(meta control tab)] 
	       'octave-complete-symbol)))


(add-hook 'inferior-octave-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (define-key inferior-octave-mode-map [up]
              'comint-previous-input)
            (define-key inferior-octave-mode-map [down]
              'comint-next-input)))


;; (defun my-inferior-octave-listening-p ()
;;   "True if inferior octave is running and ready to receive input.
;;     Required for eldoc and other functions that try to get
;;     information from the running Octave, so they don't freeze emacs
;;     when Octave is busy doing something else."
;;   (and (boundp 'inferior-octave-process)
;;        inferior-octave-process
;;        (not inferior-octave-receive-in-progress)
;;        (eq (process-status inferior-octave-process) 'run)))

;; (defun my-octave-complete-symbol ()
;;   "Perform completion on Octave symbol preceding point.
;;     Compare that symbol against Octave's reserved words and builtin
;;     variables.  This is like the default Octave completer function,
;;     except that it also completes on structure fields."
;;   (interactive)
;;   ;; This code taken from lisp-complete-symbol
;;   (let* ((end (point))
;; 	 (beg (save-excursion (backward-sexp 1) (point)))
;; 	 (string (buffer-substring-no-properties beg end))
;; 	 (completion (try-completion string octave-completion-alist)))
;;     (if completion
;; 	(setq completion-list octave-completion-alist)
;;       (when (my-inferior-octave-listening-p)
;; 	(setq completion-list
;; 	      (save-excursion
;; 		(inferior-octave-send-list-and-digest
;; 		 (list (format "completion_matches(\"%s\");\n" string)))
;; 		inferior-octave-output-list))
;; 	(when completion-list
;; 	  (setq completion
;; 		(try-completion string inferior-octave-output-list)))))
    
;;     (cond ((eq completion t))           ; ???
;; 	  ((null completion)
;;                (message "Can't find completion for \"%s\"" string))
;; 	  ((not (string= string completion))
;; 	   (delete-region beg end)
;; 	   (goto-char beg)
;; 	   (insert completion))
;; 	  (t
;; 	   (let ((list (all-completions string completion-list))
;; 		 (conf (current-window-configuration)))
;; 	     ;; Taken from comint.el
;; 	     (message "Making completion list...")
;; 	     (with-output-to-temp-buffer "*Completions*"
;; 	       (display-completion-list list))
;; 	     (message "Hit space to flush")
;; 	     (let (key first)
;; 	       (if (save-excursion
;; 		     (set-buffer (get-buffer "*Completions*"))
;; 		     (setq key (read-key-sequence nil)
;; 			   first (aref key 0))
;; 		     (and (consp first) (consp (event-start first))
;; 			  (eq (window-buffer (posn-window (event-start
;; 							   first)))
;; 			      (get-buffer "*Completions*"))
;; 			  (eq (key-binding key) 'mouse-choose-completion)))
;; 		   (progn
;; 		     (mouse-choose-completion first)
;; 		     (set-window-configuration conf))
;; 		 (if (eq first ?\ )
;; 		     (set-window-configuration conf)
;; 		   (setq unread-command-events
;; 			 (listify-key-sequence key))))))))))

(add-to-list 'load-path "~/.emacs.d/matlab/")
(require 'matlab-load)

;; for GDB/debugging in general
(global-set-key (kbd "<f10>") 'gud-cont)
(global-set-key (kbd "<f9>") 'gud-step);; equiv matlab step in
(global-set-key (kbd "<f8>") 'gud-next) ;; equiv matlab step 1 
(global-set-key (kbd "<f7>") 'gud-finish) ;; equiv matlab step out


; Tramp mode
(setq tramp-default-method "ssh")

;; Remove toolbar
(tool-bar-mode 0)

;; Ease window resizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Python mode
;; (setq py-install-directory "~/.emacs.d/python-mode/")
;; (add-to-list 'load-path py-install-directory)
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Doxymacs
(add-to-list 'load-path "~/.emacs.d/doxymacs/")
(add-hook 'c-mode-common-hook
  (lambda ()
    (require 'doxymacs)
    (doxymacs-mode t)
    (doxymacs-font-lock)))

(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode t)

;; Smex
(add-hook 'after-init-hook 'my-after-init-hook)

(defun my-after-init-hook ()

  (require 'smex)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  
  )

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(load-file (expand-file-name "package-recover.el" user-emacs-directory))
(setq package-file (expand-file-name "package.lst" user-emacs-directory))
(recover-packages package-file)

(put 'dired-find-alternate-file 'disabled nil)

;(find-file "~/todo.package")			   




