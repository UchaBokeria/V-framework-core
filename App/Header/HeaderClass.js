// import Router from "../../modules/router.js";
//console.log(document.querySelectorAll("[route-me]"))
console.log("this is header");


$(function () {
  let burger = $('.navbar-toggler')
  navbar = $('.navbar')
  logo = $('.logo')


  $(burger).click(function () {
    $(this).toggleClass('active');
    $(navbar).toggleClass('navbar-active')
    $(logo).toggleClass('active')
    return false;
  })
})


var estateDropdown = new DropDown({
  data: {
    route: "Header",
    act: "readCategories",
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

var lang = new DropDown({
  data: {
      route: "Header",
      act: "readLanguages",
  },
  area: "#languageDropdown",
  output: "title",
  trigger: "#languageDropdown",
  class: ["container"],
  options: {
      chosen: { title: "Eng" },
      attributes: [ "title"],
      class: ["optionies", "languages"],
  } 
});