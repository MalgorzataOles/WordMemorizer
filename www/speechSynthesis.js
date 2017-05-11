$(document).ready(function() {
  
  // handling different langages
  speaklang = $('#lang option:selected').text();
  $('#lang').change(function() {
    speaklang = $(this).val();
  });
    
  // handling the speech synthesis
  $("#submit").click(function() {
      Shiny.addCustomMessageHandler("speakme",
      function(number) {
        if(!$("#speak").is(':checked')) {
          number="";
        }
        var msg = new SpeechSynthesisUtterance(number);
        msg.lang = speaklang;
        window.speechSynthesis.speak(msg);
      });
  });
 
});
