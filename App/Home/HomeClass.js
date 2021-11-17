// Home Carousel
var homeCarousel = new Slider({
  data: { route: "Home", act: "readVips", vip: 1 },
  area: "#homeCarousel",
  type: "carousel",
  scrollHide: false,
  class: ["home-carousel"],
  buttons: {
    left: true,
    right: true,
  },
  scrollHide: true,
  template: "<img src='Assets/Uploads/{dir}'>",
  cell: {
    class: ["slider-cell"],
    attributes: [
      "cell-id",
      "dir",
      "title",
      "description",
      "bedrooms",
      "rooms",
      "price",
      "space",
      "floor",
    ],
    gap: 0,
    width: "100%",
  },
});

// Super Vip Statemens Slider
var SuperVipHomeStatementSlider = new Slider({
  data: { route: "Home", act: "readVips", vip: 1 },
  area: "#SuperVipHomeStatementSlider",
  type: "slider",
  scrollHide: false,
  class: ["home-carousel"],
  buttons: {
    left: true,
    right: true,
  },
  scrollHide: true,
  template: `<div class="statement-card">
    <div class="statement-image">
      <img src="http://localhost/RealEstateProject/Assets/Uploads/statement.jpg" alt="#" />
      <div class="statement-status s-vip">
          <p>S-VIP</p>
        </div>
        <div class="favorite">
          <i class="icon-favorite statement-favorite"></i>
        </div>
    </div>
    <div class="statement-description">
      <h1>Apartment for Sale</h1>
      <div class="price-area">
        <div class="price">
          <p>15000</p>
          <div class="statement-currency"><span>$</span></div>
        </div>
        <div class="area">
          <i class="icon-area"></i>
          <p>250 m²</p>
        </div>
      </div>
      <div class="statement-properties">
        <span><i class="icon-door"></i> Rooms 5</span>
        <span><i class="icon-bed"></i> Bedrooms 5</span>
        <span><i class="icon-floor"></i> Floor 5</span>
      </div>
      <p class="statement-desc">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam.
      </p>
    </div>
  </div>`,
  cell: {
    class: ["slider-cell"],
    attributes: [
      "cell-id",
      "dir",
      "title",
      "description",
      "bedrooms",
      "rooms",
      "price",
      "space",
      "floor",
    ],
    gap: "5vw",
    width: "20%",
  },
});

// Vip Statemens Slider
var VipHomeStatementSlider = new Slider({
    data: { route: "Home", act: "readVips", vip: 1 },
    area: "#VipHomeStatementSlider",
    type: "slider",
    scrollHide: false,
    class: ["home-carousel"],
    buttons: {
      left: true,
      right: true,
    },
    scrollHide: true,
    template: `<div class="statement-card">
      <div class="statement-image">
        <img src="http://localhost/RealEstateProject/Assets/Uploads/statement.jpg" alt="#" />
        <div class="statement-status vip">
          <p>VIP</p>
        </div>
        <div class="favorite">
          <i class="icon-favorite statement-favorite"></i>
        </div>
      </div>
      <div class="statement-description">
        <h1>Apartment for Sale</h1>
        <div class="price-area">
          <div class="price">
            <p>15000</p>
            <div class="statement-currency"><span>$</span></div>
          </div>
          <div class="area">
            <i class="icon-area"></i>
            <p>250 m²</p>
          </div>
        </div>
        <div class="statement-properties">
          <span><i class="icon-door"></i> Rooms 5</span>
          <span><i class="icon-bed"></i> Bedrooms 5</span>
          <span><i class="icon-floor"></i> Floor 5</span>
        </div>
        <p class="statement-desc">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam.
        </p>
      </div>
    </div>`,
    cell: {
      class: ["slider-cell"],
      attributes: [
        "cell-id",
        "dir",
        "title",
        "description",
        "bedrooms",
        "rooms",
        "price",
        "space",
        "floor",
      ],
      gap: "5vw",
      width: "20%",
    },
  });

// Regular Statemens Slider
  var HomeStatementSlider = new Slider({
    data: { route: "Home", act: "readVips", vip: 1 },
    area: "#homeStatementSlider",
    type: "slider",
    scrollHide: false,
    class: ["home-carousel"],
    buttons: {
      left: true,
      right: true,
    },
    scrollHide: true,
    template: `<div class="statement-card">
      <div class="statement-image">
        <img src="http://localhost/RealEstateProject/Assets/Uploads/statement.jpg" alt="#" />
        <div class="favorite">
          <i class="icon-favorite statement-favorite"></i>
        </div>
      </div>
      <div class="statement-description">
        <h1>Apartment for Sale</h1>
        <div class="price-area">
          <div class="price">
            <p>15000</p>
            <div class="statement-currency"><span>$</span></div>
          </div>
          <div class="area">
            <i class="icon-area"></i>
            <p>250 m²</p>
          </div>
        </div>
        <div class="statement-properties">
          <span><i class="icon-door"></i> Rooms 5</span>
          <span><i class="icon-bed"></i> Bedrooms 5</span>
          <span><i class="icon-floor"></i> Floor 5</span>
        </div>
        <p class="statement-desc">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam.
        </p>
      </div>
    </div>`,
    cell: {
      class: ["slider-cell"],
      attributes: [
        "cell-id",
        "dir",
        "title",
        "description",
        "bedrooms",
        "rooms",
        "price",
        "space",
        "floor",
      ],
      gap: "5vw",
      width: "20%",
    },
  });


// Currency Toggle Button
$('.toggle-btn-value').click(function() {
    var mainParent = $(this).parent('.toggle-btn');
    if($(mainParent).find('input.toggle-btn-value').is(':checked')) {
      $(mainParent).addClass('active');
    } else {
      $(mainParent).removeClass('active');
    }
  
  })

// Heart Button 
$(".statement-favorite").click(function () {
    console.log('working')
    if ($(this).hasClass("icon-favorite")) {
      $(this).addClass("icon-selectedFavorite");
      $(this).removeClass("icon-favorite");
    } else {
      $(this).addClass("icon-favorite");
      $(this).removeClass("icon-selectedFavorite");
    }
  });