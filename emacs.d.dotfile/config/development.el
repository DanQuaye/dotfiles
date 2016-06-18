(require 'packages)

(setq vc-handled-backends nil)

(add-to-list 'load-path
             (expand-file-name "config/development" user-emacs-directory))

(use-package flycheck
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc scala scala-scalastyle))
  (setq-default flycheck-emacs-lisp-load-path 'inherit)
  (setq flycheck-display-errors-delay 0.1)
  (global-flycheck-mode)
  )


(require 'emacs-sit)
(require 'evil)
(evil-ex-define-cmd "refreshs[yntax]" 'font-lock-fontify-buffer)
(evil-ex-define-cmd "cd" 'emacs-sit-cd)

(show-paren-mode 1)
(if (boundp 'show-paren-delay)
    (setq show-paren-delay 0))

;; Language packages
(use-package scala-mode
  :mode (("\\.scala\\'" . scala-mode))
  :interpreter
  ("scala" . scala-mode))
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))
(use-package ensime
  :commands ensime ensime-mode
  :config (add-hook 'scala-mode-hook 'ensime-mode)
  )
(use-package cmake-mode
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\.in\\'" . cmake-mode))
  )
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(require 'lisp-interaction)

(provide 'development)
