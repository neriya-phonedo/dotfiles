nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <F4> :lua require'dap'.step_into()<cr>

nnoremap <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F7> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F8> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F9> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader><c-B> <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open({height: 20})<CR>
" nnoremap <silent> <Leader>r <Cmd>lua require'dap'.repl.toggle({height: 20})<CR>
nnoremap <silent> <Leader>r <Cmd>lua require'dap'.repl.toggle()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

au FileType dap-repl lua require('dap.ext.autocompl').attach()

lua <<EOF
  vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
EOF


nnoremap <leader>f <Cmd>CocCommand php-cs-fixer.fix<CR>
