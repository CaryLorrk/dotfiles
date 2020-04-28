"need install
":help youcompleteme-linux-64-bit
nmap <Leader>yy :YcmDiags                                   <CR>
nmap <Leader>yf :YcmForceCompileAndDiagnostics              <CR>
nmap <Leader>yg :YcmCompleter GoTo                          <CR>
nmap <Leader>yd :YcmCompleter GoToDefinitionElseDeclaration <CR>
nmap <Leader>yl :YcmCompleter GoToReferences                <CR>
nmap <Leader>ym :YcmCompleter GoToImplementation            <CR>
nmap <Leader>yc :YcmCompleter GoToDeclaration               <CR>
nmap <Leader>yi :YcmCompleter GoToInclude                   <CR>
nmap <Leader>yt :YcmCompleter GetType                       <CR>
nmap <Leader>yp :YcmCompleter GetParent                     <CR>
nmap <Leader>yo :YcmCompleter GetDoc                        <CR>
let g:ycm_complete_in_comments                      = 1
let g:ycm_collect_identifiers_from_tags_files       = 1
let g:ycm_seed_identifiers_with_syntax              = 1
let g:ycm_add_preview_to_completeopt                = 1 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_key_invoke_completion                     = '<c-z>'
