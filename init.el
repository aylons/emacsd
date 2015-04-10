(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(org-file-apps (quote ((auto-mode . emacs) ("\\.mm\\'" . default) ("\\.x?html?\\'" . default) ("\\.pdf::\\([0-9]+\\)\\'" . "evince \"%s\" -p %1"))))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(vhdl-compiler-alist (quote (("ADVance MS" "vacom" "-work \\1" "make" "-f \\1" nil "valib \\1; vamap \\2 \\1" "./" "work/" "Makefile" "adms" ("\\s-\\([0-9]+\\):" 0 1 0) ("Compiling file \\(.+\\)" 1) ("ENTI/\\1.vif" "ARCH/\\1-\\2.vif" "CONF/\\1.vif" "PACK/\\1.vif" "BODY/\\1.vif" upcase)) ("Aldec" "vcom" "-93 -work \\1" "make" "-f \\1" nil "vlib \\1; vmap \\2 \\1" "./" "work/" "Makefile" "aldec" (".+?[ 	]+\\(?:ERROR\\)[^:]+:.+?\\(?:.+\"\\(.+?\\)\"[ 	]+\\([0-9]+\\)\\)" 1 2 0) ("" 0) nil) ("Cadence Leapfrog" "cv" "-work \\1 -file" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "leapfrog" ("duluth: \\*E,[0-9]+ (\\(.+\\),\\([0-9]+\\)):" 1 2 0) ("" 0) ("\\1/entity" "\\2/\\1" "\\1/configuration" "\\1/package" "\\1/body" downcase)) ("Cadence NC" "ncvhdl" "-work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "ncvhdl" ("ncvhdl_p: \\*E,\\w+ (\\(.+\\),\\([0-9]+\\)|\\([0-9]+\\)):" 1 2 3) ("" 0) ("\\1/entity/pc.db" "\\2/\\1/pc.db" "\\1/configuration/pc.db" "\\1/package/pc.db" "\\1/body/pc.db" downcase)) ("GHDL" "ghdl" "-i --workdir=\\1 --ieee=synopsys -fexplicit " "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "ghdl" ("ghdl_p: \\*E,\\w+ (\\(.+\\),\\([0-9]+\\)|\\([0-9]+\\)):" 1 2 3) ("" 0) ("\\1/entity" "\\2/\\1" "\\1/configuration" "\\1/package" "\\1/body" downcase)) ("Ikos" "analyze" "-l \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "ikos" ("E L\\([0-9]+\\)/C\\([0-9]+\\):" 0 1 2) ("^analyze +\\(.+ +\\)*\\(.+\\)$" 2) nil) ("ModelSim" "vcom" "-93 -work \\1" "make" "-f \\1" nil "vlib \\1; vmap \\2 \\1" "./" "work/" "Makefile" "modelsim" ("\\(ERROR\\|WARNING\\|\\*\\* Error\\|\\*\\* Warning\\)[^:]*:\\( *[[0-9]+]\\)? \\(.+\\)(\\([0-9]+\\)):" 3 4 0) ("" 0) ("\\1/_primary.dat" "\\2/\\1.dat" "\\1/_primary.dat" "\\1/_primary.dat" "\\1/body.dat" downcase)) ("LEDA ProVHDL" "provhdl" "-w \\1 -f" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "provhdl" ("\\([^ 	
]+\\):\\([0-9]+\\): " 1 2 0) ("" 0) ("ENTI/\\1.vif" "ARCH/\\1-\\2.vif" "CONF/\\1.vif" "PACK/\\1.vif" "BODY/BODY-\\1.vif" upcase)) ("QuickHDL" "qvhcom" "-work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "quickhdl" ("\\(ERROR\\|WARNING\\)[^:]*: \\(.+\\)(\\([0-9]+\\)):" 2 3 0) ("" 0) ("\\1/_primary.dat" "\\2/\\1.dat" "\\1/_primary.dat" "\\1/_primary.dat" "\\1/body.dat" downcase)) ("Savant" "scram" "-publish-cc -design-library-name \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work._savant_lib/" "Makefile" "savant" ("\\([^ 	
]+\\):\\([0-9]+\\): " 1 2 0) ("" 0) ("\\1_entity.vhdl" "\\2_secondary_units._savant_lib/\\2_\\1.vhdl" "\\1_config.vhdl" "\\1_package.vhdl" "\\1_secondary_units._savant_lib/\\1_package_body.vhdl" downcase)) ("Simili" "vhdlp" "-work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "simili" ("\\(Error\\|Warning\\): \\w+: \\(.+\\): (line \\([0-9]+\\)): " 2 3 0) ("" 0) ("\\1/prim.var" "\\2/_\\1.var" "\\1/prim.var" "\\1/prim.var" "\\1/_body.var" downcase)) ("Speedwave" "analyze" "-libfile vsslib.ini -src" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "speedwave" ("^ *ERROR[[0-9]+]::File \\(.+\\) Line \\([0-9]+\\):" 1 2 0) ("" 0) nil) ("Synopsys" "vhdlan" "-nc -work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "synopsys" ("\\*\\*Error: vhdlan,[0-9]+ \\(.+\\)(\\([0-9]+\\)):" 1 2 0) ("" 0) ("\\1.sim" "\\2__\\1.sim" "\\1.sim" "\\1.sim" "\\1__.sim" upcase)) ("Synopsys Design Compiler" "vhdlan" "-nc -spc -work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "synopsys_dc" ("\\*\\*Error: vhdlan,[0-9]+ \\(.+\\)(\\([0-9]+\\)):" 1 2 0) ("" 0) ("\\1.syn" "\\2__\\1.syn" "\\1.syn" "\\1.syn" "\\1__.syn" upcase)) ("Synplify" "n/a" "n/a" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "synplify" ("@[EWN]:\"\\(.+\\)\":\\([0-9]+\\):\\([0-9]+\\):" 1 2 3) ("" 0) nil) ("Vantage" "analyze" "-libfile vsslib.ini -src" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "vantage" ("\\*\\*Error: LINE \\([0-9]+\\) \\*\\*\\*" 0 1 0) ("^ *Compiling \"\\(.+\\)\" " 1) nil) ("VeriBest" "vc" "vhdl" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "veribest" ("^ +\\([0-9]+\\): +[^ ]" 0 1 0) ("" 0) nil) ("Viewlogic" "analyze" "-libfile vsslib.ini -src" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "viewlogic" ("\\*\\*Error: LINE \\([0-9]+\\) \\*\\*\\*" 0 1 0) ("^ *Compiling \"\\(.+\\)\" " 1) nil) ("Xilinx XST" "xflow" "" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "xilinx" ("^ERROR:HDLParsers:[0-9]+ - \"\\(.+\\)\" Line \\([0-9]+\\)." 1 2 0) ("" 0) nil)))))

;; for spotify
(require 'dbus)
(require 'cl) 
(setq spotify-enable-song-notifications t)
(define-key global-map (kbd "<f6>") 'spotify-previous)
(define-key global-map (kbd "<f7>") 'spotify-playpause)
(define-key global-map (kbd "<f8>") 'spotify-next)


;; Magit configuration
(global-set-key (kbd "C-x g") 'magit-status)
(add-to-list 'load-path "~/.emacs.d/magit-push-remote/")
(require 'magit-push-remote)
(magit-push-remote-mode 1)

;; Rainbow delimiters
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


;; Set octave mode for .m files
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
