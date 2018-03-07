#= require active_admin/base
#= require codemirror/codemirror
#= require codemirror/mode/markdown

$ ->
  $('textarea.markdown').each ->
    CodeMirror.fromTextArea $(this).get(0),
       mode:  'markdown'
       indentUnit: 2
       tabSize: 2
       lineNumbers: true
       lineWrapping: true

