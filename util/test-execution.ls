module.exports = class Test-execution extends require './abstract-data-entry'
  @id = 1
  @release-date = new Date
  ->
    super ...
    @start-time = 1 * @@@get-random-datetime-between start = -100 * Math.random!, end = start + Math.random!
    # console.log "start-time: ", @start-time
    @end-time = 1 * @@@get-random-datetime-between @start-time, @start-time + Math.random! * 3 * A_HOUR = 60m * 60s * 1000ms
    # console.log "end-time: ", @end-time
    if Math.random! > success-rate = 0.8
      @result = 'FAIL'
      @reason = '双速电机调速失败'
    else
      @result = 'PASS'
    @ea-box = 
      _id : id = if Math.random! > 0.2 then 1 else  ~~(9 * Math.random!) + 2
      name: "测试盒 #id"
    @test-plan =
      _id : id = if Math.random! > 0.2 then 1 else 2
      name: if id is 1 then 'b36自动洗测试' else 't121双速洗测试'
    @tester = 
      _id : id = if Math.random! > 0.2 then 1 else 2
      name: if id is 1 then '张珊' else '李斯'

    @steps = 3 + ~~(Math.random! * 30)






/*var TestExecution;
module.exports = TestExecution = (function(superclass){
  var prototype = extend$((import$(TestExecution, superclass).displayName = 'TestExecution', TestExecution), superclass).prototype, constructor = TestExecution;
  TestExecution.id = 1;
  TestExecution.releaseDate = new Date;
  function TestExecution(){
    var start, end, A_HOUR, successRate, id;
    TestExecution.superclass.apply(this, arguments);
    this.startTime = 1 * this.constructor.getRandomDatetimeBetween(start = -100 * Math.random(), end = start + Math.random());
    this.endTime = 1 * this.constructor.getRandomDatetimeBetween(this.startTime, this.startTime + Math.random() * 3 * (A_HOUR = 60 * 60 * 1000));
    if (Math.random() > (successRate = 0.8)) {
      this.result = 'FAIL';
      this.reason = '双速电机调速失败';
    } else {
      this.result = 'PASS';
    }
    this.eaBox = {
      _id: id = Math.random() > 0.2
        ? 1
        : ~~(9 * Math.random()) + 2,
      name: "测试盒 " + id
    };
    this.testPlan = {
      _id: id = Math.random() > 0.2 ? 1 : 2,
      name: id === 1 ? 'b36自动洗测试' : 't121双速洗测试'
    };
    this.tester = {
      _id: id = Math.random() > 0.2 ? 1 : 2,
      name: id === 1 ? '张珊' : '李斯'
    };
    this.steps = 3 + ~~(Math.random() * 30);
  }
  return TestExecution;
}(require('./abstract-data-entry')));
function extend$(sub, sup){
  function fun(){} fun.prototype = (sub.superclass = sup).prototype;
  (sub.prototype = new fun).constructor = sub;
  if (typeof sup.extended == 'function') sup.extended(sub);
  return sub;
}
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}*/