#lang racket
(require racket/gui framework)
(define w 1920)
(define h 1080)
(define f (new frame%
               [label "Route2D"]
               [width w]
               [height h]))
(define mb (new menu-bar% [parent f]))
(define m-file (new menu% [label "File"] [parent mb]))
(define m-edit (new menu% [label "Edit"] [parent mb]))
(define m-toolpaths (new menu% [label "Toolpaths"] [parent mb]))
(define m-view (new menu% [label "View"] [parent mb]))
(define m-help (new menu% [label "Help"] [parent mb]))
(define mi-new
  (new menu-item%
       [label "New"]
       [parent m-file]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\n]
       [shortcut-prefix '(ctl)]))
(define mi-open
  (new menu-item%
       [label "Open..."]
       [parent m-file]
       [callback
        (λ (i e)
          (get-file "Open"
                    f
                    #f
                    #f
                    #f
                    null
                    (list (list "Route2D Project (*.route2d)" "*.route2d"))))]
       [shortcut #\o]
       [shortcut-prefix '(ctl)]))
(define mi-close
  (new menu-item%
       [label "Close"]
       [parent m-file]
       [callback
        (λ (i e)
          (void))]))
(define mi-save
  (new menu-item%
       [label "Save"]
       [parent m-file]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\s]
       [shortcut-prefix '(ctl)]))
(define mi-save-as
  (new menu-item%
       [label "Save As..."]
       [parent m-file]
       [callback
        (λ (i e)
          (put-file "Save As"
                    f
                    #f
                    #f
                    #f
                    null
                    (list (list "Route2D Project (*.route2d)" "*.route2d"))))]))
(define mi-increment-and-save
  (new menu-item%
       [label "Increment and Save"]
       [parent m-file]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\s]
       [shortcut-prefix (list 'ctl 'alt)]))
(define m-file-s1
  (new separator-menu-item%
       [parent m-file]))
(define mi-print
  (new menu-item%
       [label "Print..."]
       [parent m-file]
       [callback
        (λ (i e)
          (void))]))
(define mi-print-preview
  (new menu-item%
       [label "Print Preview"]
       [parent m-file]
       [callback
        (λ (i e)
          (void))]))
(define mi-print-setup
  (new menu-item%
       [label "Print Setup..."]
       [parent m-file]
       [callback
        (λ (i e)
          (get-page-setup-from-user "Print Setup"
                                    f))]))
(define m-file-s2
  (new separator-menu-item%
       [parent m-file]))
(define mi-import
  (new menu-item%
       [label "Import..."]
       [parent m-file]
       [callback
        (λ (i e)
          (get-file "Import"
                    f
                    #f
                    #f
                    #f
                    null
                    (list (list "All files (*.*)" "*.*")
                          (list "Encapsulated PostScript (*.eps)" "*.eps")
                          (list "Scalable Vector Graphics (*.svg)" "*.svg"))))]))
(define mi-export
  (new menu-item%
       [label "Export..."]
       [parent m-file]
       [callback
        (λ (i e)
          (put-file "Export"
                    f
                    #f
                    #f
                    #f
                    null
                    (list (list "All files (*.*)" "*.*")
                          (list "Encapsulated PostScript (*.eps)" "*.eps")
                          (list "Scalable Vector Graphics (*.svg)" "*.svg"))))]))
(define mi-open-application-data-folder
  (new menu-item%
       [label "Open Application Data Folder..."]
       [parent m-file]
       [callback
        (λ (i e)
          (shell-execute "explore"
                         ""
                         ""
                         (current-directory)
                         'sw_show))]))
(define m-file-s3
  (new separator-menu-item%
       [parent m-file]))
(define mi-exit
  (new menu-item%
       [label "Exit"]
       [parent m-file]
       [callback
        (λ (i e)
          (when (exit:user-oks-exit) (exit:exit)))]))
(define mi-undo
  (new menu-item%
       [label "Undo"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\z]
       [shortcut-prefix '(ctl)]))
(define mi-redo
  (new menu-item%
       [label "Redo"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\y]
       [shortcut-prefix '(ctl)]))
(define mi-cut
  (new menu-item%
       [label "Cut"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\x]
       [shortcut-prefix '(ctl)]))
(define mi-copy
  (new menu-item%
       [label "Copy"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\c]
       [shortcut-prefix '(ctl)]))
(define mi-paste
  (new menu-item%
       [label "Paste"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\v]
       [shortcut-prefix '(ctl)]))
(define mi-delete
  (new menu-item%
       [label "Delete"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\rubout]
       [shortcut-prefix null]))
(define sm-selection
  (new menu%
       [label "Selection..."]
       [parent m-edit]))
(define mi-select-all-vectors
  (new menu-item%
       [label "Select All Vectors"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\a]
       [shortcut-prefix '(ctl)]))
(define mi-select-all-open-vectors
  (new menu-item%
       [label "Select All Open Vectors"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))]))
(define mi-select-all-duplicate-vectors
  (new menu-item%
       [label "Select All Duplicate Vectors"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))]))
(define mi-select-all-vectors-on-current-layer
  (new menu-item%
       [label "Select All Vectors On Current Layer"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))]))
(define mi-unselect-all
  (new menu-item%
       [label "Unselect All"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))]))
(define sm-align-selected-objects
  (new menu%
       [label "Align Selected Objects..."]
       [parent m-edit]))
(define mi-join-vectors
  (new menu-item%
       [label "Join Vectors"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-curve-fit-vectors
  (new menu-item%
       [label "Curve Fit Vectors"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-nest-selected-vectors
  (new menu-item%
       [label "Nest Selected Vectors"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-job-size-and-position
  (new menu-item%
       [label "Job Size and Position"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-notes
  (new menu-item%
       [label "Notes"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-document-variables
  (new menu-item%
       [label "Document Variables"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-snap-options
  (new menu-item%
       [label "Snap Options"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-options
  (new menu-item%
       [label "Options"]
       [parent m-edit]
       [callback
        (λ (i e)
          (void))]))
(define mi-show-toolpaths-tab
  (new checkable-menu-item%
       [label "Show Toolpaths Tab"]
       [parent m-toolpaths]
       [callback
        (λ (i e)
          (void))]))
(define mi-tool-database
  (new menu-item%
       [label "Tool Database"]
       [parent m-toolpaths]
       [callback
        (λ (i e)
          (void))]))
(define mi-recalculate-all-toolpaths
  (new menu-item%
       [label "Recalculate All Toolpaths"]
       [parent m-toolpaths]
       [callback
        (λ (i e)
          (void))]))
(define sm-toolpath-drawing
  (new menu%
       [label "Toolpath Drawing"]
       [parent m-toolpaths]))
(define mi-draw-2d-previews
  (new checkable-menu-item%
       [label "Draw 2D Previews"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))]))
(define mi-make-2d-previews-solid
  (new checkable-menu-item%
       [label "Make 2D Previews Solid"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))]))
(define mi-auto-open-3d-view
  (new checkable-menu-item%
       [label "Auto Open 3D View"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))]))
(define mi-draw-rapid-moves
  (new checkable-menu-item%
       [label "Draw Rapid Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))]))
(define mi-draw-plunge-moves
  (new checkable-menu-item%
       [label "Draw Plunge Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))]))
(define mi-draw-retract-moves
  (new checkable-menu-item%
       [label "Draw Retract Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))]))
(define mi-draw-join-moves
  (new checkable-menu-item%
       [label "Draw Join Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))]))
(define m-toolpaths-s1
  (new separator-menu-item%
       [parent m-toolpaths]))
(define sm-templates
  (new menu%
       [label "Templates"]
       [parent m-toolpaths]))
(define mi-save-selected-toolpath-as-template
  (new menu-item%
       [label "Save Selected Toolpath as Template..."]
       [parent sm-templates]
       [callback
        (λ (i e)
          (void))]))
(define mi-save-all-visible-toolpaths-as-template
  (new menu-item%
       [label "Save All Visible Toolpaths as Template..."]
       [parent sm-templates]
       [callback
        (λ (i e)
          (void))]))
(define mi-load-template
  (new menu-item%
       [label "Load Template..."]
       [parent sm-templates]
       [callback
        (λ (i e)
          (void))]))
(define mi-merge-visible-toolpaths
  (new menu-item%
       [label "Merge Visible Toolpaths"]
       [parent m-toolpaths]
       [callback
        (λ (i e)
          (void))]))
(define mi-create-job-sheet
  (new menu-item%
       [label "Create Job Sheet"]
       [parent m-toolpaths]
       [callback
        (λ (i e)
          (void))]))
(define mi-zoom-to-drawing
  (new menu-item%
       [label "Zoom to Drawing"]
       [parent m-view]
       [callback
        (λ (i e)
          (void))]))
(define mi-refresh-2d-view
  (new menu-item%
       [label "Refresh 2D View"]
       [parent m-view]
       [callback
        (λ (i e)
          (void))]
       [shortcut 'f5]
       [shortcut-prefix null]))
(define sm-guidelines
  (new menu%
       [label "Guidelines"]
       [parent m-view]))
(define mi-guides-visible
  (new checkable-menu-item%
       [label "Guides Visible"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))]))
(define mi-delete-all-guides
  (new menu-item%
       [label "Delete All Guides"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))]))
(define mi-lock-all-existing-guides
  (new menu-item%
       [label "Lock All Existing Guides"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))]))
(define mi-unlock-all-existing-guides
  (new menu-item%
       [label "Unlock All Existing Guides"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))]))
(define mi-help-contents
  (new menu-item%
       [label "Documentation"]
       [parent m-help]
       [callback
        (λ (i e)
          (void))]))
(define mi-keyboard-shortcuts
  (new menu-item%
       [label "Keyboard Shortcuts"]
       [parent m-help]
       [callback
        (λ (i e)
          (void))]))
(define m-help-s1
  (new separator-menu-item%
       [parent m-help]))
(define mi-about-route2d
  (new menu-item%
       [label "About Route2D..."]
       [parent m-help]
       [callback
        (λ (i e)
          (void))]))
(send f maximize #t)
(send f show #t)