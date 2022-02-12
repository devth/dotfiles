
" https://github.com/ngalaiko/tree-sitter-go-template
autocmd BufNewFile,BufRead * if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
