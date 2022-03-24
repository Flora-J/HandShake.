//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<is_24_hour_format/Respect24HourPlugin.h>)
#import <is_24_hour_format/Respect24HourPlugin.h>
#else
@import is_24_hour_format;
#endif

#if __has_include(<sqflite/SqflitePlugin.h>)
#import <sqflite/SqflitePlugin.h>
#else
@import sqflite;
#endif

#if __has_include(<survey_kit/SurveyKitPlugin.h>)
#import <survey_kit/SurveyKitPlugin.h>
#else
@import survey_kit;
#endif

#if __has_include(<video_player_avfoundation/FLTVideoPlayerPlugin.h>)
#import <video_player_avfoundation/FLTVideoPlayerPlugin.h>
#else
@import video_player_avfoundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [Respect24HourPlugin registerWithRegistrar:[registry registrarForPlugin:@"Respect24HourPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  [SurveyKitPlugin registerWithRegistrar:[registry registrarForPlugin:@"SurveyKitPlugin"]];
  [FLTVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTVideoPlayerPlugin"]];
}

@end
