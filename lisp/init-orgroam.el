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
         (file "~/myorg/templates/default_roam_template.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t
         )
        ))
;; plain: The type of text being inserted, always this value for note templates
;; "%?": This is the text that will be inserted into the new note, can be anything!
;; :if-new : The list that follows this describes how the note file will be created
;; :unnarrowed t : Ensures that the full file will be displayed when captured (an Org thing)

;; setup Org-roam to run functions on file changes to maintain cache consistency.
(org-roam-db-autosync-mode)

(provide 'init-orgroam)
