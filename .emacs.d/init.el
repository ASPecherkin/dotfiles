(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
;; theme
(load-theme 'monokai t)
;; fix path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'company)
(require 'flycheck)
(require 'go-eldoc)
(require 'company-go)
(add-to-list 'load-path "/Work/")
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle)

(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default gofmt-command "goimports")
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package nil 'noerror)
(setq use-package-always-defer t)
(use-package req-package
  :demand t
  :ensure t)

(use-package load-dir
  :ensure t)
(let ((load-dirs (locate-user-emacs-file "init.d")))
  (load-dirs))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (monokai-theme idea-darkula-theme exec-path-from-shell neotree gotest go-rename go-guru go-errcheck go-eldoc go-add-tags flycheck-gometalinter company-go))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
