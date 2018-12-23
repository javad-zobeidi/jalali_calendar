#import "JalaliCalendarPlugin.h"
#import <jalali_calendar/jalali_calendar-Swift.h>

@implementation JalaliCalendarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJalaliCalendarPlugin registerWithRegistrar:registrar];
}
@end
