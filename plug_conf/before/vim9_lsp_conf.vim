function! s:setVim9lspMap()
    nnoremap <buffer> gd <cmd>LspGotoDefinition<CR>
    nnoremap <buffer> gr <cmd>LspPeekReferences<CR>
    nnoremap <buffer> gi <cmd>LspGotoImpl<CR>
    nnoremap <buffer> gt <cmd>LspGotoTypeDef<CR>
    nnoremap <buffer> <leader>lr <cmd>LspRename<CR>
    nnoremap <buffer> <leader>la <cmd>LspCodeAction<CR>
    nnoremap <buffer> gh <cmd>LspHover<CR>
    nnoremap <buffer> ]d <cmd>LspDiag next<CR>
    nnoremap <buffer> [d <cmd>LspDiag prev<CR>
endfunction

autocmd User LspAttached call s:setVim9lspMap()

let s:lspOpts = #{
            \   aleSupport: v:false,
            \   autoComplete: v:true,
            \   autoHighlight: v:false,
            \   autoHighlightDiags: v:true,
            \   autoPopulateDiags: v:false,
            \   completionMatcher: 'case',
            \   completionMatcherValue: 1,
            \   diagSignErrorText: '',
            \   diagSignHintText: '',
            \   diagSignInfoText: '',
            \   diagSignWarningText: '',
            \   echoSignature: v:false,
            \   hideDisabledCodeActions: v:false,
            \   highlightDiagInline: v:true,
            \   hoverInPreview: v:false,
            \   ignoreMissingServer: v:false,
            \   keepFocusInDiags: v:true,
            \   keepFocusInReferences: v:true,
            \   completionTextEdit: v:true,
            \   diagVirtualTextAlign: 'above',
            \   diagVirtualTextWrap: 'default',
            \   noNewlineInCompletion: v:false,
            \   omniComplete: v:null,
            \   outlineOnRight: v:false,
            \   outlineWinSize: 20,
            \   semanticHighlight: v:true,
            \   showDiagInBalloon: v:true,
            \   showDiagInPopup: v:true,
            \   showDiagOnStatusLine: v:false,
            \   showDiagWithSign: v:true,
            \   showDiagWithVirtualText: v:false,
            \   showInlayHints: v:false,
            \   showSignature: v:true,
            \   snippetSupport: v:false,
            \   ultisnipsSupport: v:false,
            \   useBufferCompletion: v:false,
            \   usePopupInCodeAction: v:false,
            \   useQuickfixForLocations: v:false,
            \   vsnipSupport: v:false,
            \   bufferCompletionTimeout: 100,
            \   customCompletionKinds: v:false,
            \   completionKinds: {},
            \   filterCompletionDuplicates: v:false,
            \ }

autocmd User LspSetup call LspOptionsSet(s:lspOpts)

let s:lspServers = [
            \#{ name: 'clangd',
            \   filetype: ['c', 'cpp'],
            \   path: 'clangd',
            \   args: ['--background-index']
            \    },
            \#{ name: 'pyright',
            \   filetype: 'python',
            \   path: 'pyright-langserver',
            \   args: ['--stdio'],
            \   workspaceConfig: #{
            \     python: #{
            \       pythonPath: '/usr/bin/python3.10'
            \   }}
            \ },
            \#{name: 'bashls',
            \   filetype: 'sh',
            \   path: 'bash-language-server',
            \   args: ['start']
            \ }]

autocmd User LspSetup call LspAddServer(s:lspServers)
