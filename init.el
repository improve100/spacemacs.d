;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     yaml
     helm
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/dotfiles/spacemacs.d/snippets/")
     better-defaults
     emacs-lisp
     imenu-list
     ansible
     react
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-revision-show-gravatars nil)
     github
     chrome
     dash
     nginx
     html
     (javascript :variables
                 tern-command '("node" "/Users/twocucao/.nvm/versions/node/v5.12.0/bin/tern")
                 )
     markdown
     shell-scripts
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-bullets-bullet-list '("■" "◆" "▲" "▶")
          org-agenda-dir "~/Writing/org-notes/"
          org-projectile-file "~/Writing/org-notes/todos.org"
          )
     osx
     sql
     (python :variables
             python-shell-completion-native nil
             python-test-runner 'pytest
             python-enable-yapf-format-on-save t)
     ipython-notebook
     restructuredtext
     django
     twocucao
     (chinese :packages youdao-dictionary fcitx
              :variables chinese-enable-fcitx nil
              chinese-enable-youdao-dict t)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(youdao-dictionary
                                      xah-replace-pairs
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                (todos . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
          ("org-cn"   . "http://elpa.zilongshanren.com/org/")
          ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/"))
        )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  (setq create-lockfiles nil)
  (global-set-key (kbd "<backtab>") #'(lambda ()
                                        (interactive)
                                        (switch-to-buffer (other-buffer (current-buffer) 1))))
  (global-set-key (kbd "C-x x") 'call-last-kbd-macro)

  (defun markdown-count-article ()
    "1. 总字数,中字数,英字数,标点符号"
    (interactive)
    (message "Counting …")
    (save-excursion
      (let (wordCount charCount)
        (setq wordCount 0)
        (setq charCount (- (point-max) (point-min) ))
        (goto-char (point-min))
        (while (and (< (point) (point-max))
                    (re-search-forward "\\w+\\W*" (point-max) t))
          (setq wordCount (1+ wordCount)))

        (insert "Words: %d. Chars: %d." wordCount charCount)
        )))
  (defun single-lines-only ()
    "replace multiple blank lines with a single one"
    (interactive)
    (goto-char (point-min))
    (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
      (replace-match "\n")
      (forward-char 1)))
  (defun markdown-pangu-formated (begin end)
     "1.压缩空行
      2.去除尾部空格
      3.替换全角的字母和数字"
     (interactive "r")
     (single-lines-only)
     (delete-trailing-whitespace)
     )

  ;;解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-mac) window-system)
      (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

  ;; Setting Chinese Font
  (when (and (spacemacs/system-is-mswindows) window-system)
    (setq ispell-program-name "aspell")
    (setq w32-pass-alt-to-system nil)
    (setq w32-apps-modifier 'super)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "DejaVu Sans Mono" :size 14))))
  ;; define the refile targets
  (setq org-agenda-file-time-log (expand-file-name "timelog.org" org-agenda-dir))
  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
  ;;(setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
  (setq org-agenda-file-someday (expand-file-name "someday.org" org-agenda-dir))
  (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-files (list org-agenda-dir))

  (setq org-todo-keywords
        (quote ((sequence "TODO(t!)"  "NEXT(n!)" "|" "DONE(d!)")
                (sequence "REPEAT(r)"  "WAIT(w!)"  "|"  "PAUSED(p@/!)" "CANCELLED(c@/!)" )
                (sequence "IDEA(i!)" "MAYBE(y!)" "STAGED(s!)" "WORKING(k!)" "|" "USED(u!/@)")
                )))
  (defun open-time-log()
    (interactive)
    (find-file org-agenda-file-time-log)
    )
  (defun open-note ()
    (interactive)
    (find-file org-agenda-file-note)
    )
  (defun open-gtd ()
    (interactive)
    (find-file org-agenda-file-gtd)
  )
  (defun open-someday ()
    (interactive)
    (find-file org-agenda-file-someday)
    )
  (defun open-journal()
    (interactive)
    (find-file org-agenda-file-journal)
    )
  ;; the %i would copy the selected text into the template
  ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
  ;;add multi-file journal
  (setq org-capture-templates
        '(("t" "Tasks" entry (file+headline org-agenda-file-gtd "Tasks")
            "*** TODO [#B] %?\n  %i\n"
            :empty-lines 1)
          ("h" "Habits" item (file+headline org-agenda-file-gtd "Myself habits")
           "*** TODO [#A] %?\n  %i\n %U"
           :empty-lines 1)
          ("s" "Someday/Maybe" entry (file+headline org-agenda-file-gtd "Someday/Maybe")
           "*** TODO [#A] %? %i Added: %U"
           :empty-lines 1)
          ("f" "Files Tasks" entry (file+headline org-agenda-file-gtd "Files Tasks")
           "*** TODO [#A] %U [[file:%F][%F]]\t%?\t%^G %i\n\t "
           :empty-lines 1)
          ("c" "Calendar" entry (file+headline org-agenda-file-gtd "Calendar")
            "*** TODO [#A] %?\n  %i\n %U"
            :empty-lines 1)
          ("a" "Appointment" entry (file+headline org-agenda-file-gtd "Calendar")
           "* APPT %^{Description} %^g %? Added: %U"
           :empty-lines 1)
          ("l" "Log Time" entry (file+datetree org-agenda-file-time-log "Log Time")
           "** %U - %^{Activity}  :TIME:"
           )
          ("j" "Journal Entry" entry (file+datetree org-agenda-file-journal)
            "* %?"
            :empty-lines 1)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vue-mode flycheck-pos-tip flycheck xah-replace-pairs nginx-mode magit-gh-pulls gmail-message-mode ham-mode html-to-markdown github-search github-clone github-browse-file gist gh marshal logito pcache ht edit-server jinja2-mode ansible-doc ansible yaml-mode ox-reveal ox-gfm ein websocket pony-mode imenu-list dash-at-point counsel-dash helm-dash web-mode web-beautify tagedit sql-indent slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang helm-css-scss haml-mode fish-mode emmet-mode company-web web-completion-data company-tern dash-functional tern company-shell coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic youdao-dictionary names chinese-word-at-point wgrep smex ivy-hydra counsel-projectile counsel swiper ivy pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict pos-tip ace-pinyin pinyinlib ace-jump-mode smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode magit-gitflow launchctl htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete volatile-highlights vi-tilde-fringe spaceline powerline rainbow-delimiters spinner org-bullets neotree lorem-ipsum ido-vertical-mode hydra parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make pkg-info epl helm-flx helm-descbinds helm-ag google-translate flx-ido flx fancy-battery eyebrowse evil-mc evil-lisp-state smartparens evil-indent-plus iedit evil-exchange evil-escape evil-ediff evil-args anzu evil goto-chg undo-tree highlight f s diminish define-word clean-aindent-mode bind-key packed dash ace-jump-helm-line helm avy helm-core popup package-build spacemacs-theme ws-butler window-numbering which-key uuidgen use-package toc-org restart-emacs request quelpa projectile popwin persp-mode pcre2el paradox org-plus-contrib open-junk-file move-text macrostep linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers hide-comnt help-fns+ golden-ratio fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-iedit-state evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump column-enforce-mode bind-map auto-highlight-symbol auto-compile async aggressive-indent adaptive-wrap ace-window ace-link)))
 '(safe-local-variable-values (quote ((encoding . UTF-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete-rst evil-org string-inflection password-generator org-brain impatient-mode flycheck-bashate evil-leader evil-lion editorconfig symon git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl browse-at-remote winum unfill magithub helm-purpose window-purpose fuzzy flymd company-ansible vue-mode flycheck-pos-tip flycheck xah-replace-pairs nginx-mode magit-gh-pulls gmail-message-mode ham-mode html-to-markdown github-search github-clone github-browse-file gist gh marshal logito pcache ht edit-server jinja2-mode ansible-doc ansible yaml-mode ox-reveal ox-gfm ein websocket pony-mode imenu-list dash-at-point counsel-dash helm-dash web-mode web-beautify tagedit sql-indent slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang helm-css-scss haml-mode fish-mode emmet-mode company-web web-completion-data company-tern dash-functional tern company-shell coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic youdao-dictionary names chinese-word-at-point wgrep smex ivy-hydra counsel-projectile counsel swiper ivy pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict pos-tip ace-pinyin pinyinlib ace-jump-mode smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode magit-gitflow launchctl htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete volatile-highlights vi-tilde-fringe spaceline powerline rainbow-delimiters spinner org-bullets neotree lorem-ipsum ido-vertical-mode hydra parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make pkg-info epl helm-flx helm-descbinds helm-ag google-translate flx-ido flx fancy-battery eyebrowse evil-mc evil-lisp-state smartparens evil-indent-plus iedit evil-exchange evil-escape evil-ediff evil-args anzu evil goto-chg undo-tree highlight f s diminish define-word clean-aindent-mode bind-key packed dash ace-jump-helm-line helm avy helm-core popup package-build spacemacs-theme ws-butler window-numbering which-key uuidgen use-package toc-org restart-emacs request quelpa projectile popwin persp-mode pcre2el paradox org-plus-contrib open-junk-file move-text macrostep linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers hide-comnt help-fns+ golden-ratio fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-iedit-state evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump column-enforce-mode bind-map auto-highlight-symbol auto-compile async aggressive-indent adaptive-wrap ace-window ace-link)))
 '(safe-local-variable-values (quote ((encoding . UTF-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
