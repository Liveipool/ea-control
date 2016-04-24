module.exports = class Abstract-data-entry
  @get-random-serial = -> Math.random! * 10 ^ 16

  @get-random-datetime-between = (start, end)->
    start = @convert-to-date start
    end = @convert-to-date end
    @_get-random-datetime-between start, end

  @A_DAY = 24h * 60m * 60s * 1000ms
  @FIFTY_YEARS = 50y * 365d 
  @convert-to-date = (datetime)->
    return datetime if datetime instanceof Date
    return the-time-before = new Date ((new Date - 0) + @A_DAY * datetime) if typeof datetime is 'number' and Math.abs datetime < @FIFTY_YEARS
    return new Date datetime if typeof datetime is 'number'
    throw new Error "can't create date for: ", datetime

  @_get-random-datetime-between = (start, end)-> 
    # console.log "start: ", start
    # console.log "end: ", end
    start - 0 + Math.random! * (end - start)
    # new Date (start - 0 + Math.random! * (end - start))

  ->
    @_id = @@@id++






/*var AbstractDataEntry;
module.exports = AbstractDataEntry = (function(){
  AbstractDataEntry.displayName = 'AbstractDataEntry';
  var prototype = AbstractDataEntry.prototype, constructor = AbstractDataEntry;
  AbstractDataEntry.getRandomSerial = function(){
    return Math.random() * Math.pow(10, 16);
  };
  AbstractDataEntry.getRandomDatetimeBetween = function(start, end){
    start = this.convertToDate(start);
    end = this.convertToDate(end);
    return this._getRandomDatetimeBetween(start, end);
  };
  AbstractDataEntry.A_DAY = 24 * 60 * 60 * 1000;
  AbstractDataEntry.FIFTY_YEARS = 50 * 365;
  AbstractDataEntry.convertToDate = function(datetime){
    var theTimeBefore;
    if (datetime instanceof Date) {
      # 语法：object(要检测的对象) instanceof constructor(某个构造函数) 检测constructor.prototype是否在object的原型链上
      # // 定义构造函数
      # function C(){} 
      # function D(){} 
      # var o = new C();
      # o instanceof C;  true，因为 Object.getPrototypeOf(o) === C.prototype
      # o instanceof D;  false，因为 D.prototype不在o的原型链上
      return datetime;
    }
    if (typeof datetime === 'number' && Math.abs(datetime < this.FIFTY_YEARS)) {
      return theTimeBefore = new Date((new Date - 0) + this.A_DAY * datetime);
    }
    if (typeof datetime === 'number') {
      return new Date(datetime);
    }
    throw new Error("can't create date for: ", datetime);
  };
  AbstractDataEntry._getRandomDatetimeBetween = function(start, end){
    return start - 0 + Math.random() * (end - start);
  };
  function AbstractDataEntry(){
    this._id = this.constructor.id++;
  }
  return AbstractDataEntry;
}());*/