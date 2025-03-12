menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='文件管理' image=\uE253)
{
	menu(separator="after" title=title.copy_path image=icon.copy_path)
	{
		item(where=sel.count > 1 title='Copy (@sel.count) items selected' cmd=command.copy(sel(false, "\n")))
		item(mode="single" title=@(str.replace(sel.path, "\\", "/")) cmd=command.copy(str.replace(sel.path, "\\", "/")))
		item(mode="single" title=@(str.replace(sel.path, "\\", "\\\\")) cmd=command.copy(str.replace(sel.path, "\\", "\\\\")))
		item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
		item(mode="single" type='file' separator="before" find='.lnk' title='open file location')
		separator
		item(mode="single" where=@sel.parent.len>3 title=@(str.replace(sel.parent, "\\", "/")) cmd=@command.copy(str.replace(sel.parent, "\\", "/")))
		item(mode="single" where=@sel.parent.len>3 title=@(str.replace(sel.parent, "\\", "\\\\")) cmd=@command.copy(str.replace(sel.parent, "\\", "\\\\")))
		item(mode="single" where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
		separator
		item(mode="single" type='file|dir|back.dir' title=sel.file.name cmd=command.copy(sel.file.name))
		item(mode="single" type='file' where=sel.file.len != sel.file.title.len title=@sel.file.title cmd=command.copy(sel.file.title))
		item(mode="single" type='file' where=sel.file.ext.len>0 title=sel.file.ext cmd=command.copy(sel.file.ext))
		
	}
	
	menu(mode="single" type='back' expanded=true)
	{
		menu(separator="before" title='新文件夹' image=icon.new_folder)
		{
			item(title='DateTime' cmd=io.dir.create(sys.datetime("ymdHMSs")))
			item(title='Guid' cmd=io.dir.create(str.guid))
			separator
			// item(title='CppProject' cmd='D:\\Software\\Utils\\Nilesoft Shell\\myprogram\\CppProjectCreator.exe' args='"@sel.path"')
			item(
				title='C++项目' 
				cmd='D:\\Software\\Utils\\Nilesoft Shell\\myprogram\\CppProjectCreator.exe' 
				args=if(input("新建C++项目", "请输入项目名称"), @sel.path + " " + input.result, "")
			)
		}
		
		menu(title='新文件' image=icon.new_file)
		{
			$dt = sys.datetime("ymdHMSs")
			item(title='H' cmd=io.file.create('@(dt).h', "#ifndef \n#define \n\n\n#endif"))
			item(title='CPP' cmd=io.file.create('@(dt).cpp'))
			item(title='CMakeLists.txt' cmd=io.file.create('CMakeLists.txt', "cmake_minimum_required(VERSION 3.14)\nproject(PROJECTNAME)\nadd_compile_options(\"$<$<CXX_COMPILER_ID:MSVC>:/utf-8>\")"))
			separator
			item(title='PY' cmd=io.file.create('@(dt).py'))
			separator
			item(title='JAVA' cmd=io.file.create('@(dt).java'))
			separator
			item(title='TXT' cmd=io.file.create('@(dt).txt'))
			item(title='MD' cmd=io.file.create('@(dt).md'))
			item(title='HTML' cmd=io.file.create('@(dt).html', "<html>\n\t<head>\n\t</head>\n\t<body>Hello World!\n\t</body>\n</html>"))
			item(title='JSON' cmd=io.file.create('@(dt).json'))
			item(title='INI' cmd=io.file.create('@(dt).ini'))
			item(title='XML' cmd=io.file.create('@(dt).xml', '<root></root>'))
		}
	}
	
	item(mode="single" type="file" title="更改扩展名" image=\uE0B5 cmd=if(input("更改扩展名", "输入扩展名"),
			io.rename(sel.path, path.join(sel.dir, sel.file.title + "." + input.result))))
	
	menu(separator="after" image=\uE290 title=title.select)
	{
		item(title="所有" image=icon.select_all cmd=command.select_all)
		item(title="反选" image=icon.invert_selection cmd=command.invert_selection)
		item(title="None" image=icon.select_none cmd=command.select_none)
	}
	
	item(type='file|dir|back.dir|drive' title='获得所有权' image=[\uE194,#f00] admin
		cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
	separator
	menu(title="显示/隐藏" image=icon.show_hidden_files)
	{
		item(title="系统文件" image=inherit cmd='@command.togglehidden')
		item(title="文件扩展名" image=icon.show_file_extensions cmd='@command.toggleext')
	}
	
	menu(type='file|dir|back.dir' mode="single" title='属性' image=icon.properties)
	{
		$atrr = io.attributes(sel.path)
		item(title='Hidden' checked=io.attribute.hidden(atrr)
			cmd args='/c ATTRIB @if(io.attribute.hidden(atrr),"-","+")H "@sel.path"' window=hidden)
		
		item(title='System' checked=io.attribute.system(atrr)
			cmd args='/c ATTRIB @if(io.attribute.system(atrr),"-","+")S "@sel.path"' window=hidden)
		
		item(title='Read-Only' checked=io.attribute.readonly(atrr)
			cmd args='/c ATTRIB @if(io.attribute.readonly(atrr),"-","+")R "@sel.path"' window=hidden)
		
		item(title='Archive' checked=io.attribute.archive(atrr)
			cmd args='/c ATTRIB @if(io.attribute.archive(atrr),"-","+")A "@sel.path"' window=hidden)
		separator
		item(title="创建时间" keys=io.dt.created(sel.path, 'y/m/d') cmd=io.dt.created(sel.path,2000,1,1) vis=label)
		item(title="修改时间" keys=io.dt.modified(sel.path, 'y/m/d') cmd=io.dt.modified(sel.path,2000,1,1) vis=label)
		item(title="访问时间" keys=io.dt.accessed(sel.path, 'y/m/d') cmd=io.dt.accessed(sel.path,2000,1,1) vis=label)
	}
	
	menu(mode="single" type='file' find='.dll|.ocx' separator="before" title='Register Server' image=\uea86)
	{
		item(title='Register' admin cmd='regsvr32.exe' args='@sel.path.quote' invoke="multiple")
		item(title='Unregister' admin cmd='regsvr32.exe' args='/u @sel.path.quote' invoke="multiple")
	}
	
	
	item(where=!wnd.is_desktop title=title.folder_options image=icon.folder_options cmd=command.folder_options)
}