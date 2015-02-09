module.exports =
  activate: (state) ->
    commands =
      "pane:merge-all-panes": ->
        [firstPane, rest...] = atom.workspace.getPanes()
        for pane in rest
          for item in pane.getItems()
            pane.moveItemToPane item, firstPane

    for record in [
      ['left',  'splitLeft',  'Split Left' ]
      ['right', 'splitRight', 'Split Right']
      ['up',    'splitUp',    'Split Up'   ]
      ['down',  'splitDown',  'Split Down' ]
    ] then do ([dir, method, desc] = record) ->
      commands["pane:split-#{dir}-creating-empty-pane"] = ->
        currentPane = atom.workspace.getActivePane()
        currentPane?[method]()

      commands["pane:split-#{dir}-creating-new-file"] = ->
        currentPane = atom.workspace.getActivePane()
        newPane = currentPane?[method]()
        atom.views.getView(newPane)?.dispatchEvent new CustomEvent('application:new-file')

      commands["pane:split-#{dir}-moving-current-tab"] = ->
        currentPane = atom.workspace.getActivePane()
        if currentPane?
          newPane = currentPane[method]()
          currentTab = currentPane.getActiveItem()
          if newPane? and currentTab?
            currentPane.moveItemToPane currentTab, newPane

    @subscriptions = atom.commands.add 'atom-pane', commands

  deactivate: ->
    @subscriptions?.dispose()

  serialize: ->
