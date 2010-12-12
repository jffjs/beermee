function applyStarRating() {
  $('.auto-submit-star').rating({
    required: true,
    callback: function(value, link){
      $('form.rating').submit();
    }
  });
}

$(function(){
  applyStarRating();
});
