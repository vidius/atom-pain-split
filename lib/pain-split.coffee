module.exports =
  activate: (state) ->
    atom.workspaceView.eachPaneView (paneView) ->
      for record in [
        ['left',  'splitLeft',  'Split Left' ]
        ['right', 'splitRight', 'Split Right']
        ['up',    'splitUp',    'Split Up'   ]
        ['down',  'splitDown',  'Split Down' ]
      ] then do ([dir, method, desc] = record) ->
        # Override default documentation for the built-in split-xxx commands
        # to describe what they actually do.
        paneView.document "pane:split-#{dir}",
          "Pane: #{desc} and Duplicate the Current Tab"

        paneView.command "pane:split-#{dir}-creating-empty-pane",
          doc:"#{desc}"
          -> paneView[method]()

        paneView.command "pane:split-#{dir}-creating-new-file",
          doc:"#{desc} and Open a New File"
          ->
            newPane = paneView[method]()
            newPane?.trigger 'application:new-file'

        paneView.command "pane:split-#{dir}-moving-current-tab",
          doc:"#{desc} and Move the Current Tab"
          ->
            newPane = paneView[method]()
            currentTab = paneView.getActiveItem()
            paneView.moveItemToPane currentTab, newPane if newPane? and currentTab?

  # Is it really meaningful to deactivate this? Is it even possible?
  # TODO find out if eachPaneView functions can be unregistered.
  deactivate: ->
  serialize: ->
