(setq my-lisp-dir
    (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'load-path my-lisp-dir)

(setq make-backup-files nil)

;;; Turn bell off entirely
(setq ring-bell-function 'ignore)

;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

;;; Mouse settings
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  )

(when (eq system-type 'darwin)
  (require 'osx-tweaks)
  )

(require 'packages)

(require 'display-setup)

(require 'evil-setup)
(require 'tmux-navigate)

(ensure-package-installed 'helm)
(require 'helm)
(ensure-package-installed 'hydra)

(defhydra helm-like-unite ()
  "vim movement"
  ("?" helm-help "help")
  ("<escape>" keyboard-escape-quit "exit")
  ("<SPC>" helm-toggle-visible-mark "mark")
  ;; not sure if there's a better way to do this
  ("v" helm-execute-persistent-action)
  ("h" helm-ff-run-switch-other-window)
  ("j" helm-next-line "down")
  ("k" helm-previous-line "up")
  ("i" nil "cancel"))

(define-key helm-map (kbd "<escape>") 'helm-like-unite/body)

(ensure-package-installed 'shackle)
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align 'below :size 0.4)))
(setq helm-split-window-preferred-function 'ignore)
(shackle-mode)
