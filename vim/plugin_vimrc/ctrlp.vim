let g:ctrlp_map               = '<C-P>f'
let g:ctrlp_cmd               = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore     = '\v[\/]\.(git|hg|svn|pyc)$'
let g:ctrlp_regexp            = 0
let g:ctrlp_extensions        = ['tag', 'buffertag', 'quickfix', 'dir', 'line', 'changes']
let g:ctrlp_switch_buffer     = 'et'
let g:ctrlp_match_window      = 'max:20'
let g:ctrlp_user_command      = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nmap <C-P>b  :CtrlPBuffer    <CR>
nmap <C-P>t  :CtrlPBufTag    <CR>
nmap <C-P>T  :CtrlPBufTagAll <CR>
nmap <C-P>q  :CtrlPQuickfix  <CR>
nmap <C-P>d  :CtrlPDir       <CR>
nmap <C-P>l  :CtrlPLine      <CR>
nmap <C-P>c  :CtrlPChangeAll <CR>
