# Pain Split

*This package is no longer being actively developed.* I don't use Atom any more. If you want to be the new maintainer, by all means, just ask.

In the mean time, I'll at least try and fix bugs for a while longer, but I don't think I'll do feature requests.

---

Atom's `pane:split-*` commands suck if you want to do anything else but re-open
the current document in your shiny new pane. Pain Split is here to help.

Default key bindings go something like this. Sorry for polluting the `pane:*`
namespace.

    '.platform-darwin':
      # Open an empty pane and bring it to focus to do as you will.
      # If there had to be only one way to split panes, this should have
      # been it.
      'cmd-k left':  'pane:split-left-creating-empty-pane'
      'cmd-k right': 'pane:split-right-creating-empty-pane'
      'cmd-k up':    'pane:split-up-creating-empty-pane'
      'cmd-k down':  'pane:split-down-creating-empty-pane'
      
      # Open a new pane and move the current editor tab to it.
      'cmd-k m left':  'pane:split-left-moving-current-tab'
      'cmd-k m right': 'pane:split-right-moving-current-tab'
      'cmd-k m up':    'pane:split-up-moving-current-tab'
      'cmd-k m down':  'pane:split-down-moving-current-tab'
      
      # Atom's default behavior. "D" for duplicate the current tab.
      # It's still there if you want it, I guess.
      'cmd-k d left':  'pane:split-left'
      'cmd-k d right': 'pane:split-right'
      'cmd-k d up':    'pane:split-up'
      'cmd-k d down':  'pane:split-down'
      
      # Merge all tabs into one(first) pane.
      'cmd-k m':  'pane:merge-all-panes'

For windows / linux:

```
'.platform-linux, .platform-win32':
  # Open an empty pane and bring it to focus to do as you will.
  # If there had to be only one way to split panes, this should have
  # been it.
  'ctrl-k left':  'pane:split-left-creating-empty-pane'
  'ctrl-k right': 'pane:split-right-creating-empty-pane'
  'ctrl-k up':    'pane:split-up-creating-empty-pane'
  'ctrl-k down':  'pane:split-down-creating-empty-pane'

  # Open a new pane and move the current editor tab to it.
  'ctrl-k m left':  'pane:split-left-moving-current-tab'
  'ctrl-k m right': 'pane:split-right-moving-current-tab'
  'ctrl-k m up':    'pane:split-up-moving-current-tab'
  'ctrl-k m down':  'pane:split-down-moving-current-tab'

  # Atom's default behavior. "D" for duplicate the current tab.
  # It's still there if you want it, I guess.
  'ctrl-k d left':  'pane:split-left'
  'ctrl-k d right': 'pane:split-right'
  'ctrl-k d up':    'pane:split-up'
  'ctrl-k d down':  'pane:split-down'

  # Merge all tabs into one(first) pane.
  'ctrl-k m':  'pane:merge-all-panes'
```
