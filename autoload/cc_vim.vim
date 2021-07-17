function! cc_vim#Make_run(file_name,dir_path,if_input_ex)
	let l:target='target'
	if a:if_input_ex
		let l:target='target'
	else
		let l:target='target_output_only'
	endif
	let l:output=system('make -s -f '.g:make_file_name.' '.l:target.' TARGET='.a:file_name.' -C '.a:dir_path)
	let l:errormsg=system('head -n 1 errormsg')
	let l:expected_errormsg='124'
	if stridx(l:errormsg,l:expected_errormsg) >=0
		echohl WarningMsg
		echom "Time limit exceeded Execution Stopped"
		echohl None
	else
		let	l:target = 'target_output'
		let l:output=system('make -s -f '.g:make_file_name.' '.l:target.' TARGET='.a:file_name.' -C '.a:dir_path)
	endif

endfunction

function! cc_vim#Make_create(root_path,dir_path)
	let l:output=system('rsync -t '.a:root_path.g:make_file_name.' '.a:dir_path.'/'.g:make_file_name)

endfunction

function! cc_vim#Find_path()
	let l:full_path_name=system('find ~/.vim -type f -name '.g:make_file_name)
	let l:path_name=split(full_path_name,g:make_file_name)
	return l:path_name[0]
endfunction

function! cc_vim#Checkinputtxt(path_input)
	if !empty(glob(a:path_input))
		let l:exists=1
	else
		let l:exists=0
	endif
	return l:exists
endfunction

function! cc_vim#List_buffer()
	let all = range(1, bufnr('$'))
	let res = []
	for b in all
		if buflisted(b)
			call add(res, bufname(b))
		endif
	endfor
	return res
endfunction

function! cc_vim#Buffer_identify(Buffer_list,Identifier)
	let l:length=len(a:Buffer_list)
	let l:file_name=[]
	let i=1
	while i <=l:length
		let l:file_name_split=split(a:Buffer_list[i-1],'\.')
		if l:file_name_split[1]==#a:Identifier
			let l:file_name_final=add(l:file_name,l:file_name_split[0].'.'.l:file_name_split[1])
		endif
		let i+=1
	endwhile
	return l:file_name
endfunction

function! cc_vim#Save_all(dir_path,file_name_list)
	let l:length=len(a:file_name_list)
	let l:i=1
	"while l:i<=l:length
	"echo expand(a:file_name_list[l:i-1])
	"silent exe 'checktime '.a:dir_path.'/'.a:file_name_list[l:i-1]
	"silent exe 'edit'.a:dir_path.'/'.a:file_name_list[l:i-1]
	"let l:i+=1
	"endwhile
endfunction

function! cc_vim#Map_run(cpp_file_name,file_name_list,dir_path)
	execute 'wa'
	call cc_vim#Make_create(cc_vim#Find_path(),a:dir_path)
	let l:path_to_input=a:dir_path.'/input.txt'
	call cc_vim#Make_run(a:cpp_file_name,a:dir_path,cc_vim#Checkinputtxt(l:path_to_input))
	"call feedkeys("<C-l>")
endfunction

function! cc_vim#Final_run()
	let l:cpp_file_name=cc_vim#Buffer_identify(cc_vim#List_buffer(),'cpp')
	call cc_vim#Map_run(l:cpp_file_name[0],cc_vim#List_buffer(),expand('%:p:h'))
endfunction
