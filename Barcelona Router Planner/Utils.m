//
//

#import "Utils.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <SystemConfiguration/SystemConfiguration.h>




@implementation Utils

- (NSString*)getBaseURL{
    return @"http://www.jaboston.com/";
}

- (NSString *)formatTimeAndDateStamp:(NSString*)timeAndDateFormat WithStringToFormat:(NSString*)stringToFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:timeAndDateFormat];
    NSDate *dateNSDate = [dateFormatter dateFromString:stringToFormat];
    [dateFormatter setDateFormat:@"EEE, dd MMMM yyyy, HH:mm"];
    NSString *sDateOutput = [dateFormatter stringFromDate:dateNSDate];
    NSLog(@"sDateOutput: %@", sDateOutput);
    return sDateOutput;
}

- (NSString *)getDocumentsDirectoryPath {
    NSString * documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    documentsDirectoryPath = [documentsDirectoryPath stringByAppendingString:@"/"];
    NSLog(@"Documents directory path: %@", documentsDirectoryPath);
    return documentsDirectoryPath;
}

- (UIImage *) getImageFromURL:(NSString *)fileURL {
    UIImage * result;
    
    NSData * img_data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:img_data];
    
    return result;
}

-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
        NSLog(@"Image named %@ wrote to %@", imageName, directoryPath);
    } else {
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
    }
}

-(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    
    return result;
}

- (NSUserDefaults*)getUserDefaults{
    NSUserDefaults *userDefaults = [NSUserDefaults  standardUserDefaults];
    return userDefaults;
}

//not for this project
//- (BOOL) pingServer
//{
//    NSURL *url = [NSURL URLWithString:@"http://www.jaboston.com/"];
//    NSURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    NSHTTPURLResponse *response = nil;
//    [NSURLConnection sendSynchronousRequest:request
//                          returningResponse:&response error:NULL];
//    NSLog(@"response was %@", response );
//    return NO;
//    
//}

// not for this project
//-(BOOL)hasConnectivity {
//    struct sockaddr_in zeroAddress;
//    bzero(&zeroAddress, sizeof(zeroAddress));
//    zeroAddress.sin_len = sizeof(zeroAddress);
//    zeroAddress.sin_family = AF_INET;
//    
//    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr*)&zeroAddress);
//    if(reachability != NULL) {
//        //NetworkStatus retVal = NotReachable;
//        SCNetworkReachabilityFlags flags;
//        if (SCNetworkReachabilityGetFlags(reachability, &flags)) {
//            if ((flags & kSCNetworkReachabilityFlagsReachable) == 0)
//            {
//                // if target host is not reachable
//                return NO;
//            }
//            
//            if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
//            {
//                // if target host is reachable and no connection is required
//                //  then we'll assume (for now) that your on Wi-Fi
//                return YES;
//            }
//            
//            
//            if ((((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
//                 (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0))
//            {
//                // ... and the connection is on-demand (or on-traffic) if the
//                //     calling application is using the CFSocketStream or higher APIs
//                
//                if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
//                {
//                    // ... and no [user] intervention is needed
//                    return YES;
//                }
//            }
//            
//            if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
//            {
//                // ... but WWAN connections are OK if the calling application
//                //     is using the CFNetwork (CFSocketStream?) APIs.
//                return YES;
//            }
//        }
//    }
//
//    return NO;
//}

@end
