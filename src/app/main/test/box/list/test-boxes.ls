create-boxes = (boxes)-> [create-box box for box in boxes]

create-box = (box)->
  # last-execntion = Test-execution.get-lastest-test-of-box box._id
  last-execution =
    test-plan : 'b36自动洗测试'
    tester : '李斯斯'
    result : '通过'
    end-time : '三天前'

  current-execution =
    test-plan : 't121双速洗测试'
    tester : '赵武'
    total-steps : 16
    completed-steps : 3
    start-time : "3'12''"
    estimate-end-time : "5'31''"

  r = Math.random! 
  switch
  | r < 0.3         =>  box.last-execution = last-execution 
  | 0.3 < r < 0.8   =>  box.current-execution = current-execution
  | otherwise       =>  # brand-new

  box 

angular.module 'app.test', []
  
.config ($state-provider, $translate-partial-loader-provider, ms-navigation-service-provider)!->
  
    $state-provider.state 'app.test.boxes', {
      url: '/test/boxes'
      resolve: data: (api-resolver)-> api-resolver.resolve('testBoxes@get')
      views:
        'content@app':
          template-url: 'app/main/test/box/list/test-boxes.html'
          # controller: (boxes, $scope)!->
          controller-as: 'vm'
          controller: (data, $scope)!->
            # console.log "boxes: ", data.boxes[1]
            @boxes = create-boxes data.boxes # 这个函数其实这是给boxes数组里的每个对象添加了一个状态属性，其他属性都没有删减
            # console.log "@boxes: ", @boxes[1]
    }





/*var createBoxes, createBox;
createBoxes = function(boxes){
  var i$, len$, box, results$ = [];
  for (i$ = 0, len$ = boxes.length; i$ < len$; ++i$) {
    box = boxes[i$];
    results$.push(createBox(box));
  }
  return results$;
};
createBox = function(box){
  var lastExecution, currentExecution, r;
  lastExecution = {
    testPlan: 'b36自动洗测试',
    tester: '李斯斯',
    result: '通过',
    endTime: '三天前'
  };
  currentExecution = {
    testPlan: 't121双速洗测试',
    tester: '赵武',
    totalSteps: 16,
    completedSteps: 3,
    startTime: "3'12''",
    estimateEndTime: "5'31''"
  };
  r = Math.random();
  switch (false) {
  case !(r < 0.3):
    box.lastExecution = lastExecution;
    break;
  case !(0.3 < r && r < 0.8):
    box.currentExecution = currentExecution;
    break;
  default:

  }
  return box;
};
angular.module('app.test').config(function($stateProvider, $translatePartialLoaderProvider, msNavigationServiceProvider){
  $stateProvider.state('app.test.boxes', {
    url: '/test/boxes',
    resolve: {
      data: function(apiResolver){
        return apiResolver.resolve('testBoxes@get');
      }
    },
    views: {
      'content@app': {
        templateUrl: 'app/main/test/box/list/test-boxes.html',
        controllerAs: 'vm',
        controller: function(data, $scope){
          this.boxes = createBoxes(data.boxes);
        }
      }
    }
  });
});*/
/**/