;;; init-orgroam.el --- orgroam config
;;; Comentary:

(setq org-roam-directory (file-truename "~/kbase"))

(global-set-key (kbd "C-c n l") #'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n f") #'org-roam-node-find)
(global-set-key (kbd "C-c n i") #'org-roam-node-insert)
(global-set-key (kbd "C-M-i") #'completion-at-point)

(setq org-roam-capture-templates
      '(
        ("d" "default" plain
         (file "~/myorg/templates/default_roam.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t
         )
        ("q" "question answer" plain
         (file "~/myorg/templates/question_answer.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t
         )
        ))
;; plain: The type of text being inserted, always this value for note templates
;; "%?": This is the text that will be inserted into the new note, can be anything!
;; :if-new : The list that follows this describes how the note file will be created
;; :unnarrowed t : Ensures that the full file will be displayed when captured (an Org thing)

(setq org-roam-capture-ref-templates
      '(
        ("d" "default" plain
         (file "~/myorg/templates/default_roam_with_body.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t
         )
        ("q" "question answer" plain
         (file "~/myorg/templates/question_answer_with_body.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t
         )
        ))

(setq org-roam-mode-sections
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            ;; #'org-roam-unlinked-references-section
            ))
(setq org-roam-mode-sections
      '((org-roam-backlinks-section :unique t)
        org-roam-reflinks-section))
(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))
(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory org-roam-directory))
;; setup Org-roam to run functions on file changes to maintain cache consistency.
(org-roam-db-autosync-mode)
(require 'org-roam-protocol)

(provide 'init-orgroam)
