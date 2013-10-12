//
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

- (NSString*)getBaseURL;
- (NSUserDefaults*)getUserDefaults;
- (NSString *)formatTimeAndDateStamp:(NSString*)timeAndDateFormat WithStringToFormat:(NSString*)stringToFormat;
- (void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;
- (UIImage *) getImageFromURL:(NSString *)fileURL;
- (NSString *)getDocumentsDirectoryPath;
- (UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;
//- (BOOL) pingServer;
//-(BOOL)hasConnectivity;

@end
