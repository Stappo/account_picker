import UIKit
import Flutter
import CloudKit

public class SwiftAccountPickerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "account_picker", binaryMessenger: registrar.messenger())
    let instance = SwiftAccountPickerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "requestAccountId") {
          let container = CKContainer.default()
          container.fetchUserRecordID { (recordId, error) in
              if error != nil {
                  result(FlutterError(code: "error fetchUserRecordID", message: error?.localizedDescription, details: nil))
              } else {
                  container.requestApplicationPermission(.userDiscoverability) { [weak self] (status, error) in
                      print (status.rawValue)
                      
                      container.discoverUserIdentity(withUserRecordID: recordId!, completionHandler: { (userID, error) in
                          let desc = userID?.lookupInfo?.userRecordID?.recordName
                          print(desc)
                          result(desc)
                      })
                  }
              }
          }
      } else {
          result("Method not implement")
      }
      
  }
}
