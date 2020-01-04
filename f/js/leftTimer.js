var timer = null;
function leftTimer(date) {
    clearTimeout(timer);
    var leftTime = new Date(date).getTime() - new Date().getTime(); //计算剩余的毫秒数
    if (leftTime <= 0) leftTime = 0;
    var days = parseInt(leftTime / 1000 / 60 / 60 / 24, 10); //计算剩余的天数
    var hours = parseInt(leftTime / 1000 / 60 / 60 % 24, 10); //计算剩余的小时
    var minutes = parseInt(leftTime / 1000 / 60 % 60, 10);//计算剩余的分钟
    var seconds = parseInt(leftTime / 1000 % 60, 10);//计算剩余的秒数
    days = paddingZero(days);
    hours = paddingZero(hours);
    minutes = paddingZero(minutes);
    seconds = paddingZero(seconds);
    document.getElementById("timer").innerHTML = `${days}天 ${hours}:${minutes}:${seconds}`;
    if (leftTime >= 0) {
        timer = setTimeout(`leftTimer('${date}')`, 1000);
    }
}
function paddingZero(i) { //将0-9的数字前面加上0，例1变为01
    return i < 10 ? "0" + i : i;
}
