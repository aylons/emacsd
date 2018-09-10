(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(helm-exit-idle-delay 0.0)
 '(inhibit-startup-screen t)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf::\\([0-9]+\\)\\'" . "evince \"%s\" -p %1"))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "DONE(d)" "WAITING(w)" "SOMEDAY(s)"))))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (fancy-narrow flycheck-ledger ledger-mode flymd markdown-mode+ markdown-preview-eww markdown-preview-mode indent-guide ws-butler clean-aindent-mode stickyfunc-enhance org-projectile srefactor company-cmake with-editor git-commit async dash magit-popup company ivy swiper find-file-in-project highlight-indentation pyvenv yasnippet w3 vlf spotify speck smex markdown-mode magit helm-gtags ggtags function-args elpy dired-nav-enhance cmake-mode auto-complete-octave)))
 '(py-shell-name "ipython3")
 '(python-shell-interpreter "python3")
 '(sr-speedbar-right-side nil)
 '(truncate-lines t)
 '(sr-speedbar-skip-other-window-p t)
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

")
 '(word-wrap t))

;; basic behaviour
(setq search-highlight t                 ;; highlight when searching...
	  query-replace-highlight t)             ;; ...and replacing
(fset 'yes-or-no-p 'y-or-n-p)            ;; enable y/n answers to yes/n
(linum-mode t)
(column-number-mode t)

(setq
 confirm-nonexistent-file-or-buffer nil  ;; not needed
 completion-ignore-case t                ;; ignore case when completing...
 read-file-name-completion-ignore-case t) ;; ...filenames too

;; font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; for spotify
(require 'dbus)
(require 'cl) 
(setq spotify-enable-song-notifications t)
(define-key global-map (kbd "C-<f6>") 'spotify-previous)
(define-key global-map (kbd "C-<f7>") 'spotify-playpause)
(define-key global-map (kbd "C-<f8>") 'spotify-next)
(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; Package: clean-aindent-mode
;;(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

;; Speedbar in same frame
(add-to-list 'load-path "~/.emacs.d/sr-speedbar/")
(require 'sr-speedbar)
(global-set-key (kbd "M-s M-s") 'sr-speedbar-toggle)

;; Package: yasnippet
; (require 'yasnippet)


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


;; Tramp mode
(setq tramp-default-method "ssh")

(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory temporary-file-directory)
(setq tramp-verbose 10)
(setq tramp-verbose 1)

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
	      indent-tabs-mode nil)

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

 (yas-global-mode 1)

;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Helm setup           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)


(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(global-set-key (kbd "C-x C-f") 'helm-find-files)


(helm-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This pointo on comes from c-ide ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)


(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;; Company-mode
(require 'cc-mode)
(require 'semantic)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)
(add-to-list 'company-backends 'company-c-headers)

;;; For function-args
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(set-default 'semantic-case-fold t)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-add-system-include "/usr/local/include")

(require 'stickyfunc-enhance)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

(semantic-mode 1)

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )


(require 'ede)
(global-ede-mode)
(projectile-global-mode)                ;may sound redundante to ede, but they complement in some ways
(add-hook 'c-mode-common-hook   'hs-minor-mode)

(setq projectile-mode-line "Projectile")

(put 'dired-find-alternate-file 'disabled nil)

(require 're-builder)
(setq reb-re-syntax 'string)

(fancy-narrow-mode)
;(find-file "~/todo.package") 





