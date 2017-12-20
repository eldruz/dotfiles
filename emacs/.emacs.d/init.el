;;; PACKAGES PREP

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; END PACKAGES PREP

(add-to-list 'load-path "~/src/org-mode/lisp")
(add-to-list 'load-path "~/src/org-mode/contrib/lisp" t)

(org-babel-load-file (expand-file-name "~/.emacs.d/init-config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-tempo org-w3m)))
 '(package-selected-packages
   (quote
    (pdf-tools oauth2 org-gcal evil-smartparens smartparens spacemacs-theme zenburn-theme magit evil-org evil auto-complete expand-region yasnippet flycheck powerline solarized-theme try xterm-color which-key volatile-highlights vmd-mode vi-tilde-fringe use-package toml-mode toc-org smeargle shell-pop rainbow-delimiters racer pcre2el ox-twbs ox-reveal ox-gfm orgit org-projectile org-present org-pomodoro org-download org-bullets multi-term mmm-mode markdown-toc magit-gitflow macrostep linum-relative indent-guide hydra htmlize highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-elm fill-column-indicator exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help elm-mode elisp-slime-nav diminish diff-hl csv-mode company-statistics company-quickhelp column-enforce-mode cargo auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile adaptive-wrap ace-window ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
