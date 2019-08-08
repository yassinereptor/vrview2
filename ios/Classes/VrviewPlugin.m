#import "VrviewPlugin.h"
#import "FlutterVr.h"

@implementation VrviewPlugin
    
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterVrFactory* vrFactory =
    [[FlutterVrFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:vrFactory withId:@"vrview"];
}
    
@end

