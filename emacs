(menu-bar-mode -1)
(put 'erase-buffer 'disabled nil)

(defun my-ruby-mode-hook ()
  (local-set-key (kbd "C-c c") 'comment-region)
  (local-set-key (kbd "C-c C") 'uncomment-region)
  )

(add-hook 'python-mode-hook 'my-ruby-mode-hook)
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; set global bindings
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c k") 'erase-buffer)
(global-set-key (kbd "<C-up>") 'move-previous-line)
(global-set-key (kbd "<C-down>") 'move-next-line)
(global-set-key (kbd "ESC <up>") 'gcm-scroll-up)
(global-set-key (kbd "ESC <down>") 'gcm-scroll-down)
(global-set-key (kbd "C-c p") 'dirs)
(global-set-key (kbd "C-c ^") 'my-enlarge-window)

;; (set-face-foreground 'modeline "white")
;; (set-face-background 'modeline "green")
;;(set-face-background 'modeline-inactive "light blue")
(set-face-background 'mode-line "brown")
(set-face-foreground 'mode-line "green")
(set-face-foreground 'mode-line-inactive "blue")
(set-face-background 'mode-line-inactive "black")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-file-name "/usr/local/bin/bash"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "yellow"))))
 '(font-lock-string-face ((t (:foreground "color-166"))))
 '(minibuffer-prompt ((t (:background "black" :foreground "yellow")))))

(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 5))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 5))
(defun move-previous-line ()
  (interactive)
  (previous-line 4))
(defun move-next-line ()
  (interactive)
  (next-line 4))
(defun my-enlarge-window ()
  (interactive)
  (enlarge-window 1 t))

(defun my-eshell-mode-hook ()
  (local-set-key (kbd "C-c k") 'eshell/clear))

(add-hook 'eshell-mode-hook 'my-eshell-mode-hook)

(defun eshell/clear ()
  "Hi, you will clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (message "erase eshell buffer")))


(add-to-list 'load-path "~/lib/emacs/go-mode/")
(require 'go-mode)
(add-hook 'before-save-hook #'gofmt-before-save)

(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
					; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
;;	   "go generate && go build -v && go test -v && go vet" ;; original
  	   "build -v"))
					; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; configure for text window and iterm 
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; enable ido-mode
(require 'ido)
(ido-mode t)

;; enable column line number position
(column-number-mode)

;; Occasionally this could be useful, but not in general.
;;(desktop-save-mode 1)

;; could be useful for definining count-string-method
(require 'thingatpt)

;; figure out how to download and install, maybe using package-install
;; see: http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
;; expand-region

