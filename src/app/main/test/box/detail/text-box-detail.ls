/*create-boxes = (boxes)-> [create-box box for box in boxes]

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

  box*/

angular.module 'app.test'
  
.config ($state-provider)!->
  
    $state-provider.state 'app.test.box-detail', {
      url: '/test/boxes/?id?status'
      resolve:
        # boxData: (api-resolver)-> api-resolver.resolve('testBoxes@get')
        data: (box-service, $state-params) -> box-service.get-box-detail $state-params.id, $state-params.status
        executionData: (api-resolver)-> api-resolver.resolve('testExecutions@get')
      views:
        'content@app':
          template-url: 'app/main/test/box/detail/test-box-detail.html'
          controller-as: 'vm'
          controller: (data, executionData, $scope, $stateParams)!->
            @box = data
            @executionData = executionData
            console.log "box-detail data: ", @box
            console.log "box-detail executionData", @executionData
            @box_id_num = parseInt(@box._id)
            # @boxes = create-boxes boxData.boxes
            # @boxes.execution = executionData
            # @box = @boxes[$stateParams.id - 1]
            # console.log "hahah: ", @box
            @length = 0
            # console.log "length1: ", @length
            # console.log "@executionData.executions[0].eaBox._id: ", typeof @executionData.executions[0].eaBox._id
            # console.log "@box._id: ", typeof @box_id_num
            for i from 0 to 199
              if @executionData.executions[i].eaBox._id == @box_id_num
                # console.log "hahahahhaha"
                @length++
            # console.log "length2: ", @length
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
  $stateProvider.state('app.test.box-detail', {
    url: '/test/boxex/:id',
    resolve: {
      data: function(apiResolver){
        return apiResolver.resolve('testBoxes@get');
      }  # 这里面这个return还不是完全理解
    },
    views: {
      'content@app': {
        templateUrl: 'app/main/test/box/detail/test-box-detail.html',
        controllerAs: 'vm',
        controller: function(data, $scope){
          console.log("box-detail: ", data);
          this.boxes = createBoxes(data.boxes);
        }
      }
    }
  });
});