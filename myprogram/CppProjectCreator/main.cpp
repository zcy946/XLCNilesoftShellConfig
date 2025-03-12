//
// Created by xialichen on 2025/3/10.
//

#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>

namespace fs = std::filesystem;

int main(int argc, char** argv)
{
	// 检查命令行参数
	if (argc < 3)
	{
		std::cerr << "Usage: " << argv[0] << " <project_path> <project_name>" << std::endl;
		return 1;
	}

	// 获取项目创建路径
	std::string base_path = argv[1];

	// 获取项目名称
	std::string project_name = argv[2];

	// 创建项目完整路径（在基础路径下添加项目名称）
	fs::path project_path = fs::path(base_path) / project_name;

	try
	{
		// 创建项目文件夹
		fs::create_directories(project_path);

		// 创建 include 文件夹
		fs::create_directory(project_path / "include");

		// 创建 src 文件夹
		fs::create_directory(project_path / "src");

		// 创建并写入 CMakeLists.txt
		std::ofstream cmake_file(project_path / "CMakeLists.txt");
		if (!cmake_file.is_open())
		{
			throw std::runtime_error("Failed to create CMakeLists.txt");
		}

		cmake_file << "cmake_minimum_required(VERSION 3.16)\n"
				   << "add_compile_options(\"$<$<CXX_COMPILER_ID:MSVC>:/utf-8>\")\n\n"
				   << "project(" << project_name << ")\n"
				   << "aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src SRC)\n\n"
				   << "add_executable(${PROJECT_NAME}\n"
				   << "        ${SRC}\n"
				   << ")";
		cmake_file.close();

		// 创建并写入 main.cpp
		std::ofstream main_file(project_path / "src" / "main.cpp");
		if (!main_file.is_open())
		{
			throw std::runtime_error("Failed to create main.cpp");
		}

		main_file << "#include <iostream>\n\n"
				  << "int main(int argc, char **argv)\n"
				  << "{\n"
				  << "\tstd::cout << \"hello world\" << std::endl;\n"
				  << "\treturn 0;\n"
				  << "};";
		main_file.close();

		std::cout << "Project '" << project_name << "' created successfully at "
				  << fs::canonical(project_path) << std::endl;
	}
	catch (const std::exception& e)
	{
		std::cerr << "Error: " << e.what() << std::endl;
		return 1;
	}

	return 0;
}