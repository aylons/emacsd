(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass))))

(global-set-key (kbd "C-x g") 'magit-status)

(add-to-list 'load-path "~/.emacs.d/rainbow_delimiters/")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Org-mode:

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(load "~/org-files.el")

(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)

(add-hook 'org-clock-in-hook (lambda ()
      (if (not org-timer-current-timer) 
      (org-timer-set-timer '(16)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Anonymous Pro" :foundry "unknown" :slant normal :weight normal :height 128 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "DeepSkyBlue1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "DodgerBlue1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "goldenrod1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "aquamarine1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "dark magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "DarkSeaGreen1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "indian red"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "goldenrod1"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "HotPink1")))))
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
