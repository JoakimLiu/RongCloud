Pod::Spec.new do |s|

  s.name         = "RongCloud"
  s.version      = "2.8.32"
  s.summary      = "RongCloud IM SDK"
  s.description  = <<-DESC
                    RongCloud IM SDK for iOS
                   DESC

  s.homepage     = "https://github.com/Limon-O-O/RongCloud"
  s.license      = "MIT"
  s.author       = { "Limon" => "fengninglong@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :http => "http://downloads.rongcloud.cn/Rong_Cloud_iOS_IM_SDK_v2_8_32_Stable.zip" }

  s.subspec 'IMKit' do |kit|
    kit.vendored_frameworks = 'RongCloudIM/RongIMKit.framework'
    kit.resources = ['RongCloudIM/RongCloud.bundle', 'RongCloudIM/en.lproj', 'RongCloudIM/zh-Hans.lproj', 'RongCloudIM/Emoji.plist', 'RongCloudIM/RCColor.plist']

    kit.dependency 'RongCloud/IMLib'

    kit.frameworks = 'AssetsLibrary', 'MapKit', 'ImageIO', 'CoreLocation', 'SystemConfiguration', 'QuartzCore', 'OpenGLES', 'CoreVideo', 'CoreTelephony', 'CoreMedia', 'CoreAudio', 'CFNetwork', 'AudioToolbox', 'AVFoundation', 'UIKit', 'CoreGraphics', 'SafariServices'
  end

  s.subspec 'IMLib' do |lib|
    lib.vendored_frameworks = 'RongCloudIM/RongIMLib.framework'
    lib.vendored_libraries = 'RongCloudIM/libopencore-amrnb.a'
    lib.libraries = 'z', 'stdc++', 'sqlite3'
    lib.xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
  end

  s.prepare_command     = <<-EOF
    while read line; do
        if [[ $line == *"//  iOS-IMKi"* ]]; then
            sed -i '' "s#//  iOS-IMKi#\@import Foundation\;#" "RongCloudIM/RongIMKit.framework/Headers/RCThemeDefine.h"
        fi
    done < "RongCloudIM/RongIMKit.framework/Headers/RCThemeDefine.h"

    mkdir RongCloudIM/RongIMKit.framework/Modules
    touch RongCloudIM/RongIMKit.framework/Modules/module.modulemap
    cat <<-EOF > RongCloudIM/RongIMKit.framework/Modules/module.modulemap
    framework module RongIMKit {
      header "RCIM.h"

      header "RCConversationListViewController.h"
      header "RCPublicServiceListViewController.h"

      header "RCConversationViewController.h"
      header "RCImagePreviewController.h"
      header "RCImageSlideController.h"
      header "RCLocationPickerViewController.h"
      header "RCLocationViewController.h"
      header "RCPublicServiceChatViewController.h"
      header "RCPublicServiceSearchViewController.h"

      header "RCConversationBaseCell.h"
      header "RCConversationCell.h"
      header "RCConversationModel.h"

      header "RCFileMessageCell.h"
      header "RCImageMessageCell.h"
      header "RCImageMessageProgressView.h"
      header "RCLocationMessageCell.h"
      header "RCMessageBaseCell.h"
      header "RCMessageCell.h"
      header "RCMessageCellDelegate.h"
      header "RCMessageCellNotificationModel.h"
      header "RCMessageModel.h"
      header "RCRichContentMessageCell.h"
      header "RCTextMessageCell.h"
      header "RCTipMessageCell.h"
      header "RCUnknownMessageCell.h"
      header "RCVoiceMessageCell.h"

      header "RCKitUtility.h"
      header "RCThemeDefine.h"

      header "RCAttributedLabel.h"
      header "RCBaseViewController.h"
      header "RCContentView.h"
      header "RCConversationSettingTableViewHeader.h"
      header "RCEmoticonTabSource.h"
      header "RCMessageBubbleTipView.h"
      header "RCPublicServiceProfileViewController.h"
      header "RCSettingViewController.h"
      header "RCTextView.h"
      header "RCTipLabel.h"
      header "RongIMKitExtensionModule.h"

      header "RCChatSessionInputBarControl.h"
      header "RCEmojiBoardView.h"
      header "RCPluginBoardView.h"

      header "RCExtensionMessageCellInfo.h"
      header "RCExtensionModule.h"

      header "RCConversationDetailContentView.h"
      header "RCConversationStatusView.h"

      header "RCConversationSettingTableViewController.h"

      header "RCExtensionPluginItemInfo.h"

      export *
    }
    \EOF

    mkdir RongCloudIM/RongIMLib.framework/Modules
    touch RongCloudIM/RongIMLib.framework/Modules/module.modulemap
    cat <<-EOF > RongCloudIM/RongIMLib.framework/Modules/module.modulemap
    framework module RongIMLib {
      header "RongIMLib.h"
      header "RCIMClient.h"
      header "RCStatusDefine.h"
      header "RCChatRoomInfo.h"
      header "RCConversation.h"
      header "RCDiscussion.h"
      header "RCGroup.h"
      header "RCUserTypingStatus.h"
      header "RCCSLeaveMessage.h"
      header "RCCSPullLeaveMessage.h"
      header "RCCommandMessage.h"
      header "RCCommandNotificationMessage.h"
      header "RCContactNotificationMessage.h"
      header "RCDiscussionNotificationMessage.h"
      header "RCGroupNotificationMessage.h"
      header "RCImageMessage.h"
      header "RCInformationNotificationMessage.h"
      header "RCLocationMessage.h"
      header "RCMessage.h"
      header "RCMessageContent.h"
      header "RCMessageContentView.h"
      header "RCProfileNotificationMessage.h"
      header "RCPublicServiceCommandMessage.h"
      header "RCPublicServiceMultiRichContentMessage.h"
      header "RCPublicServiceRichContentMessage.h"
      header "RCRealTimeLocationEndMessage.h"
      header "RCRealTimeLocationStartMessage.h"
      header "RCRecallNotificationMessage.h"
      header "RCRichContentMessage.h"
      header "RCTextMessage.h"
      header "RCUnknownMessage.h"
      header "RCVoiceMessage.h"

      header "RCAMRDataConverter.h"
      header "RCTSMutableDictionary.h"
      header "RCUtilities.h"
      header "interf_dec.h"
      header "interf_enc.h"

      header "RCCSLeaveMessageItem.h"
      header "RCCustomerServiceInfo.h"
      header "RCEvaluateItem.h"

      header "RCChatRoomMemberInfo.h"
      header "RCCustomerServiceGroupItem.h"
      header "RCPublicServiceMenu.h"
      header "RCPublicServiceProfile.h"
      header "RCRealTimeLocationManager.h"
      header "RCStatusMessage.h"
      header "RCUploadImageStatusListener.h"
      header "RCUploadMediaStatusListener.h"
      header "RCUserInfo.h"
      header "RCWatchKitStatusDelegate.h"

      header "RCFileMessage.h"
      header "RCFileUtility.h"
      header "RCReadReceiptInfo.h"
      header "RCUserOnlineStatusInfo.h"

      header "RCFwLog.h"

      header "RCMentionedInfo.h"
      
      header "RCCustomerServiceConfig.h"
      header "RCPushProfile.h"
      header "RCSearchConversationResult.h"

      header "RCPublicServiceMenuItem.h"

      header "RCRichContentItem.h"

      header "RCRealTimeLocationCommonDefine.h"

      export *
    }
    \EOF
    EOF

  s.requires_arc = true

end