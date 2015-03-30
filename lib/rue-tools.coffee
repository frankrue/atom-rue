{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'rue:kill-classes': => @kill_classes()

  deactivate: ->
    @subscriptions.dispose()

  kill_classes: ->
    classPattern = ///
      \s+
      class\=\"([^"]+)\"
    ///ig
    if editor = atom.workspace.getActiveTextEditor()
      selection = editor.getSelectedText()
      selection = selection.replace classPattern, ""
      console.log selection
      editor.insertText(selection)
