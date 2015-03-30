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
    if editor = atom.workspace.getActiveTextEditor()
      selection = editor.getSelectedText()
      selection = selection.replace /s\sclass="[^"]"/g, ""
      editor.insertText(selection);
