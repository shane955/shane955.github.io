var main = function() {
  var volume;
  //The PLAY button
  $('#play').click(function() {
    $('#message').text("Playing track");
    $('#player').trigger("play");
  });

  //The pause button 
  $('#pause').click(function() {
    $('#message').text("Track paused");
    $('#player').trigger("pause");
  });

  //THE MUTE button
   $('#mute').click(function() {
    $('#message').text("Track muted");
    $('#player').prop("muted", true);
  });
  
 //THE UNMUTE button
  $('#unmute').click(function() {
    $('#message').text("playing track");
    $('#player').prop("muted", false);
  });

  //THE stop button
  //set the current time to 0
  // and then pause the track
  $('#stop').click(function() {
    $('#message').text("track stopped");
    $("#player").prop("currentTime",0);
    $('#player').trigger("pause");
  });

  //THE volumeUp button
  $('#up').click(function() {
    volume = $("#player").prop("volume");
    volume = volume + 0.1;
    $("#player").prop("volume", volume);
  });
//THE volumeDown button
  $('#down').click(function() {
    volume = $("#player").prop("volume");
    volume = volume - 0.1;
    $("#player").prop("volume", volume);
  });
  
}
$(document).ready(main);