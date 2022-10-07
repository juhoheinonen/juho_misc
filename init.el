(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))

(unless package--initialized (package-initialize))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini)
	 :map helm-map 
	 ("<tab>" . helm-execute-persistent-action)
	 ("C-z" . helm-select-action)
	 :map helm-find-files-map
	 ("<DEL>" . helm-ff-delete-char-backward)
	 ("C-<backspace>" . helm-find-files-up-one-level))
  :init (helm-mode 1))

(global-set-key (kbd "<f6>")
		(lambda ()
		  (interactive)
		  (find-file user-init-file)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2dc03dfb67fbcb7d9c487522c29b7582da20766c9998aaad5e5b63b5c27eec3f" default))
 '(package-selected-packages
   '(magit zenburn-theme use-package helm color-theme-sanityinc-solarized)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn))

(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(desktop-save-mode 1)
(setq desktop-save t)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-load-locked-desktop t)
(setq desktop-auto-save-timeout 5)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))
