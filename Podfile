source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'

flutter_application_path = '../hi_flutter_module/'

load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

post_install do |installer|
  flutter_post_install(installer)
end


target 'SwiftProject' do
    use_frameworks!
    inhibit_all_warnings!

    pod 'MBProgressHUD', '~> 1.1.0'
    pod 'SnapKit', '~> 4.0.0'
    pod 'IQKeyboardManager', '6.4.2'
    pod 'SwiftyJSON', '~> 4.0'
#    pod 'Realm'
#    pod 'RealmSwift'
    pod 'Moya'
    pod "MJRefresh"
    pod "Kingfisher" #, '5.14.1'
    pod 'Reveal-SDK','~>4', :configurations => ['Debug']
    pod "HandyJSON"
    pod 'SVGKit'
    pod 'PocketSVG', '~> 2.6'
    pod 'UMCommon'
    pod 'UMPush'
    pod 'UMDevice'
    pod 'UYuMao'
    pod 'RollingNotice-Swift'
    
    install_all_flutter_pods(flutter_application_path)
end
