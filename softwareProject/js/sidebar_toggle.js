// not use jQuery

// let btn = document.querySelector("#btn");
// let sidebar = document.querySelector(".sidebar");
// let searchInput = document.querySelector(".search_box");

// btn.onclick = function () {
//   sidebar.classList.toggle("active");
// };

//use jQuery
//id=btn이 클릭되면 id=sidebar에 class=active 속성을 추가 제거
$(document).ready(function () {
  $("#btn").on("click", function () {
    $("#sidebar").toggleClass("active");
  });

  //id=search_box가 클릭되면 id=sidebar의 클래스중 active를 제거
  $("#search_box").on("click", function () {
    $("#sidebar").removeClass("active");
  });
});

$(document).ready(function () {
  var currentPosition = parseInt($(".quickmenu").css("top"));
  $(window).scroll(function () {
    var position = $(window).scrollTop();
    $(".quickmenu")
      .stop()
      .animate({ top: position + currentPosition + "px" }, 500);
  });
});
