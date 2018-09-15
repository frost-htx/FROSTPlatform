platform :ios, '9.0'
use_frameworks!

target 'FROSTPlatform' do
    pod 'AFNetworking','~> 3.1.0'
    pod 'JSONModel','~> 1.2.0'
    pod 'DZNEmptyDataSet','~> 1.8'
    pod 'IQKeyboardManager','~> 4.0.2'
    pod 'Masonry','~> 1.0.0'
    pod 'SDWebImage', '~> 3.7.5'
    pod 'MJRefresh','~> 3.1.0'
    pod 'SVProgressHUD','~> 2.0-beta8'
    pod 'iCarousel','~>1.8.2'
    pod 'RSKImageCropper','~> 1.6.3'
    pod 'FBMemoryProfiler', '~> 0.1.3'
    pod 'NSLogger', '~> 1.7.0'
    pod 'YYKit', '~> 1.0.1'
    pod 'ReactiveCocoa','~> 2.5'
    pod 'GPUImage', '~> 0.1.7'
    pod 'Mapbox-iOS-SDK', '~> 4.1.1'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
