; -*-Lisp-*-

(menu-bar-mode -1)
(put 'erase-buffer 'disabled nil)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; ---------- MODE HOOKS ------------
(defun my-ruby-mode-hook ()
  (local-set-key (kbd "C-c c") 'comment-region)
  (local-set-key (kbd "C-c C") 'uncomment-region)
  )

(add-hook 'python-mode-hook 'my-ruby-mode-hook)
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;;(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)


(require 'golint)

(defun my-go-mode-hook ()
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
;;  (add-hook 'before-save-hook 'golint)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   "make build"))
;;	   "go generate && go build -v && go test -v && go vet" )) ;; original
;;  	   "go build"))
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-/") 'godef-jump-other-window)
;;  (local-set-key (kbd "C-c d") 'go-oracle-describe)
;;  (local-set-key (kbd "C-c r") 'go-oracle-referrers)
;;  (local-set-key (kbd "C-c r") 'go-oracle-callers)
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
	(message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
	(cond
	 ((vc-backend filename) (vc-rename-file filename new-name))
	 (t
	  (rename-file filename new-name t)
	            (set-visited-file-name new-name t t)))))))

;; -------------------------------------
(defun pbcopy-on-region (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "pbcopy"))

;; -------------------------------------

;; set global bindings
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c k") 'erase-buffer)
(global-set-key (kbd "<C-up>") 'move-previous-line)
(global-set-key (kbd "<C-down>") 'move-next-line)
(global-set-key (kbd "ESC <up>") 'gcm-scroll-up)
(global-set-key (kbd "ESC <down>") 'gcm-scroll-down)
(global-set-key (kbd "C-c d") 'dirs)
(global-set-key (kbd "C-c ^") 'my-enlarge-window)
(global-set-key (kbd "C-c e") 'recompile)
(global-set-key (kbd "C-c w") 'pbcopy-on-region)
(global-set-key (kbd "C-c |") 'shell-command-on-region)
;; temporary
(global-set-key (kbd "M-[ a") 'gcm-scroll-up)
(global-set-key (kbd "M-[ b") 'gcm-scroll-down)
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)

;; (set-face-foreground 'modeline "white")
;; (set-face-background 'modeline "green")
;;(set-face-background 'modeline-inactive "light blue")
;; see emacs command list-colors-display

(set-face-background 'mode-line "brown")
(set-face-foreground 'mode-line "green")

;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(font-lock-function-name-face ((t (:foreground "yellow"))))
;; '(font-lock-string-face ((t (:foreground "color-166"))))
;; '(highlight ((t (:background "color-234"))))
;; '(hl-line ((t (:background "color-234"))))
;; '(minibuffer-prompt ((t (:background "black" :foreground "yellow")))))

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

;; configure for text window and iterm 
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Thanks John Russell 
(require 'flx-ido)
(ido-mode 1)    ; actually I kind of like it with file
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(global-set-key (kbd "M-x") 'smex)
;; keep the old M-x around.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; ido-vertical mode needs more space. regular ido 3 is good
(setq ido-max-window-height 30)
(flx-ido-mode 1) ; fuzzy matching for ido https://github.com/lewang/flx
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; turn on projectile globally
(projectile-global-mode)

;; enable column line number position
(column-number-mode)

(when window-system (set-exec-path-from-shell-PATH))

(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


(defun small-screen()
  (small-font)
  (small-split))

(defun small-font ()
     ;;     (interactive)
     ())
     

(defun small-split ()
  (setq split-height-threshold 80)
  (setq split-width-threshold 160))

(defun big-screen ()
  (interactive)
  (big-font)
  (big-split))

(defun big-split ()
  (setq split-height-threshold nil)
  (setq split-width-threshold 0))

;; configure font for big monitor instead of small laptop
(defun big-font ()
  (set-face-attribute 'default nil :font "Droid Sans Mono-13") 
  (set-frame-font "Droid Sans Mono-13" nil t))

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
	(revert-buffer t t t) )))
      (message "Refreshed open files.") )


(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-c /") 'toggle-comment-on-line)
