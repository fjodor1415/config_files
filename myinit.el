(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(tool-bar-mode 0)
(menu-bar-mode 0)
(setq initial-scratch-message nil)

(use-package try
        :ensure t)

(use-package which-key
      :ensure t 
      :config
      (which-key-mode))

(require 'evil)
(evil-mode 1)

(use-package org-bullets
 :ensure t
 :config
 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
 (custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/mylife.org"))))

 (setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp/org")) load-path))

 (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
 (require 'org-install)
 (require 'org-capture)
 (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
 (global-set-key "\C-cb" 'org-iswitchb)
 (global-set-key (kbd "<f6>") 'org-capture)

(use-package ace-window
:ensure t
:init
(progn
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
  ))

(use-package counsel
:ensure t
)

(use-package ivy
:ensure t
:diminish (ivy-mode)
:bind (("C-x b" . ivy-switch-buffer))
:config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-display-style 'fancy))


(use-package swiper
:ensure try
:bind (("C-s" . swiper)
       ("C-r" . swiper)
       ("C-c C-r" . ivy-resume)
       ("M-x" . counsel-M-x)
       ("C-x C-f" . counsel-find-file))
:config
(progn
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))

(use-package avy
:ensure t
:bind ("M-s" . avy-goto-word-1)) ;; changed from char as per jcs

(use-package auto-complete
:ensure t
:init
(progn
  (ac-config-default)
  (global-auto-complete-mode t)
  ))

(use-package color-theme
:ensure t)

(use-package zenburn-theme
:ensure t
:config (load-theme 'zenburn t))

(load-theme 'leuven t)

(use-package ox-reveal
:ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
:ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))
