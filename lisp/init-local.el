;;; package --- Summary
;;; code:
;;(setq-default tab-width 2)
;;;解决org-mode不能自动换行问题

(setq fill-column 80)
(setq org-startup-truncated nil)
(global-set-key (kbd "C-!") 'org-time-stamp-inactive)

(set-fontset-font "fontset-default" 'unicode (font-spec :family "Microsoft YaHei"))
(setenv "GIT_PAGER" "/bin/cat")

;;;添加multiple-cursors快捷键配置
;;(global-set-key (kbd "C-c m i") 'mc/mark-all-like-this-dwim)

(setq org-directory "~/myorg")
(setq org-agenda-files (list
			"asap.org"))

(setq org-default-notes-file (concat org-directory "/basket.org"))

(setq org-refile-targets (quote(
				(nil :maxlevel . 9)
				(org-agenda-files :maxlevel . 9)
				("maybe_future.org" :maxlevel . 9))))
(setq org-use-speed-commands
      (lambda () (and (looking-at org-outline-regexp) (looking-back "^\**"))))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(setq org-startup-with-inline-images t)
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-capture-templates `(
	                      ("p" "Protocol" entry (file+headline "~/myorg/basket.org" "Inbox")
                               "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	                      ("L" "Protocol Link" entry (file+headline "~/myorg/basket.org" "Inbox")
                               "* %? [[%:link][%:description]] \nCaptured On: %U")
                              ))
(setq org-agenda-start-on-weekday 1)
(require 'org-tempo)
(require 'org-capture)
(require 'org-protocol)

(provide 'init-local)
;;; init-local.el ends here
