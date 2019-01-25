

(setq package-enable-at-startup nil)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto
						       "://melpa.org/packages/"))
	       t)
  (add-to-list 'package-archives (cons "org"  (concat proto
						      "://orgmode.org/elpa/"))
	       t)

  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))
;;;

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-file-name "/home/michael/.emacs.d/.abbrev_defs")
 '(aggressive-indent-comments-too nil)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(auto-revert-verbose nil)
 '(beacon-color "#cc6666")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(dashboard-startup-banner (quote logo) t)
 '(fci-rule-color "#eee8d5")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-display-errors-delay 0.3)
 '(flycheck-pylintrc "~/.pylintrc")
 '(flycheck-python-pylint-executable "/usr/bin/pylint")
 '(flycheck-stylelintrc "~/.stylelintrc.json")
 '(flyspell-abbrev-p t)
 '(flyspell-correct-interface (quote flyspell-correct-ivy) t)
 '(flyspell-issue-message-flag nil)
 '(flyspell-issue-welcome-flag nil)
 '(flyspell-mode 1 t)
 '(frame-background-mode (quote dark))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(history-delete-duplicates t)
 '(history-length t)
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")
     ("???" . "#dc752f"))))
 '(ispell-silently-savep t)
 '(ivy-count-format "(%d/%d) ")
 '(ivy-use-virtual-buffers t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-archive-location "~/.personal/archives/%s::")
 '(org-blank-before-new-entry (quote ((heading . t) (plain-list-item . t))))
 '(org-cycle-include-plain-lists (quote integrate))
 '(org-ditaa-jar-path "~/.local/lib/ditaa0_9.jar" t)
 '(org-expiry-inactive-timestamps t t)
 '(org-export-backends
   (quote
    (ascii beamer html icalendar latex man md org texinfo)))
 '(org-log-done (quote time))
 '(org-log-into-drawer "LOGBOOK")
 '(org-modules
   (quote
    (org-crypt org-habit org-info org-irc org-mouse org-protocol)))
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 6))))
 '(org-refile-use-cache nil)
 '(org-refile-use-outline-path nil)
 '(org-startup-folded nil)
 '(org-startup-with-inline-images t)
 '(org-tag-alist
   (quote
    (("@coding" . 99)
     ("@computer" . 108)
     ("@errands" . 101)
     ("@home" . 104)
     ("@phone" . 112)
     ("@reading" . 114)
     ("@school" . 115)
     ("@work" . 98)
     ("@writing" . 119)
     ("crypt" . 67)
     ("fuzzy" . 48)
     ("highenergy" . 49))))
 '(org-tags-exclude-from-inheritance (quote ("crypt" "project")))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "STARTED(s)" "WAITING(w@/!)" "SOMEDAY(.)" "|" "DONE(x!)" "CANCELLED(c@)")
     (sequence "TOBUY" "TOSHRINK" "TOCUT" "TOSEW" "|" "DONE(x)"))))
 '(org-use-effective-time t)
 '(org-use-speed-commands (quote my/org-use-speed-commands-for-headings-and-lists))
 '(org-yank-adjusted-subtrees t)
 '(package-selected-packages
   (quote
    (toc-org org-plus-contrib react-snippets ivy-yasnippet yasnippet-snippets yasnippet hungry-delete git-timemachine git-gutter magit git-commit projectile ivy-rich ivy-pass counsel pdf-tools imgbb webpaste smartparens lorem-ipsum flycheck web-mode move-text aggressive-indent flyspell-correct-ivy neotree solarized-theme color-theme-sanityinc-tomorrow dracula-theme winum evil exwm symon-mode symon dmenu diminish spaceline company dashboard rainbow-delimiters sudo-edit switch-window rainbow-mode avy smex ido-vertical-mode org-bullets beacon spacemacs-theme which-key use-package)))
 '(pdf-view-display-size (quote fit-page))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(pdf-view-resize-factor 1.1)
 '(pdf-view-use-unicode-ligther nil)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(projectile-cache-file "/home/michael/.emacs.d/.projectile-cache")
 '(projectile-completion-system (quote ivy))
 '(projectile-enable-caching t)
 '(projectile-known-projects-file "/home/michael/.emacs.d/.projectile-bookmarks")
 '(projectile-mode-line (quote (:eval (projectile-project-name))) t)
 '(savehist-additional-variables (quote (kill-ring search-ring regexp-search-ring)))
 '(savehist-file "/home/michael/.emacs.d/history")
 '(savehist-save-minibuffer-history 1)
 '(set-mark-command-repeat-pop t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(undo-tree-visualizer-diff t)
 '(undo-tree-visualizer-timestamps t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c8805d801780")
     (60 . "#bec073400bc0")
     (80 . "#b58900")
     (100 . "#a5008e550000")
     (120 . "#9d0091000000")
     (140 . "#950093aa0000")
     (160 . "#8d0096550000")
     (180 . "#859900")
     (200 . "#66aa9baa32aa")
     (220 . "#57809d004c00")
     (240 . "#48559e556555")
     (260 . "#392a9faa7eaa")
     (280 . "#2aa198")
     (300 . "#28669833af33")
     (320 . "#279993ccbacc")
     (340 . "#26cc8f66c666")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-attr-indent-offset 2 t)
 '(web-mode-block-padding 2 t)
 '(web-mode-code-indent-offset 2 t)
 '(web-mode-comment-style 2 t)
 '(web-mode-css-indent-offset 2 t)
 '(web-mode-enable-current-element-highlight t t)
 '(web-mode-markup-indent-offset 2 t)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "GOOG" :family "Noto Sans")))))


(setq initial-frame-alist
  (cons
   '(background-color . "#020002")
   initial-frame-alist))

(setq initial-frame-alist
  (cons
   '(left-fringe . 0)
   initial-frame-alist))

(setq initial-frame-alist
  (cons
   '(right-fringe . 0)
  initial-frame-alist))
