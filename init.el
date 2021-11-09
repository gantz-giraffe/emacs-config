(set-default-font "basis33")
(set-face-attribute 'default nil :height 120)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;; general utility
(recentf-mode 1)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(setq recentf-max-menu-items 25)
(setq recentf-min-saved-items 25)

;------------smartparens
(require 'smartparens-config)
(require 'bindings-smartparens)
(show-smartparens-global-mode t)
(add-hook 'prog-mode-hook 'turn-on-smartparens-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-mode)

;---------rainbow delimiters
 (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;------------neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;------------company-mode
(add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;; aesthetics
(scroll-bar-mode -1)

(require 'all-the-icons)


;-------------doom
(require 'doom-themes)
	     (setq doom-themes-enable-bold t
	           doom-themes-enable-italic t)
(load-theme 'doom-city-lights t)


(require 'doom-modeline) ;modeline
(doom-modeline-mode 1)
(setq doom-modeline-height 15)
(setq doom-modeline-bar-width 3)
(column-number-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;; language stuff

;--------------clojure
(require 'cider)
;(require 'flycheck-clj-kondo)

;-------------rest
(add-to-list 'load-path "~/.emacs.d/elpa/csound-mode-20200518.1546")
(require 'csound-mode)
(require 'glsl-mode)
(require 'racket-mode)
(require 'julia-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;; code folding
    (defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))

 (defun toggle-hiding (column)
      (interactive "P")
      (if hs-minor-mode
          (if (condition-case nil
                  (hs-toggle-hiding)
                (error t))
              (hs-show-all))
        (toggle-selective-display column)))

(load-library "hideshow")
    (global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)

   (add-hook 'c-mode-common-hook   'hs-minor-mode)
    (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
    (add-hook 'java-mode-hook       'hs-minor-mode)
    (add-hook 'lisp-mode-hook       'hs-minor-mode)
    (add-hook 'perl-mode-hook       'hs-minor-mode)
    (add-hook 'sh-mode-hook         'hs-minor-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;; rebind undo and redo
(require 'undo-fu)
(global-set-key (kbd "C-z") 'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;; please stfu emacs
(setq visible-bell 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters racket-mode flycheck-clojure vterm undo-fu smartparens pfuture persistent-soft neotree julia-mode hydra ht glsl-mode ergoemacs-mode doom-themes doom-modeline dashboard csound-mode company cider ace-window))))
