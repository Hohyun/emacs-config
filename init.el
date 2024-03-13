; import org-mode init file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
;(load-file (expand-file-name "~/.emacs.d/config.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" default))
 '(haskell-process-auto-import-loaded-module t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-stylish-on-save t)
 '(package-selected-packages
   '(gruvbox-theme atom-one-dark-theme hakell-interactive-mode haskell-process hindent ox-reveal org-bullets haskell-mode lsp-mode go-mode cargo rust-mode ledger-mode magit auctex web-mode emmet-mode tagedit clojure-mode-extra-font-locking cider clojure-mode rainbow-delimiters paredit company ace-jump-mode projectile smex ido-completing-read+ powerline solarized-theme use-package))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Mono" :foundry "SAJA" :slant normal :weight regular :height 113 :width normal)))))
(put 'upcase-region 'disabled nil)
