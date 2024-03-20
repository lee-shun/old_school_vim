let lspOpts = #{
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

autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [
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
            \ }]
autocmd User LspSetup call LspAddServer(lspServers)
