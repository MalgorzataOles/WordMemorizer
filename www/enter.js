$(document).ready(function(){
  $("#answer").keydown(function(event){
    if(event.which == 13){
        $("#submit").click();
    }
  });
});
