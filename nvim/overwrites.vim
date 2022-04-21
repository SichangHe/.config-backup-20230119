" overwrite broken remark
let g:neoformat_markdown_remark = {
\'args': ['--no-color', '--silent', '-r', '~/.config/remarkrc.yml'], 
\'stdin': 1, 'exe': 'remark'
\}

" use black as Python formatter
let g:neoformat_python_black = {
    \ 'exe': 'black',
    \ 'stdin': 1,
    \ 'args': ['-q', '-'],
    \ }
let g:neoformat_enabled_python = ['black']

