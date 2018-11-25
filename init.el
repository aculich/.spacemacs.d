;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
     ;; themes-megapack
     html
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; osx
     (osx :variables
          ;; osx-command-as       'hyper
          osx-command-as       'super
          osx-option-as        'meta
          osx-control-as       'control
          osx-function-as      nil
          osx-right-command-as 'left
          osx-right-option-as  'left
          osx-right-control-as 'left)
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
          git-magit-status-fullscreen nil)
     github
     ;; ivy
     markdown
     restructuredtext
     pandoc
     multiple-cursors
     neotree
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
     spacemacs-purpose
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(osx-browse ssh-config-mode sx gitter visual-fill-column company-terraform noflet kubernetes kubernetes-evil kubernetes-tramp jekyll-modes octopress easy-hugo easy-jekyll easy-kill easy-kill-extras)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))

  (use-package paradox
    :defer t
    :ensure ghub+
    :config
    (progn
      (require 'ghub+)
      (setq paradox-github-token (ghubp-token 'paradox))
      (setq paradox-automatically-star t)))

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
  ;;;; FIXME: breaks on develop branch for some reason, so temporarily
  ;;;; commenting out until properly fixed with bind-keys or use-package
  ;; (define-key evil-lisp-state-map "\C-r" 'isearch-backward-regexp)
  ;; (define-key evil-lisp-state-major-mode-map "\C-r" 'isearch-backward-regexp)

  (define-key evil-normal-state-map "\C-p" 'previous-line)
  (define-key evil-normal-state-map "\C-n" 'next-line)

  (use-package sx
    :init
    (spacemacs/set-leader-keys
      "sx" 'sx-search))
  (use-package sx-question-mode
    :defer t
    :config
    (bind-keys :map sx-question-mode-map
               (";" . scroll-down-command)))

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
        (git-gutter:awhen (git-gutter:search-here-diffinfo git-gutter:diffinfos)
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

  ;; FIXME: disabled in favor of magithub
  ;; (use-package magit-gh-pulls
  ;;   :init
  ;;   (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
  ;;   :config
  ;;   (magit-define-popup-action 'magit-gh-pulls-popup
  ;;     ?# "Reload" 'magit-gh-pulls-reload))

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

  ;; FIXME: diabled until/if it is needed at some point later
  ;; https://emacs.stackexchange.com/a/35953/2138
  ;; How can I retrieve an HTTPS URL on Mac OS X without warnings about an untrusted authority?
  ;; (add-to-list 'gnutls-trustfiles "/private/etc/ssl/cert.pem")

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
      (setq magit-repository-directories '(("~/work/" . 1))))

    :config
    (progn
      (bind-keys :map magit-diff-mode-map
                 ([C-tab] . other-window))
      (bind-keys :map magit-log-mode-map
                 ([C-tab] . other-window))
      (bind-keys :map magit-status-mode-map
                 ([C-tab] . other-window))))

  (use-package magithub
    :config
    (progn
      (magit-set "true" "--global" "magithub.online")
      (magit-set "true" "--global" "magithub.status.includeStatusHeader")
      (magit-set "true" "--global" "magithub.status.includePullRequestsSection")
      (magit-set "true" "--global" "magithub.status.includeIssuesSection")
      ))

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
    (yasnippet-snippets yapfify yaml-mode xterm-color xkcd ws-butler winum web-mode web-beautify volatile-highlights visual-fill-column vimrc-mode vi-tilde-fringe uuidgen unfill toc-org tagedit systemd symon sx swift-mode string-inflection ssh-config-mode sql-indent spaceline-all-the-icons spaceline powerline smeargle slim-mode slack circe oauth2 websocket shell-pop seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rake rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements persp-mode password-generator paradox spinner pandoc-mode ox-pandoc overseer osx-trash osx-dictionary osx-browse browse-url-dwim string-utils list-utils org-bullets open-junk-file octopress noflet neotree nameless mwim multi-term move-text mmm-mode minitest markdown-toc magithub ghub+ apiwrap magit-svn magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode skewer-mode live-py-mode link-hint launchctl kubernetes-tramp kubernetes-evil kubernetes json-navigator hierarchy js2-refactor multiple-cursors js2-mode js-doc jekyll-modes polymode insert-shebang indent-guide importmagic epc ctable concurrent deferred impatient-mode htmlize simple-httpd hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose window-purpose imenu-list helm-projectile helm-mode-manager helm-make helm-gitignore request helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gmail-message-mode ham-mode markdown-mode html-to-markdown gitter gitignore-templates gitignore-mode github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache gh-md fuzzy flymd flycheck-pos-tip pos-tip flycheck-bashate flycheck flx-ido flx fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit ghub treepy graphql with-editor evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help engine-mode emojify ht emoji-cheat-sheet-plus emmet-mode elisp-slime-nav editorconfig edit-server easy-kill-extras easy-kill easy-jekyll easy-hugo dumb-jump doom-modeline eldoc-eval shrink-path all-the-icons memoize dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diff-hl dactyl-mode cython-mode csv-mode counsel-projectile projectile counsel swiper ivy pkg-info epl company-web web-completion-data company-terraform terraform-mode hcl-mode company-tern dash-functional tern company-statistics company-shell company-go go-mode company-emoji company-anaconda company command-log-mode column-enforce-mode clean-aindent-mode chruby centered-cursor-mode bundler inf-ruby browse-at-remote auto-yasnippet yasnippet auto-highlight-symbol auto-complete-rst auto-compile packed anaconda-mode pythonic f dash s alert log4e gntp ahk-mode aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core ac-ispell auto-complete popup which-key use-package pcre2el org-plus-contrib hydra font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
