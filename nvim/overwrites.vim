" overwrite broken remark
let g:neoformat_markdown_remark = {
\'args': ['--no-color', '--silent', '-r', '~/.config/remarkrc.yml'], 
\'stdin': 1, 'exe': 'remark'
\}

