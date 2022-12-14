#import "RNNSideMenuChildVC.h"
#import "UIViewController+LayoutProtocol.h"
@interface RNNSideMenuChildVC ()

@property(readwrite) RNNSideMenuChildType type;
@property(nonatomic, retain) UIViewController<RNNLayoutProtocol> *child;

@end

@implementation RNNSideMenuChildVC

- (instancetype)initWithLayoutInfo:(RNNLayoutInfo *)layoutInfo
                           creator:(id<RNNComponentViewCreator>)creator
                           options:(RNNNavigationOptions *)options
                    defaultOptions:(RNNNavigationOptions *)defaultOptions
                         presenter:(RNNBasePresenter *)presenter
                      eventEmitter:(RNNEventEmitter *)eventEmitter
               childViewController:(UIViewController *)childViewController
                              type:(RNNSideMenuChildType)type {
    self = [self init];
    self.options = options;
    self.defaultOptions = defaultOptions;
    self.layoutInfo = layoutInfo;
    self.creator = creator;
    self.eventEmitter = eventEmitter;
    self.presenter = presenter;
    [self loadChildren:nil];
    [self.presenter bindViewController:self];
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self.presenter applyOptionsOnInit:self.resolveOptions];
    
    self.type = type;
    self.child = childViewController;
    return self;
}

- (void)render {
    [super render];

    [self addChildViewController:self.child];
    [self.child.view setFrame:self.view.bounds];
    [self.view addSubview:self.child.view];
    [self.view bringSubviewToFront:self.child.view];
    self.child.view.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [self.child.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.child.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.child.view.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.child.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];

    [self.child didMoveToParentViewController:self];
}

- (void)setChild:(UIViewController<RNNLayoutProtocol> *)child {
    _child = child;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.child.view.frame;
    frame.size.width = width;
    self.child.view.frame = frame;
}

- (UIViewController *)getCurrentChild {
    return self.child;
}

#pragma mark - UIViewController overrides

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.presenter getStatusBarStyle];
}

- (BOOL)prefersStatusBarHidden {
    return [self.presenter getStatusBarVisibility];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.presenter getOrientation];
}

- (BOOL)hidesBottomBarWhenPushed {
    return [self.presenter hidesBottomBarWhenPushed];
}

@end
