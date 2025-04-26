settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 100
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}

import 'imports/theme.nss'
import 'imports/images.nss'

import 'imports/modify.nss'

menu(mode="multiple" title="Pin/Unpin" image=icon.pin)
{
}

menu(mode="multiple" title=title.more_options image=icon.more_options)
{
}

// 删除在终端中打开
remove(find="在终端中打开")

import 'imports/terminal.nss'
import 'imports/file-manage.nss'
import 'imports/project.nss'
import 'imports/pictures.nss'
// import 'imports/goto.nss'
import 'imports/taskbar.nss'
import 'xialichen/xialichen.nss'