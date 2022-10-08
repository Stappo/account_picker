#import "AccountPickerPlugin.h"
#if __has_include(<account_picker/account_picker-Swift.h>)
#import <account_picker/account_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "account_picker-Swift.h"
#endif

@implementation AccountPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAccountPickerPlugin registerWithRegistrar:registrar];
}
@end
