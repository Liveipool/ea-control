angular.module('app.test')

.factory('boxService', function(apiResolver, $rootScope) {
  var boxService;
  return boxService = {
    getBoxDetail : function(Id, Status) {
      var lastExecution_, currentExecution_, box;
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

.factory('testService', function(apiResolver, $rootScope) {
  var testService;
  return testService = {
    createExecution : function(box_id) {
      var new_execution, cur_id, cur_name;
      return new_execution = {
        _id : 200,
        box : {
          _id : box_id,
          name : '测试盒 ' + box_id
        },
        tester : {
          _id : (cur_id = $rootScope.currentUser) != null ? cur_id._id : void 8,
          name : (cur_name = $rootScope.currentUser) != null ? cur_name.fullname : void 8
        },
        testPlan : {
          _id: 1,
          testPackage: 'midea-kitchen-tests',
          packageName: 'midea-kitchen-tests/bin',
          testName: 'b36/分步测试/分步测试'
        }
      }
    }
  }
})

.filter('dateTimeShort', function() {
	return function() {

	};
});