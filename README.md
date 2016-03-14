# CircleShape
*转载请注明出处*

<h3>使用说明:</h3>

1. 将文件拖到工程内，引入头文件

  `#import "CircleShapeView.h"`

2. 调用initWithFrame初始化方法

  `CircleShapeView *view = [[CircleShapeView alloc]initWithFrame:CGRectMake(0, 44, 200, 200)];`

3. 调用方法：

  `[view drawCircleShape];`

4. 添加到父视图

  `[self.view addSubview:view];`
