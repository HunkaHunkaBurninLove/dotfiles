;; .emacs

;; don't load default.el
(setq inhibit-default-init t)

;; always present -- what do they do?
(defun do-nothing () (interactive) nil)
(put 'eval-expression 'disabled nil)

;; ESS
;( load "....ess-site" )

;; apparent
(setq transient-mark-mode t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq mode-line-inverse-video t)
(setq auto-save-interval 100)
(setq scroll-step 8)
(setq require-final-newline t)
(setq default-major-mode 'text-mode)
(setq visible-bell t)
(setq backward-delete-char-untabify-method 'hungry)  ;; gobble whitespace
(setq completion-ignored-extensions (quote ("~" ".o" ".aux" ".a" ".dvi" ".org") ) )

;; set title
(setq frame-title-format (concat "emacs:    %b") )

;; tabs
(setq tab-width 4)







;; key bindings

(global-set-key [(f1)]       'advertised-undo)      ;; f01
(global-set-key [(f2)]       'find-file)
(global-set-key [(f3)]       'save-buffer)
(global-set-key [(f4)]       'query-replace )
(global-set-key [(f5)]       'exchange-point-and-mark)
(global-set-key [(f6)]       'set-mark-command)
(global-set-key [(f7)]       'kill-region)
(global-set-key [(f8)]       'yank)
(global-set-key [(f9)]       'isearch-forward)
(global-set-key [(f10)]      'advertised-undo)
(global-set-key [(f11)]      'advertised-undo)
(global-set-key [(f12)]      'advertised-undo)

(global-set-key [(home)]     'beginning-of-buffer)
(global-set-key [(end)]      'end-of-buffer)




;;
(message "Ken's global key setup.")






		  
