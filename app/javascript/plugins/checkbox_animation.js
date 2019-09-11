
const toggleActive = () => { $(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});
};

export { toggleActive };

