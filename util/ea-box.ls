module.exports = class Ea-box extends require './abstract-data-entry'
  @id = 1
  (@name, @billing-status)->
    super ...
    @product-info = 
      rpi-serial: @@@get-random-serial!
      ea-box-version: '1.0'
      release-date: @@@get-random-datetime-between -100.1, 100
    @working-status = 'idle'









/*var EaBox;
module.exports = EaBox = (function(superclass){
  var prototype = extend$((import$(EaBox, superclass).displayName = 'EaBox', EaBox), superclass).prototype, constructor = EaBox;
  #上面这一排不知道在干嘛
  EaBox.id = 1;
  #这个id不知道是啥
  function EaBox(name, billingStatus){
    this.name = name;
    this.billingStatus = billingStatus;
    EaBox.superclass.apply(this, arguments);
    this.productInfo = {
      rpiSerial: this.constructor.getRandomSerial(),  #函数在abstract-data-entry里
      eaBoxVersion: '1.0',
      releaseDate: this.constructor.getRandomDatetimeBetween(-100.1, 100)  #函数在abstract-data-entry里
    };
    this.workingStatus = 'idle';
  }
  return EaBox;
}(require('./abstract-data-entry')));
function extend$(sub, sup){
  function fun(){} fun.prototype = (sub.superclass = sup).prototype;
  (sub.prototype = new fun).constructor = sub;
  if (typeof sup.extended == 'function') sup.extended(sub);
  return sub;
} #这个函数不理解
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
} #这个函数不理解*/