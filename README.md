# locationManagerHelper
helper class for location manager

#

```
LocationManagerHelper.singleton.sharedInstance.loadInit();
LocationManagerHelper.singleton.sharedInstance.setHelperDelegate(del: self as LocationHelperDelegate);
```

Delegate method
```
extension class_name:LocationHelperDelegate {
    func getLatAndLonCurrentLocation(strLat: String, AndLng lng: String) {
        //code
    }
    
    func didNotAuthorizeForFetchLocation() {
        //code
    }
}
```
       
