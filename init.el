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
     vimscript
     ruby
     sql
     go
     swift
     themes-megapack
     html
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     osx
     helm
     auto-completion
     better-defaults
     (command-log
      :variables
      clm/logging-dir "~/.emacs.d/.cache/command-log-"
      command-log-mode-window-font-size -1)
     csv
     docker
     python
     emacs-lisp
     (git :variables
          git-magit-status-fullscreen t)
     github
     ;; ivy
     markdown
     pandoc
     ;; org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     slack
     systemd
     ;; spell-checking
     terraform
     syntax-checking
     ;; version-control
     (version-control :variables
                      version-control-diff-side 'left)
     ;; (version-control :variables
     ;;                   version-control-diff-tool 'diff-hl)
     xkcd
     yaml
     ;; https://github.com/syl20bnr/spacemacs/issues/8789
     (chrome :variables chrome-exec-path "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
     ;; ess
     autohotkey
     search-engine
     private-tokens
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(osx-browse ssh-config-mode sx gitter visual-fill-column company-terraform noflet kubernetes kubernetes-evil kubernetes-tramp)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(ac-ispell)
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
                                (projects . 7))
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
                               :size 13
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
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
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
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
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
   dotspacemacs-persistent-server t
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
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; comment this out because it breaks import stuff
  ;; (setq gnutls-verify-error t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; vim basics: https://blog.interlinked.org/tutorials/vim_tutorial.html
  ;; https://gitter.im/syl20bnr/spacemacs?at=58f29c918bb56c2d11af8338
  ;; (evil-set-initial-state 'magit-status-mode 'emacs)
  (with-eval-after-load 'evil-states
    ;; Make Term buffers start in Emacs state.
    ;; (setq evil-insert-state-modes (delq 'term-mode evil-insert-state-modes))
    ;; (add-to-list 'evil-emacs-state-modes 'term-mode)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'sx-question-list-mode 'emacs)
    (evil-set-initial-state 'sx-question-mode 'emacs)
    (evil-set-initial-state 'sx-inbox-mode 'emacs)
    )
  (with-eval-after-load 'multi-term
    (add-to-list 'term-bind-key-alist '("C-c z" . term-stop-subjob))
    (add-to-list 'term-bind-key-alist '("<escape>" . term-send-esc)))

  ;; (setq evil-escape-excluded-major-modes '(term-mode ansi-term ansi-term-mode))
  (setq split-height-threshold nil
        split-width-threshold  0)

                                        ;(global-command-log-mode 1)

  ;; [[file:~/.emacs.d/elpa/evil-lisp-state-20160403.1948/evil-lisp-state.el::("C-r"%20.%20undo-tree-redo)]]
  ;; (global-undo-tree-mode -1)     ; keep commented: don't be afraid of undo-tree
  (define-key evil-normal-state-map ";" 'evil-search-forward)
  (define-key evil-normal-state-map "U" 'undo-tree-redo)
  (define-key evil-normal-state-map "\C-r" 'isearch-backward-regexp)
  (define-key evil-lisp-state-map "\C-r" 'isearch-backward-regexp)
  (define-key evil-lisp-state-major-mode-map "\C-r" 'isearch-backward-regexp)

  (define-key evil-normal-state-map "\C-p" 'previous-line)
  (define-key evil-normal-state-map "\C-n" 'next-line)

  (use-package sx
    :config
    (spacemacs/set-leader-keys
      "sx" 'sx-search))

  (bind-keys
   ("C-s-0"   . spacemacs/delete-window)
   ("C-s-1"   . spacemacs/toggle-maximize-buffer)
   ("C-s-2"   . split-window-below)
   ("C-s-3"   . split-window-right)
   ("C-<tab>" . other-window)
   ("H-b"     . helm-buffers-list)
   ("C-x C-b" . helm-buffers-list)
   ("C-'"     . avy-goto-word-1)
   ("C-;"     . avy-goto-char))

  ;; (setq-default mac-command-modifier 'alt)   ;; Command-x or Command-m inserts, respectively: × µ
  ;; (setq-default mac-command-modifier 'super) ;; Control-Command-f produces a mysterious keycode: <C-s-268632078>
  ;; (setq-default mac-command-modifier 'hyper) ;; seems to avoid both types of the above problems

  ;; https://www.emacswiki.org/emacs/MetaKeyProblems#toc15
  ;;
  ;; For some reason under leopard (Mac OS-X 10.0 and higher),
  ;; internationalization may be turned on. This will result in insertion of a
  ;; non-ASCII character in the native EmacsForMacOS when you use the Meta key.
  ;; For example, you may see a “phi” when you type M-X, instead of the behavior
  ;; you want (this is discussed in 26.13 Coding Systems for Terminal I/O in
  ;; version 23). To disable this emacs-unfriendly behavior, enter the line
                                        ;(set-keyboard-coding-system nil)

  ;;(setq-default mac-command-modifier 'hyper)


  (bind-keys ("C-x C-g" . git-gutter:toggle)
             ("C-x v =" . git-gutter:popup-hunk)
             ;; ("C-x p"   . git-gutter:previous-hunk)
             ;; ("C-x n"   . git-gutter:next-hunk)
             ("H-p"     . git-gutter:previous-hunk)
             ("H-n"     . git-gutter:next-hunk)
             ([C-s-268632080]   . git-gutter:previous-hunk) ; C-A-p
             ([C-s-268632078]   . git-gutter:next-hunk-diff)     ; C-A-n
             ("C-H-p"   . git-gutter:previous-hunk) ; C-A-p
             ("C-H-n"   . git-gutter:next-hunk-diff)     ; C-A-n
             ("C-H-c"   . stage-or-commit)
             ("C-x v s" . git-gutter:stage-hunk)
             ("C-x v r" . git-gutter:revert-hunk)
             ("C-H-r"   . git-gutter:revert-hunk))

  (use-package git-gutter
    :ensure t
    :diminish git-gutter-mode
    :commands (stage-or-commit)
    :bind (("C-x C-g" . git-gutter:toggle)
           ("C-x v =" . git-gutter:popup-hunk)
           ;; ("C-x p"   . git-gutter:previous-hunk)
           ;; ("C-x n"   . git-gutter:next-hunk)
           ("A-p"     . git-gutter:previous-hunk)
           ("A-n"     . git-gutter:next-hunk)
           ("C-A-p"   . git-gutter:previous-hunk)
           ("C-A-n"   . git-gutter:next-hunk-diff)
           ([C-s-268632067]   . stage-or-commit)
           ("C-A-c"   . stage-or-commit)
           ("C-x v s" . git-gutter:stage-hunk)
           ("C-x v r" . git-gutter:revert-hunk)
           ("C-A-r"   . git-gutter:revert-hunk))
    :init (global-git-gutter-mode +1)
    :config
    (progn
      (defun git-gutter:diff-hunk ()
        "Popup diff of current hunk."
        (interactive)
        (git-gutter:awhen (git-gutter:search-here git-gutter:diffinfos)
          (git-gutter:popup-hunk it)
          (git-gutter:popup-buffer-window)))


      (defun git-gutter:next-hunk-diff (&optional arg)
        (interactive "p")
        (git-gutter:next-hunk arg)
        (recenter nil)
        (git-gutter:diff-hunk))


      (defun stage-or-commit (&optional arg)
        (interactive "p")
        (if (ignore-errors (git-gutter:search-here-diffinfo git-gutter:diffinfos))
            (git-gutter:stage-hunk)
          (progn
            (save-excursion
              (magit-diff-staged)
              (magit-commit))))
        (when (functionp 'magit-update-status-on-save)
          (magit-update-status-on-save)))

      (use-package noflet
        :ensure t)
      ;; override y/n question-asking
      (defadvice git-gutter:stage-hunk (around quick-stage activate)
        (noflet ((yes-or-no-p (&rest args) t))
          ad-do-it))
      ))

  (use-package bind-key
    :ensure t)

  (use-package neotree
    :config
    (progn
      (bind-keys :map neotree-mode-map
                 (";" . neotree-quick-look))
      (setq neo-show-hidden-files nil)
      (add-to-list 'neo-hidden-regexp-list "^\\.git")
      ))

  (bind-key "C-s-\"" 'menu-bar-open)

  (defun dired-timesort (filename &optional wildcards)
    (let ((dired-listing-switches "-lhat"))
      (dired filename wildcards)))

  (defmacro quick-find (key file &optional path find-args)
    `(bind-key
      ,key
      (cond
       ((stringp ,find-args)
        '(lambda (&optional arg)
           (interactive)
           (find-dired (expand-file-name ,file ,path) ,find-args)))
       ((and
         ;; (not (tramp-tramp-file-p (expand-file-name ,file ,path)))
         (or (file-directory-p (expand-file-name ,file ,path))
             (not (file-exists-p (expand-file-name ,file ,path)))))
        '(lambda (&optional arg)
           (interactive)
           (dired-timesort (expand-file-name ,file ,path))))
       (t
        '(lambda (&optional arg)
           (interactive)
           (find-file (expand-file-name ,file ,path)))))))

    ;;; Files
  (quick-find "C-h C-`"     "~/")
  (quick-find "C-h C-t"     "/tmp/")
  ;; (quick-find "C-h C-e"     "/sudo::/etc/")
  (quick-find "C-h C-x C-o" "~/org")
  (quick-find "C-h C-o"     "~/Documents")
  (quick-find "C-h C-d"     "~/Downloads")
  (quick-find "C-h C-i"     user-init-file)
  ;; (quick-find "C-h C-x C-u" custom-file)
  ;; (quick-find "C-h C-x C-k" user-keys-file)
  ;; (quick-find "C-h C-x C-c" "Cask" user-emacs-directory)
  (quick-find "C-h C-x C-e" (format ".cask/%s/elpa/" emacs-version) user-emacs-directory)
  (quick-find "C-h C-x e"   "emacs" "~/work")
  (quick-find "C-h C-x C-q" "quick-find.el" user-emacs-directory)
  (quick-find "C-h C-x C-w" "~/work")
  (quick-find "C-h C-x p"   "~/Pictures")
  (quick-find "C-h C-x C-s" "~/.ssh/config")
  (quick-find "C-h C-x C-b" "~/.bash_profile")
  ;; (quick-find "C-h C-x C-b" (crux-find-shell-init-file))
  (quick-find "C-h C-x C-s" "~/.ssh/config")
  ;; (quick-find "C-h C-x C-h" "/sudo::/etc/hosts")
  (quick-find "C-h C-x s" "settings.el" user-emacs-directory)

  ;; investigate: https://github.com/rolandwalker/osx-browse
  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "open")

  ;; https://github.com/mola-T/flymd/blob/master/browser.md#chrome-macos
  (defun my-flymd-browser-function (url)
    (let ((process-environment (browse-url-process-environment)))
      (apply 'start-process
             (concat "google-chrome " url) nil
             "/usr/bin/open"
             (list "google-chrome" "--new-window" "--allow-file-access-from-files" url))))
  (setq flymd-browser-open-function 'my-flymd-browser-function)

  (defun my-flymd-browser-function (url)
    (let ((process-environment (browse-url-process-environment)))
      (apply 'start-process
             (concat "firefox " url)
             nil
             "/usr/bin/open"
             (list "-a" "firefox" url))))
  (setq flymd-browser-open-function 'my-flymd-browser-function)

  (osx-browse-mode 1)

  (use-package magit-gh-pulls
    :init
    (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
    :config
    (magit-define-popup-action 'magit-gh-pulls-popup
      ?# "Reload" 'magit-gh-pulls-reload))

  ;;;;
  ;; Some useful links for enabling ~/.authinfo.gpg
  ;;
  ;; https://github.com/kensanata/ggg
  ;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
  ;; https://www.emacswiki.org/emacs/GnusAuthinfo
  ;; https://developer.gitter.im/docs/rest-api
  ;; http://prodissues.com/2016/02/emacs-gpg-for-dummies.html
  ;; https://github.com/aartamonau/authinfo
  ;; https://www.gnu.org/software/emacs/manual/html_node/auth/Secret-Service-API.html
  ;; https://www.gnu.org/software/emacs/manual/html_mono/auth.html
  ;;
  ;; Issue about storing gitter-token securely:
  ;; https://github.com/xuchunyang/gitter.el/issues/5
  ;; (setq gitter-token "")

  ;; https://emacs.stackexchange.com/a/35953/2138
  ;; How can I retrieve an HTTPS URL on Mac OS X without warnings about an untrusted authority?
  (add-to-list 'gnutls-trustfiles "/private/etc/ssl/cert.pem")

  (use-package kubernetes
    :config
    (progn
      (spacemacs/set-leader-keys
        "gk"  'kubernetes-overview)))

  (use-package kubernetes-evil
    :config
    (progn
      (evil-define-key 'motion kubernetes-mode-map
        (kbd "k")   #'magit-section-backward
        (kbd "j")   #'magit-section-forward)

      (evil-define-key 'motion kubernetes-logs-mode-map
        (kbd "j") #'kubernetes-logs-forward-line
        (kbd "k") #'kubernetes-logs-previous-line)

      (evil-define-key 'motion kubernetes-log-line-mode-map
        (kbd "j") #'kubernetes-logs-forward-line
        (kbd "k") #'kubernetes-logs-previous-line)))

  (use-package dired-jump
    :bind (("C-A-j"           . dired-jump)
           ("<C-s-268632074>" . dired-jump)
           ("s-k"             . kill-buffer-and-window)
           ("C-A-k"           . spacemacs/kill-this-buffer)
           ("<C-s-268632075>" . spacemacs/kill-this-buffer)))

  (use-package magit
    :init
    (progn
      (global-git-commit-mode t)
      (setq magit-repository-directories '("~/work/")))

    :config
    (progn
      (bind-keys :map magit-diff-mode-map
                 ([C-tab] . other-window))
      (bind-keys :map magit-log-mode-map
                 ([C-tab] . other-window))
      (bind-keys :map magit-status-mode-map
                 ([C-tab] . other-window))))

  (use-package org
    :config
    (bind-keys :map org-mode-map
               ([C-tab] . other-window)))

  ;; (use-package dired
  ;;   :config
  ;;   (bind-keys :map dired-mode-map
  ;;              ("R" . dired-do-rename)))

  )

  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (gscholar-bibtex helm-google less-css-mode treepy let-alist graphql jinja2-mode company-ansible ansible-doc ansible vimrc-mode dactyl-mode org-plus-contrib kubernetes-tramp kubernetes kubernetes-evil rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby zenburn-theme zen-and-art-theme yapfify web-mode underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slim-mode seti-theme scss-mode sass-mode reverse-theme railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme browse-url-dwim string-utils list-utils organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme live-py-mode light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme hy-mode heroku-theme hemisu-theme helm-pydoc helm-css-scss hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme ghub undo-tree espresso-theme emmet-mode dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme anaconda-mode pythonic ample-zen-theme ample-theme alect-themes afternoon-theme company-terraform terraform-mode hcl-mode academic-phrases edbi-minor-mode exsqlaim-mode format-sql helm-sql-connect ob-sql-mode sqlup-mode edbi-sqlite emacsql-sqlite esqlite esqlite-helm bug-reference-github github-elpa github-modern-theme github-pullrequest github-stars github-theme gitignore-templates helm-open-github vmd-mode yagist browse-at-remote copy-as-format git-commit-insert-issue github-issues github-notifier helm-github-stars md-readme org-sync org2issue magithub docker-compose-mode white-sand-theme rebecca-theme orgit exotica-theme visual-fill-column gitter sx sql-indent go-guru go-eldoc company-go go-mode ssh-config-mode insert-shebang fish-mode company-shell osx-browse engine-mode ahk-mode pandoc-mode ox-pandoc ess-smart-equals ess-R-data-view ctable ess julia-mode swift-mode web-beautify livid-mode skewer-mode simple-httpd js2-refactor multiple-cursors js2-mode js-doc gmail-message-mode ham-mode html-to-markdown flymd flycheck-pos-tip pos-tip flycheck edit-server company-web web-completion-data company-tern dash-functional tern company-anaconda coffee-mode magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl noflet git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl wgrep smex ivy-hydra counsel-projectile counsel swiper ivy yaml-mode xkcd command-log-mode systemd slack emojify circe oauth2 websocket ht dockerfile-mode docker json-mode tablist docker-tramp json-snatcher json-reformat csv-mode unfill mwim helm-company helm-c-yasnippet fuzzy company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete xterm-color smeargle shell-pop org-projectile org-present org-pomodoro alert log4e gntp org-download multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-automatically-star t)
 '(send-mail-function (quote mailclient-send-it)))

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
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl noflet git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl wgrep smex ivy-hydra counsel-projectile counsel swiper ivy yaml-mode xkcd command-log-mode systemd slack emojify circe oauth2 websocket ht dockerfile-mode docker json-mode tablist docker-tramp json-snatcher json-reformat csv-mode unfill mwim helm-company helm-c-yasnippet fuzzy company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete xterm-color smeargle shell-pop orgit org-projectile org-present org-pomodoro alert log4e gntp org-download multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
