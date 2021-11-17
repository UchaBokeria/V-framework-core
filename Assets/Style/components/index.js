$(".toggle-btn-value").click(function () {
  var mainParent = $(this).parent(".toggle-btn");
  if ($(mainParent).find("input.toggle-btn-value").is(":checked")) {
    $(mainParent).addClass("active");
  } else {
    $(mainParent).removeClass("active");
  }
});

$(".statement-favorite").click(function () {
  if ($(this).hasClass("icon-favorite")) {
    $(this).addClass("icon-selectedFavorite");
    $(this).removeClass("icon-favorite");
  } else {
    $(this).addClass("icon-favorite");
    $(this).removeClass("icon-selectedFavorite");
  }
});
