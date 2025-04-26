menu(type="file|dir" mode="multiple" title='图像处理' image=icon.burn_disc_image)
{
	// 针对图片文件
	item(where=(sel.count>0&sel.file.ext=='.jpg'|sel.file.ext=='.jpeg'|sel.file.ext=='.png')
			title='拼接选中的 (@sel.count 张) 图片并打码'
			cmd='E:/STUDY/CPP/OpenCV_STUDY/ImgStitcher/bin/ImgStitcher.exe' args='-i @sel.paths.quote -M'
		)
		item(type='dir'        
			title='拼接选中的文件夹中的所有图片并打码'
			cmd='E:/STUDY/CPP/OpenCV_STUDY/ImgStitcher/bin/ImgStitcher.exe' args='-i @sel.paths.quote -M'
		)
}							