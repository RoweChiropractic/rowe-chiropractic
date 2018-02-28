#= require active_admin/base
#= require codemirror/codemirror
#= require codemirror/addon/mode/overlay
#= require codemirror/mode/css
#= require codemirror/mode/markdown
#= require codemirror/mode/gfm

$ ->
  $('textarea.markdown').each ->
    CodeMirror.fromTextArea $(this).get(0),
       mode:  'gfm'
       indentUnit: 2
       tabSize: 2
       lineNumbers: true
       theme: 'zenburn'

