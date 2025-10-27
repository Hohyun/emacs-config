;; lexical-binding: t;
;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; inihibit cl warning
(setq byte-compile-warnings '(cl-functions))

(setq default-directory "~")
(setq inhibit-splash-screen t) 
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode 0)
(global-visual-line-mode)

;; No need for ~ files when editing
(setq create-lockfiles nil)
(setq backup-inhibited t)

(global-set-key [(shift space)] 'toggle-input-method)
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(setq default-korean-keyboard "3f")

(defun my-font-setup ()
  "Setup English font and harmoning Korean font"
  (add-to-list 'default-frame-alist '(font . "Aporetic Sans Mono-11"))
  (set-face-font 'default "Aporetic Sans Mono-11")
  ;; (add-to-list 'default-frame-alist '(font . "Aporetic Serif Mono-11"))
  ;; (set-face-font 'default "Aporetic Serif Mono-11")
  ;; (add-to-list 'default-frame-alist '(font . "Cascadia Code Light-11"))
  ;; (set-face-font 'default "Cascadia Code Light-11")
  ;(add-to-list 'default-frame-alist '(font . "Fira Code-10"))
  ;(set-face-font 'default "Fira Code-10")
  ;(add-to-list 'default-frame-alist '(font . "Monaco-10"))
  ;(set-face-font 'default "Monaco-10")
  (set-fontset-font "fontset-default" '(#x1100 . #xffdc)
                    '("HCR Dotum" . "iso10646-1"))
  (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
                    '("HCR Dotum" . "iso10646-1"))
  (setq face-font-rescale-alist '((".*HCR.*" . 1.1))))

(my-font-setup)
(add-hook 'sever-switch-hook (my-font-setup))

;; (load-theme 'gruvbox t)

(use-package standard-themes
  :ensure t
  :bind
  (("<f5>" . standard-themes-rotate)
   ("C-<f5>" . standard-themes-select)
   ("M-<f5>" . standard-themes-load-random))
  :config
  ;; (setq standard-themes-mixed-fonts t)
  ;; (setq standard-themes-italic-constructs t)
  (standard-themes-select 'standard-light)
)

(use-package powerline
  :init
  (setq powerline-default-separator 'wave)
  :config
  (powerline-center-theme))

(add-to-list 'load-path "~/.emacs.d/lisp")
;(load "~/.emacs.d/lisp/my-abbrev.el")
;(require 'diatheke)

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("melpa". "http://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Use builtin completion engine
(bind-key* "C-." #'completion-at-point)

; The `vertico' package applies a vertical layout to the minibuffer.
;; It also pops up the minibuffer eagerly so we can see the available
;; options without further interactions.  This package is very fast
;; and "just works", though it also is highly customisable in case we
;; need to modify its behaviour.
(use-package vertico
  :custom
  (vertico-count 22)
  (vertico-cycle t)
  :init
  (vertico-mode))

;; The built-in `savehist-mode' saves minibuffer histories.  Vertico
;; can then use that information to put recently selected options at
;; the top.
(savehist-mode 1)

;; The `marginalia' package provides helpful annotations next to
;; completion candidates in the minibuffer.  The information on
;; display depends on the type of content.  If it is about files, it
;; shows file permissions and the last modified date.  If it is a
;; buffer, it shows the buffer's size, major mode, and the like.
(use-package marginalia
  :config (marginalia-mode))

;; The `orderless' package lets the minibuffer use an out-of-order
;; pattern matching algorithm.  It matches space-separated words or
;; regular expressions in any order.
(use-package orderless
  :custom (completion-styles '(orderless basic)))

;; Corfu enhances in-buffer completion with a small completion popup. The
;; current candidates are shown in a popup below or above the point, and
;; can be selected by moving up and down. Corfu is the minimalistic
;;in-buffer completion counterpart of the Vertico minibuffer UI.
(use-package corfu
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  (tab-always-indent 'complete))

;; The `consult' package provides lots of commands that are enhanced
;; variants of basic, built-in functionality.  One of the headline
;; features of `consult' is its preview facility, where it shows in
;; another Emacs window the context of what is currently matched in
;; the minibuffer.
(use-package consult
  :bind (("C-c i"     . consult-imenu)
         ("C-c b"     . consult-project-buffer)
         ("C-x b"     . consult-buffer)
         ("C-c B"     . consult-bookmark)
         ("C-c y"     . consult-yank-pop)
         ("C-x C-f"   . find-file)
         ("C-c C-h a" . describe-symbol)
         ("M-s M-g"   . consult-ripgrep)
         ("M-s M-f"   . consult-find)
         ("M-s M-o"   . consult-outline)
         ("M-s M-l"   . consult-line)))

;; The `embark-consult' package is glue code to tie together `embark'
;; and `consult'.
(use-package embark-consult
  :ensure t
  :after (embark consult))

;; The `embark' package lets you target the thing or context at point
;; and select an action to perform on it.  Use the `embark-act'
;; command while over something to find relevant commands.
(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         :map minibuffer-local-map
         ("C-c C-c" . embark-collect)
         ("C-c C-e" . embark-export)))

(use-package projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-global-mode)

;;CTRLF (pronounced "control F") is an intuitive and efficient
;;solution for single-buffer text search
(use-package ctrlf
 :config (ctrlf-mode))

;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Temporarily highlights the current line after given function is invoked.
(use-package pulsar
  :ensure t
  :init
  (pulsar-global-mode 1))

;; git integration
(use-package magit
  :pin melpa-stable
  :bind ("C-x g" . magit-status))

(use-package org-bullets)

(use-package org
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-iswitchb))
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  (setq org-log-done t)
  (setq org-directory "~/org")
  (setq org-agenda-files 
        (list "~/org/work.org"
              "~/org/home.org"
              "~/org/faith.org"))
  (setq org-default-notes-file "~/org/taskdiary.org")

  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-edit-src-content-indentation 0)

  (setq org-capture-templates
    '(("a" "Appointment" entry (file+headling "~/org/taskdiary.org" "Calendar")
       "* APPT %^{Description} %^g
       %?
       Added: %U")
      ("n" "Notes" entry (file+datetree "~/org/taskdiary.org")
       "* %^{Description} %^g 
       %?
       Added: %U")
      ("t" "Tast Diary" entry (file+datetree "~/org/taskdiary.org")
       "* TODO %^{Description} %^g 
       %?
       Added: %U")
      ("j" "Journal" entry (file+datetree "~/org/journal.org")
       "** %^{Heading}")
      ("l" "Log Time" entry (file+datetree "~/org/timelog.org")
       "** %U - %^{Activity} :TIME:")))

  (defun +org/opened-buffer-files ()
    "Return the list of files currently opened in emacs"
    (delq nil
          (mapcar (lambda (x)
                    (if (and (buffer-file-name x)
                             (string-match "\\.org$"
                                           (buffer-file-name x)))
                        (buffer-file-name x)))
                    (buffer-list))))

  (setq org-refile-targets '((+org/opened-buffer-files :maxlevel . 9)))
  (setq org-refile-use-outline-path 'file)
    
  ;; makes org-refile outline working with helm/ivy
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  :config
    ;;(use-package org-bullets)
)

(use-package org-roam
  :hook
  (after-intit . org-roam-mode)
  :custom
  (find-file-visit-truname t)
  (org-roam-db-autosync-mode)
  (org-roam-directory "~/org-roam/")
  (org-roam-completion-everywhere t)
  (org-roam-completion-system 'default)
  (org-roam-capture-templates
   '(("d" default plain
      "%?"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(use-package ledger-mode
  :defer t
  :mode ("\\.ledger$" "\\.dat$"))

(use-package tex
  :ensure auctex
  :init
  (add-hook 'LaTeX-mode-hook #'diatheke-mode)
  (setq-default TeX-engine 'xetex)
  (setq TeX-PDF-mode t)
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method '((pdf . synctex)))
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  ;(setq TeXV-view-program-list
  ;     '(("PDF Viewer" "C:/Users/jinair/AppData/Local/SumatraPDF/SumatraPdf.exe mode-io-correlate -forward-search %b %n %o")))
  (eval-after-load "tex"
    '(add-to-list 'TeX-expand-list '("%a" (lambda nil (expand-file-name (buffer-file-name))))))
  (setq TeXV-view-program-list
       '(("PDF Viewer" ("okular --unique %o" (mode-io-correlate "#src:%n%a")))))
  (setenv "PATH" (concat "/Library/TeX/texbin" ":" (getenv "PATH")))

  (add-hook 'LaTeX-mode-hook
            (lambda()
              (add-to-list 'TeX-command-list
                           '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "XeLaTeX")
              (setq TeX-save-query nil)
              (setq TeX-show-compilation t)))

  (add-hook 'LaTeX-mode-hook #'diatheke-mode))

(use-package tree-sitter
  :config (global-tree-sitter-mode)
  :after (tree-sitter-hl-mode))
  
(use-package tree-sitter-langs)

(use-package paredit
  :commands enable-paredit-mode
  :init
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
(add-hook 'ielm-mode-hook 'eldoc-mode)

(use-package hindent
  :hook
  (haskell-mode . hindent-mode))

(use-package haskell-mode
  :init
  (custom-set-variables
   '(haskell-stylish-on-save t)
   '(haskell-process-suggest-remove-import-lines t)
   '(haskell-process-auto-import-loaded-module t)
   '(haskell-process-log t)
   '(haskell-process-type 'stack-ghci))

  (add-hook 'haskell-mode-hook  
            (lambda ()
              (set (make-local-variable 'company-backends)
                   (append '((company-capf company-dabbrev-code))
                           company-backends))))
  :hook
  (haskell-mode . haskell-auto-insert-module-template)
  (haskell-mode . haskell-collapse-mode)

  :bind
  (("C-`" . haskell-interactive-bring)
   ("C-c C-l" . haskell-process-load-or-reload)
   ("C-c C-c" . haskell-process-cabal-build)
   ("C-c c" . haskell-process-cabal)))

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main")
  :hook
  (prog-mode . copilot-mode))

(use-package yasnippet
  :defer 15 ;; takes a while to load, so do it async
  :diminish yas-minor-mode
  :config (yas-global-mode)
  :custom (yas-prompt-functions '(yas-completing-prompt)))

(use-package show-font
  :bind
  (("C-c s f" . show-font-select-preview)
   ("C-c s t" . show-font-tabulated)))
