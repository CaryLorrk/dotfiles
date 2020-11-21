" Install required linters
" python3 -m pip install prospector[with_pyroma]

let g:ale_linters = {
\       'python': ['prospector'],
\}

let g:ale_python_prospector_options = '--strictness=veryhigh --max-line-length=99 --with-tool pyroma --with-tool mypy'
