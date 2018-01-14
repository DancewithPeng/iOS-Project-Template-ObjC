source 'https://github.com/CocoaPods/Specs.git' # 指定Specs源

workspace 'iOS-Project-Template-ObjC'    # 指定Workspace

platform :ios, '9.0'                # 指定平台和最低版本
inhibit_all_warnings!               # 无视所有警告
use_frameworks!                     # 使用framework代替静态库


pod 'AFNetworking'
pod 'MBProgressHUD'


target 'DPApp' do                   # target 对应Xcode中的target
    project 'DPApp/DPApp'           # 指定Target所在的Project

	target 'DPAppTests' do
		inherit! :search_paths      # 子target继承父target
	end
end

target 'Utilities' do                   # target 对应Xcode中的target
    project 'Utilities/Utilities'           # 指定Target所在的Project

    target 'UtilitiesTests' do
        inherit! :search_paths      # 子target继承父target
    end
end

target 'Basics' do                   # target 对应Xcode中的target
    project 'Basics/Basics'           # 指定Target所在的Project
    
    target 'BasicsTests' do
        inherit! :search_paths      # 子target继承父target
    end
end

target 'UserModule' do                   # target 对应Xcode中的target
    project 'UserModule/UserModule'           # 指定Target所在的Project
    
    target 'UserModuleTests' do
        inherit! :search_paths      # 子target继承父target
    end
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		puts target.name
	end
end
