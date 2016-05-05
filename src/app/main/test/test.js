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
      var new_execution, cur_name;
      console.log("$rootScope.currentUser1111: ", $rootScope.currentUser);
      return new_execution = {
        _id : 200,
        box : {
          _id : box_id,
          name : '测试盒 ' + box_id
        },
        tester : {
          _id : 1,
          name : (cur_name = $rootScope.currentUser) != null ? cur_name.fullname : void 8
        },
        testPlan : {
          _id: 1,
          testPackage: 'midea-kitchen-tests',
          packageName: 'midea-kitchen-tests/bin',
          testName: 'b36/分步测试/分步测试'
        }
      };
    },
    getNewExecution : function(new_execution_id, box_id, tester_name) {
      var new_execution_info, cur_name;
      // console.log("$rootScope.currentUser2222: ", $rootScope.currentUser);
      return new_execution_info = {
        _id : new_execution_id,
        box : {
          _id : box_id,
          name : '测试盒' + box_id
        },
        tester : {
          _id : 1,
          name : tester_name
        },
        testPlan : {
          _id: 1,
          testPackage: 'midea-kitchen-tests',
          packageName: 'midea-kitchen-tests/bin',
          testName: 'b36/分步测试/分步测试'
        },
        startTime : Date.now()
      };
    }
  }
})

.filter('dateTimeNearShortFarFull', function() {
  return function(dateTimeNum) {
    var lessThanAnHour;
    if (lessThanAnHour = Date.now() - dateTimeNum < 60 * 60 * 1000)
      return moment(new Date(dateTimeNum)).fromNow();
    else
      return moment(new Date(dateTimeNum)).format('LLL');
  };
})

.filter('duration', function() {
  return function(durationNum) {
    var dur, y, M, d, h, m, s, totalTime;
    dur = moment.duration(durationNum);
    totalTime = '';
    y = dur.years();
    M = dur.months();
    d = dur.days();
    h = dur.hours();
    m = dur.minutes();
    s = dur.seconds();
    if (y) totalTime += y + '年';
    if (M) totalTime += M + '月';
    if (d) totalTime += d + '日';
    if (h) totalTime += h + '小时';
    if (m) totalTime += m + '分';
    if (s) totalTime += s + '秒';
    return totalTime;
  };
})