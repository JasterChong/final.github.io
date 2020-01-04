$(document).ready(function () {

  const changeText = function (el, text, color) {
    el.text(text).css('color', color);
  };


  $('.pww').keyup(function () {
    let len = this.value.length;
    const pbText = $('.sign-up-form .progress-bar-text');

    if (len === 0) {
      $(this).css('border-color', '#2F96EF');
      changeText(pbText, 'Password is Blank', '#454545');
    } else if (len > 0 && len <= 4) {
      $(this).css('border-color', '#FF4B47');
      changeText(pbText, 'Too Weak', '#FF4B47');
    } else if (len > 4 && len <= 8) {
      $(this).css('border-color', '#F9AE35');
      changeText(pbText, 'Could be Stronger', ' chocolate');
    } else {
      $(this).css('border-color', '#2DAF7D');
      changeText(pbText, 'Strong Password', '#2DAF7D');
    }
  });

});
