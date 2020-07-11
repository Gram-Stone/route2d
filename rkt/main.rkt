#lang racket/base

(require framework
         racket/class
         racket/gui/base)

(provide main)

(define (main)
  (define w 1920)
  (define h 1080)
  (define f (new frame%
                 [label "Route2D"]
                 [width w]
                 [height h]))
  
  (define menu-bar (new menu-bar% [parent f]))
  
  (define file-menu (new menu% [label "File"] [parent menu-bar]))

  (new menu-item%
       [label "New"]
       [parent file-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\n]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Open..."]
       [parent file-menu]
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
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Close"]
       [parent file-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Save"]
       [parent file-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\s]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Save As..."]
       [parent file-menu]
       [callback
        (λ (i e)
          (put-file "Save As"
                    f
                    #f
                    #f
                    #f
                    null
                    (list (list "Route2D Project (*.route2d)" "*.route2d"))))])

  (new menu-item%
       [label "Increment and Save"]
       [parent file-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\s]
       [shortcut-prefix (list 'ctl 'alt)])

  (new separator-menu-item% [parent file-menu])

  (new menu-item%
       [label "Print..."]
       [parent file-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Print Preview"]
       [parent file-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Print Setup..."]
       [parent file-menu]
       [callback
        (λ (i e)
          (get-page-setup-from-user "Print Setup"
                                    f))])

  (new separator-menu-item% [parent file-menu])

  (new menu-item%
       [label "Import..."]
       [parent file-menu]
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
                          (list "Scalable Vector Graphics (*.svg)" "*.svg"))))])

  (new menu-item%
       [label "Export..."]
       [parent file-menu]
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
                          (list "Scalable Vector Graphics (*.svg)" "*.svg"))))])

  (new menu-item%
       [label "Open Application Data Folder..."]
       [parent file-menu]
       [callback
        (λ (i e)
          (shell-execute "explore"
                         ""
                         ""
                         (current-directory)
                         'sw_show))])

  (new separator-menu-item% [parent file-menu])

  (new menu-item%
       [label "Exit"]
       [parent file-menu]
       [callback
        (λ (i e)
          (when (exit:user-oks-exit) (exit:exit)))])

  (define edit-menu (new menu% [label "Edit"] [parent menu-bar]))

  (new menu-item%
       [label "Undo"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\z]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Redo"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\y]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Cut"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\x]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Copy"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\c]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Paste"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\v]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Delete"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\rubout]
       [shortcut-prefix null])
  
  (define sm-selection
    (new menu%
         [label "Selection..."]
         [parent edit-menu]))

  (new menu-item%
       [label "Select All Vectors"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))]
       [shortcut #\a]
       [shortcut-prefix '(ctl)])

  (new menu-item%
       [label "Select All Open Vectors"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Select All Duplicate Vectors"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Select All Vectors On Current Layer"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Unselect All"]
       [parent sm-selection]
       [callback
        (λ (i e)
          (void))])

  (define sm-align-selected-objects
    (new menu%
         [label "Align Selected Objects..."]
         [parent edit-menu]))

  (new menu-item%
       [label "Join Vectors"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Curve Fit Vectors"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Nest Selected Vectors"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Job Size and Position"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Notes"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Document Variables"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Snap Options"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Options"]
       [parent edit-menu]
       [callback
        (λ (i e)
          (void))])

  (define toolpaths-menu (new menu% [label "Toolpaths"] [parent menu-bar]))

  (new checkable-menu-item%
       [label "Show Toolpaths Tab"]
       [parent toolpaths-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Tool Database"]
       [parent toolpaths-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Recalculate All Toolpaths"]
       [parent toolpaths-menu]
       [callback
        (λ (i e)
          (void))])

  (define sm-toolpath-drawing
    (new menu%
         [label "Toolpath Drawing"]
         [parent toolpaths-menu]))

  (new checkable-menu-item%
       [label "Draw 2D Previews"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))])

  (new checkable-menu-item%
       [label "Make 2D Previews Solid"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))])

  (new checkable-menu-item%
       [label "Auto Open 3D View"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))])

  (new checkable-menu-item%
       [label "Draw Rapid Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))])

  (new checkable-menu-item%
       [label "Draw Plunge Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))])

  (new checkable-menu-item%
       [label "Draw Retract Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))])

  (new checkable-menu-item%
       [label "Draw Join Moves"]
       [parent sm-toolpath-drawing]
       [callback
        (λ (i e)
          (void))])

  (new separator-menu-item% [parent toolpaths-menu])

  (define sm-templates
    (new menu%
         [label "Templates"]
         [parent toolpaths-menu]))

  (new menu-item%
       [label "Save Selected Toolpath as Template..."]
       [parent sm-templates]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Save All Visible Toolpaths as Template..."]
       [parent sm-templates]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Load Template..."]
       [parent sm-templates]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Merge Visible Toolpaths"]
       [parent toolpaths-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Create Job Sheet"]
       [parent toolpaths-menu]
       [callback
        (λ (i e)
          (void))])

  (define view-menu (new menu% [label "View"] [parent menu-bar]))

  (new menu-item%
       [label "Zoom to Drawing"]
       [parent view-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Refresh 2D View"]
       [parent view-menu]
       [callback
        (λ (i e)
          (void))]
       [shortcut 'f5]
       [shortcut-prefix null])

  (define sm-guidelines
    (new menu%
         [label "Guidelines"]
         [parent view-menu]))

  (new checkable-menu-item%
       [label "Guides Visible"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Delete All Guides"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Lock All Existing Guides"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Unlock All Existing Guides"]
       [parent sm-guidelines]
       [callback
        (λ (i e)
          (void))])

  (define help-menu (new menu% [label "Help"] [parent menu-bar]))

  (new menu-item%
       [label "Documentation"]
       [parent help-menu]
       [callback
        (λ (i e)
          (void))])

  (new menu-item%
       [label "Keyboard Shortcuts"]
       [parent help-menu]
       [callback
        (λ (i e)
          (void))])

  (new separator-menu-item% [parent help-menu])

  (new menu-item%
       [label "About Route2D..."]
       [parent help-menu]
       [callback
        (λ (i e)
          (void))])
  
  (send f maximize #t)
  (send f show #t))