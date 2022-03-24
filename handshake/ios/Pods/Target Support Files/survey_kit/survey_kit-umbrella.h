#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SurveyKitPlugin.h"

FOUNDATION_EXPORT double survey_kitVersionNumber;
FOUNDATION_EXPORT const unsigned char survey_kitVersionString[];

