#import <Cocoa/Cocoa.h>
#import <UniformTypeIdentifiers/UniformTypeIdentifiers.h>

const char* native_choose_file(const char** ext_array, int count) {
    @autoreleasepool {
        NSMutableArray *extensions = [NSMutableArray array];

        for (int i = 0; i < count; i++) {
            NSString *ext = [NSString stringWithUTF8String:ext_array[i]];
            if ([ext isEqualToString:@"app"]) {
                [extensions addObject:UTTypeApplicationBundle];
            } else {
                UTType *type = [UTType typeWithFilenameExtension:ext];
                if (type) [extensions addObject:type];
            }
        }

        NSOpenPanel *panel = [NSOpenPanel openPanel];
        panel.allowedContentTypes = extensions;
        panel.canChooseFiles = YES;
        panel.canChooseDirectories = NO;
        panel.allowsMultipleSelection = NO;

        if ([panel runModal] == NSModalResponseOK) {
            // Return a copy of the string because the panel/URL will be deallocated
            return strdup([[panel.URL path] UTF8String]);
        }

        return NULL;
    }
}
