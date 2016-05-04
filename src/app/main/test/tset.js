angular.module('app.test')

.factory('boxService', function(apiResolver, $rootScope) {
  var boxService;
  return boxService = {
    getBoxDetail : function(Id, Status) {
      var lastExecution_, currentExecution_, box;
      // resolve : {
      //   _executions : function(apiResolver) {
      //     return apiResolver.resolve(testExecutions@get)
      //   }
      // };
      // _executions = apiResolver.resolve(testExecutions@get);
      // for (var i = 0; i < _executions.executions.length; i++)
      //   executions_[i] = _executions.executions[i];
       lastExecution_ = {
         testPlan : 'b36自动洗测试',
         tester : '李斯斯',
         result : '通过',
         endTime : '三天前'
      };
      currentExecution_ = {
        testPlan: 't121双速洗测试',
        tester: '赵武',
        totalSteps: 16,
        completedSteps: 3,
        startTime: "3'12''",
        estimateEndTime: "5'31''"
      };
      return box = {
        _id : Id,
        name : "测试盒 " + Id,
        lastExecution : Status != 0 ? lastExecution_ : void 8,
        currentExecution : Status == 2 ? currentExecution_ : void 8
      }
    }
  }
})

.filter('dateTimeShort', function() {
	return function() {

	};
});