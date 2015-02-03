augroup GIT
    autocmd!
    autocmd FileType gitcommit call s:GitDiffCachedPreview(18)
augroup END

function! s:GitDiffCachedPreview(max_height) abort
    if (!&previewwindow) && (expand('%:t') !~# 'index')

        " let MATCHES_COMMAND_EXACTLY = 2
        " if exists(':DiffGitCached') == MATCHES_COMMAND_EXACTLY
        "     DiffGitCached
        " else
        "     throw "git-diff-cached-preview couldn't call built in 'DiffGitCached' command"
        " endif
        "
        DiffGitCached

        let lines = line('$')

        if line('$') > a:max_height
            let size = a:max_height
        else
            let size = line('$')
        endif
        execute 'resize '.size

        "go to previous window
        wincmd p
    endif
endfunction
