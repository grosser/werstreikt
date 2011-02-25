//DATE
Date.shortMonths = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
Date.prototype.formatted = function(){
  return this.getDate()+' '+Date.shortMonths[this.getMonth()]+' '+this.getFullYear();
};

//STRING
String.prototype.toDate = function(){
  var d = new Date();
  d.setTime(Date.parse(this));
  return d;
};

String.prototype.truncate = function(to_length){
  if(to_length >= this.length)return this;
  return this.substring(0, to_length-3)+'...';
};
