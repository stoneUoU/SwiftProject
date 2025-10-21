source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'

flutter_application_path = '../../Flutter/hi_flutter_module/'

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
#    pod 'Reveal-SDK','~>4', :configurations => ['Debug']
    pod "HandyJSON"
    pod 'SVGKit'
    pod 'PocketSVG', '~> 2.6'
    pod 'UMCommon'
    pod 'UMPush'
    pod 'UMDevice'
    pod 'UYuMao'
    pod 'UYuMao'
    pod 'RollingNotice-Swift'
    pod 'SDWebImage'
#    pod 'unimp', :git => 'https://gitcode.com/dcloud/unimpsdk-ios.git', :subspecs => [
#            'Core',               ##核心库(必需)
#    #        'Log',                ##
#    #        'Accelerometer',      ##加速度传感器
#    #        'Contacts',           ##通讯录
#    #        'Audio',              ##音频
#    #        'Camera&Gallery',     ##相机&相册
#    #        'File',               ##文件
#    #        'Video',              ##视频播放
#    #        'LivePusher',         ##直播推流
#    #        'NativeJS',           ##JS Reflection call Native
#    #        'Orientation',        ##设备方向
#    #        'Message',            ##邮件消息
#    #        'Zip',                ##压缩
#    #        'Proximity',          ##距离传感器
#    #        'Sqlite',             ##数据库
#    #        'XMLHttpRequest',     ##网络请求
#    #        'Fingerprint',        ##指纹识别
#    #        'FaceId',             ##人脸识别
#    #        'IBeacon',            ##底功耗蓝牙
#    #        'BlueTooth',          ##蓝牙
#    #        'Speech-Baidu',       ##语音识别-百度
#    #        'Statistic-Umeng',    ##友盟统计
#    #        ##定位模块(百度高德不能同时引用)
#    #        'Geolocation',        ##系统定位
#    #        'Geolocation-Gaode',  ##高德定位
#    #        'Geolocation-Baidu',  ##百度定位
#    #        ##地图(二选一)
#    #        'Map-Gaode',          ##高德地图
#    #        'Map-Baidu',          ##百度地图
#    #        ##支付
#    #        'Payment-IAP',        ##苹果内购
#    #        'Payment-AliPay',     ##支付宝支付
#    #        'Payment-Wechat',     ##微信支付-同时使用微信分享或登录,必需使用包含支付的依赖库
#    #        'Payment-Paypal',     ##Paypal支付 iOS13+
#    #        'Payment-Stripe',     ##stripe支付 iOS13+ 依赖库较大如果超时建议使用代理
#    #        ##分享
#    #        'Share-Wechat',       ##微信分享-包含支付
#    #        'Share-WechatNopay',  ##微信分享-不包含支付
#    #        'Share-QQ',           ##QQ分享
#    #        'Share-Sina',         ##新浪微博分享
#    #        ##登录
#    #        'Oauth-Apple',        ##苹果登录
#    #        'Oauth-QQ',           ##QQ登录
#    #        'Oauth-Wechat',       ##微信登录-包含支付
#    #        'Oauth-WechatNopay',  ##微信登录-不包含支付
#    #        'Oauth-Sina',         ##新浪微博登录
#    #        'Oauth-Google',       ##Google登录
#    #        'Oauth-Facebook',     ##Facebook登录 iOS12+
#      ]
    
    install_all_flutter_pods(flutter_application_path)
end
