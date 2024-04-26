" =============================================================================
" Filename: spaceline.vim
" Author: FollieHiyuki
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================
function! spaceline#colorscheme#nord#nord()
  let s:slc={}
  let s:slc.white     = ['d8dee9', 255]
  let s:slc.gray      = ['3b4252', 237]
  let s:slc.black     = ['2e3440', 232]
  let s:slc.yellow    = ['ebcb8b', 214]
  let s:slc.purple    = ['b48ead', 251]
  let s:slc.orange    = ['d08770', 208]
  let s:slc.red       = ['bf616a', 203]
  let s:slc.blue      = ['81a1c1', 32]
  let s:slc.cyan      = ['88c0d0', 225]
  let s:slc.darknavy  = []

  call spaceline#colors#match_background_color(s:slc.darknavy)

  let l:mode=mode()
  if g:seperate_style  == 'slant'
      call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'black', 'blue')
      if empty(expand('%t'))
        call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'gray')
      else
        call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'gray')
      endif
      call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray')
      call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
      call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray')
      call spaceline#colors#spaceline_hl('GitRight',s:slc,  'darknavy',  'gray')
      call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'blue', 'gray')
      call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style == 'slant-cons'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'black', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'gray')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style  == 'slant-fade'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'black', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'gray')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray','darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style == 'arrow-fade'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'black', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'gray')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style  == 'curve'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'black', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray', 'blue')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'darknavy', 'gray')
  else
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'black', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray', 'blue')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'darknavy',  'gray')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'blue')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'darknavy', 'gray')
  endif

  call spaceline#colors#spaceline_hl('InActiveFilename', s:slc, 'white', 'gray')
  call spaceline#colors#spaceline_hl('FileName', s:slc, 'white', 'gray')
  call spaceline#colors#spaceline_hl('Filesize', s:slc, 'purple', 'gray')
  call spaceline#colors#spaceline_hl('HeartSymbol', s:slc, 'orange',  'gray')
  call spaceline#colors#spaceline_hl('CocError',s:slc,  'red',  'gray')
  call spaceline#colors#spaceline_hl('CocWarn',s:slc,  'yellow',  'gray')
  call spaceline#colors#spaceline_hl('GitBranchIcon', s:slc, 'orange',  'gray')
  call spaceline#colors#spaceline_hl('GitInfo',s:slc,  'white',  'gray')
  call spaceline#colors#spaceline_hl('GitAdd',s:slc,  'purple',  'gray')
  call spaceline#colors#spaceline_hl('GitRemove',s:slc,  'red',  'gray')
  call spaceline#colors#spaceline_hl('GitModified',s:slc,  'orange',  'gray')
  call spaceline#colors#spaceline_hl('CocBar',s:slc,  'white',  'darknavy')
  if g:seperate_style == 'slant'
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'darknavy',  'gray')
  else
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'gray',  'darknavy')
  endif
  if g:seperate_style == 'arrow-fade' || g:seperate_style == 'slant-cons' || g:seperate_style == 'slant'
      call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'gray',  'gray')
  else
      call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'gray',  'gray')
  endif
  call spaceline#colors#spaceline_hl('StatusEncod',s:slc,  'white',  'gray')
  call spaceline#colors#spaceline_hl('StatusFileFormat',s:slc,  'white',  'gray')
  call spaceline#colors#spaceline_hl('StatusLineinfo',s:slc,  'white',  'gray')
  call spaceline#colors#spaceline_hl('EndSeperate',s:slc,  'purple',  'gray')
  call spaceline#colors#spaceline_hl('emptySeperate1',s:slc,  'gray',  'darknavy')
endfunction
