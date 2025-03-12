menu(type='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title='终端' sep='top' image=icon.run_with_powershell)
	{
		$tip_run_admin=["\xE1A7 Press SHIFT key to run " + this.title + " as administrator", tip.warning, 1.0]
		$has_admin=key.shift() or key.rbutton()
		
		item(title=title.command_prompt tip=tip_run_admin admin=has_admin image cmd='cmd.exe' args='/K TITLE Command Prompt &ver& PUSHD "@sel.dir"')
		item(title=title.windows_powershell admin=has_admin tip=tip_run_admin image cmd='powershell.exe' args='-noexit -command Set-Location -Path "@sel.dir\."')
		item(where=package.exists("WindowsTerminal") title=title.Windows_Terminal tip=tip_run_admin admin=has_admin image='@package.path("WindowsTerminal")\WindowsTerminal.exe' cmd='wt.exe' arg='-d "@sel.path\."')
		item(title='git-bash' admin=has_admin tip=tip_run_admin image cmd='"D:\Git\git-bash.exe"' args='--cd="@sel.dir"')
		item(
			title='Qt 5.15.2 (MSVC 2019 64-bit)' 
			admin=has_admin 
			tip=tip_run_admin 
			image 
			cmd='cmd.exe' 
			args='/K "set PATH=D:\Software\Development\Qt\5.15.2\msvc2019_64\bin;%PATH% && echo Qt 5.15.2 (MSVC 2019 64-bit) && cd "@sel.path\."' 
			sep = before
		)
		item(
			title='Qt 5.15.2 (MinGW 8.1.0 64-bit)' 
			admin=has_admin 
			tip=tip_run_admin 
			image cmd='cmd.exe' 
			args='/K "set PATH=D:\Software\Development\Qt\5.15.2\mingw81_64\bin;%PATH% && echo Qt 5.15.2 (MinGW 8.1.0 64-bit) && cd "@sel.path\."'
			sep = after
		)
		item(
			title='Anaconda Python 3.11.7 (base)' 
			admin=has_admin 
			tip=tip_run_admin 
			image 
			cmd='cmd.exe' 
			args='/K "set PATH=D:\Anaconda3;%PATH% && echo Anaconda Python 3.11.7 (base) && cd "@sel.path\."'
			sep = none
		)
		
	}