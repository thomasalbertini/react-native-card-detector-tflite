#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>

#if __has_include(""card-detector-tflite"/"card-detector-tflite"-Swift.h")
#import ""card-detector-tflite"/"card-detector-tflite"-Swift.h"
#else
#import ""card-detector-tflite"-Swift.h"
#endif

VISION_EXPORT_SWIFT_FRAME_PROCESSOR(cardDetectorTflitePlugin, detectCard)