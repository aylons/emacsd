;; Saves list of installed packages so they do not need to be copied over git

(require 'package)

(defun write-package-list (package-file)
  (with-temp-file package-file
	(insert (format "%s" package-activated-list))))

(defun read-package-list (package-file)
  (split-string
  (with-temp-buffer
	(insert-file-contents file)
	(buffer-substring-no-properties
	 (+ 1 (point-min))					; +1 to remove parenthesis
	 (- (point-max) 1)))))				; -1 to remove parenthesis

(defun recover-packages (package-file)
	(mapc 'package-install
		  (mapcar 'intern
				  (read-package-list package-file))))

(recover-packages package-file)

	
