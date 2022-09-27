#import "RNNLayoutProtocol.h"
#import <React/RCTUIManager.h>

@interface RNNTopTabsViewController : UIViewController <RNNLayoutProtocol>

@property(nonatomic, retain) UIView *contentView;

- (instancetype)initWithLayoutInfo:(RNNLayoutInfo *)layoutInfo
                           creator:(id<RNNComponentViewCreator>)creator
                           options:(RNNNavigationOptions *)options
                    defaultOptions:(RNNNavigationOptions *)defaultOptions
                         presenter:(RNNBasePresenter *)presenter
                      eventEmitter:(RNNEventEmitter *)eventEmitter
              childViewControllers:(NSArray *)childViewControllers;

- (void)setViewControllers:(NSArray *)viewControllers;
- (void)viewController:(UIViewController *)vc changedTitle:(NSString *)title;
- (instancetype)init;

@end
