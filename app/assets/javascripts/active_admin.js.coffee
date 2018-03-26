#= require active_admin/base
#= require codemirror/codemirror
#= require codemirror/mode/markdown
#= require codemirror/mode/gfm
#= require codemirror/addon/mode/overlay

$ ->
  $('textarea.markdown').each ->
    CodeMirror.fromTextArea $(this).get(0),
       mode:  'gfm'
       indentUnit: 2
       tabSize: 2
       lineWrapping: true

