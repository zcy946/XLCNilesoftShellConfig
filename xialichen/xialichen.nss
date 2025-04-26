// 移除bandZip的新建文件夹
remove(find='新建文件夹')

modify(
    where=this.name=="打印(P)"
    image=icon.print
)

remove(where=this.name=='使用 Microsoft 画图进行编辑')
remove(where=this.name=='使用照片编辑')

modify(
    where=this.name=="打印(P)"
    image=icon.print
)

modify(
    where=this.name=="编辑(E)"
    image=icon.edit
)

modify(
    where=this.name=="管理(G)"
    image=icon.device_manager
)


modify(
    where=this.name=="打开(O)"
    image=icon.open_new_window
)

modify(
    where=this.name=="新建(N)"
    image=icon.new_file
)

modify(
    where=this.name=="向右旋转(T)"
    image=icon.rotate_right
)


modify(
    where=this.name=="向左旋转(L)"
    image=icon.rotate_left
)


modify(
    where=this.name=="打开方式(H)"
    image=icon.open_with
)

modify(
    where=this.name=='Edit with Notepad--'
    menu=title.more_options
    pos = "1"
    sep = both
)

modify(
    find='添加到|用 Bandizip 打开|解压到|智能解压|选择解压路径|以管理员身份压缩|以管理员身份解压'
    menu=title.more_options
    pos = "2"
    // sep = none
)

modify(
    find="全部解压缩(T)"
    image=icon.compressed
    menu=title.more_options
    pos = "3"
    sep = before
)

modify(
    find='通过QQ发送到'
    menu=title.more_options
    pos = "4"
    sep = both
)

modify(
    find='使用火绒安全进行杀毒|使用火绒安全粉碎文件' 
    menu=title.more_options
    pos = "5"
    sep = none
)

modify(
    where=this.name=='Upload pictures with PicGo'
    menu=title.more_options
    pos = "6"
    sep = before
)

remove(find="Anytxt 搜索")
