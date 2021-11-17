$(function () {
  $(".toggle-btn-value").click(function () {
    var mainParent = $(this).parent(".toggle-btn");
    if ($(mainParent).find("input.toggle-btn-value").is(":checked")) {
      $(mainParent).addClass("active");
    } else {
      $(mainParent).removeClass("active");
    }
  });
  let statementsContainer = $(".statements-container");
  var statementCard = $(".statement-card");
  var statementViewBtn = $(".estate-view");

  $(statementViewBtn).click(function () {
    $(statementsContainer).toggleClass("v-statements-container");
    document.querySelectorAll('.statement-card').forEach((e) => {
      e.classList.toggle('vertical')
    })
  });
});

var estateDropdown = new DropDown({
  data: {
    route: "Estate",
    act: "sortRead",
  },
  area: "#estateDropdown",
  output: "title",
  trigger: "#estateDropdown",
  class: ["container"],
  options: {
    chosen: { title: "Apartments" },
    attributes: ["title"],
    class: ["optionies", "estate-categories"],
  },
});