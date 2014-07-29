#import <stdio.h>
#import "base.h"

@interface foo : BaseObject {
    BOOL boolProperty;
    id stringProperty;
}

@property (assign) BOOL boolProperty;
@property (copy) id stringProperty;

-(id) init;
-(void) bar;

@end

@implementation foo

@synthesize boolProperty;
@synthesize stringProperty;

-(id) init
{
    printf("%s\n", __PRETTY_FUNCTION__);
    return self;
}

-(void) bar
{
    printf("%s (1)\n", __PRETTY_FUNCTION__);
    self.boolProperty = YES;
    printf("%s (2)\n", __PRETTY_FUNCTION__);
    self.boolProperty = NO;
    printf("%s (3): %d\n", __PRETTY_FUNCTION__, (int)self.boolProperty);
    self.stringProperty = @"";
    printf("%s (4)\n", __PRETTY_FUNCTION__);
}

@end

int test_objc()
{
    id obj = [[foo alloc] init];
    [obj bar];
    [obj free];
    return 1;
}
