
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "D:/obsidian/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("org-cn". "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))





;;; roam v2 configuration
(setq org-roam-directory "D:/obsidian/roam-notes")

(after! org (setq org-capture-templates nil))


(after! org (add-to-list 'org-capture-templates
                         '("t" "Task To Do!" entry
                           (file+headline "D:/obsidian/task.org" "GTD")
                           "* TODO %^{Task Name:}\n%u\n%a\n" :clock-in t :clock-resume t)))
(after! org (add-to-list 'org-capture-templates
                         '("r" "Book Reading Task" entry
                           (file+headline "D:/obsidian/task.org" "Reading")
                           "* TODO %^{Book Name:}\n%u\n%a\n" :clock-in t :clock-resume t)))
(after! org (add-to-list 'org-capture-templates
                         '("j" "Journal!!!" entry
                           (file+o
                            lp+datetree "D:/obsidian/journal.org")
                           "* %U - %^{heading} %^g\n %?\n")))
(after! org (add-to-list 'org-capture-templates
                         '("n" "Notes!!!" entry
                           (file+headline "D:/obsidian/notes.org" "NOTES")
                           "* %^{heading} %t %^g\n %?\n")))
(after! org (add-to-list 'org-capture-templates
                         '("d" "difficulties!!!" entry
                           (file+headline "D:/obsidian/notes.org" "难题")
                           "* %a %?\n")))



  (setq fonts '("Consolas" "仿宋"))
  (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 34))

(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :family (car (cdr fonts))))))

(setq confirm-kill-emacs nil)
;;
;; (progn
;;   (switch-to-buffer
;;     (url-retrieve-synchronously
;;       "https://github.com/tumashu/cnfonts/blob/master/cnfonts.el"))
;;   (package-install-from-buffer  (package-buffer-info) 'single))



;; (require 'cnfonts)
;; (cnfonts-mode 1)
;; (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
;; (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)


;; (add-to-list 'after-make-frame-functions
;; 	     (lambda (new-frame)
;; 	       (select-frame new-frame)
;; 		;; English Font
;; 		(set-face-attribute 'default nil :font "Fira Mono 32")
;; 		;; Chinese Font
;; 		(dolist (charset '(kana han symbol cjk-misc bopomofo))
;; 		  (set-fontset-font (frame-parameter nil 'font)
;; 		         charset (font-spec :family "微软雅黑" :size 34)))))
;; (set-face-attribute
;;   'default nil :font "思源黑体" 34")
