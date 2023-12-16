(set-frame-font "basis33")
(set-face-attribute 'default nil :height 120)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/") t)

;;;shut up!!
(setq visible-bell 1)

;;;;;;;;;;;;;;;;;;;;;;;; aesthetics
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(global-tab-line-mode 1)


;------------modeline
(require 'telephone-line)
(telephone-line-mode 1)
;-------------doom
(require 'doom-themes)
	     (setq doom-themes-enable-bold t
	           doom-themes-enable-italic t)
(load-theme 'doom-city-lights t)

;---------rainbow delimiters
 (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;; general utility
(recentf-mode 1)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(setq recentf-max-menu-items 25)
(setq recentf-min-saved-items 25)

(setq show-paren-delay 0)
(show-paren-mode 1)
					;-----------paredit
(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)
;------------company-mode
(add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;; language stuff
(setq inferior-lisp-program "racket")

(require 'racket-mode)
(require 'racket-xp)
    (add-hook 'racket-mode-hook #'racket-xp-mode)
(define-key racket-mode-map (kbd "C-;") "λ")
(define-key racket-mode-map (kbd "C-:") "☯")
(define-key racket-mode-map (kbd "C-'") "π")
(define-key racket-mode-map (kbd "C-\"") "⏚")
(define-key racket-mode-map (kbd "C-,") "△")
(define-key racket-mode-map (kbd "C-.") "▽")
(define-key racket-mode-map (kbd "C-<") "-<")
(define-key racket-mode-map (kbd "C->") "~>")

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




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(company racket-mode paredit telephone-line undo-fu slime rainbow-delimiters doom-themes))
 '(show-paren-mode t)
 '(show-paren-when-point-inside-paren t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
