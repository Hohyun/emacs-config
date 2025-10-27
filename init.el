;;; init.el  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;; This file compiles and executes config.org
;;
;;; Code:

(defun reload-config ()
  "Reolad the literate config from ~/.emacs.d/config.org"
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(reload-config)
(provide 'init)

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("01be51d3a575f5f565aca6485b135e39ad5662d071326bc38855154fd062fc32"
     "cfc1e49eec0d57e2f70ef3a6db3b543bbb2edcf16a9f164231afcc4d1263f9fb"
     "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd"
     "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98"
     default))
 '(haskell-process-auto-import-loaded-module t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-stylish-on-save t)
 '(package-selected-packages
   '(ace-jump-mode atom-one-dark-theme auctex cargo cider
		   clojure-mode-extra-font-locking company copilot
		   corfu ctrlf editorconfig-generate embark-consult
		   embark-vc emmet-mode go-mode gruvbox-theme
		   haskell-mode hindent ido-completing-read+
		   ledger-mode lsp-mode marginalia modus-themes
		   orderless org-bullets ox-reveal paredit powerline
		   prescient projectile pulsar rainbow-delimiters
		   rust-mode show-font smex solarized-theme
		   standard-themes tagedit tree-sitter-langs vertico
		   web-mode yasnippet))
 '(package-vc-selected-packages
   '((copilot :url "https://github.com/copilot-emacs/copilot.el" :branch
	      "main")))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
