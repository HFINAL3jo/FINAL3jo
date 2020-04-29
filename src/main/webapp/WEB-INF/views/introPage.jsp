<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get inspired for your journey! - aligo</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.js"></script>
    <script async src="https://www.youtube.com/iframe_api"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto');

		/*Background*/
		* { 
		  box-sizing: border-box; 
		}
		.video-background {
		  background: #000;
		  position: fixed;
		  top: 0; right: 0; bottom: 0; left: 0;
		  z-index: -99;
		}
		#video-foreground, .video-background iframe {
		  position: absolute;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  pointer-events: none;
		}
		
		@media (min-aspect-ratio: 16/9) {
		  #video-foreground { height: 300%; top: -100%; }
		}
		@media (max-aspect-ratio: 16/9) {
		  #video-foreground { width: 300%; left: -100%; }
		}
		
		/*Content*/
		h1, p, i {
		  color: white;
		}
		p {
		  font-family: 'Roboto', sans-serif;
		  font-size: 16px;
		}
		h1 {
		  font-size: 68px;
		  /* font-family: 'Roboto', sans-serif; */
		  font-weight: 600;
		  /* text-transform: uppercase; */
		}
		.main-content {
		  margin-top: 15%;
		}
		#logo{
		    width: 20%;
		    height: auto;
		    background-image: initial;
		}
		.text-center{
		    text-align: center;
		    margin-top: 25%;
		}
		
		#go_to_index{
		    background-image: initial;
		    border: 1px solid #ffffff;
		    height: 60px;
		    width: 180px;
		    color: #fff;
		    margin-left: auto;
		    margin-right: auto;
		    font-weight: 800;
		    font-size: 1.5em;
		    line-height: 50px;
		    border-radius: 15px;
		}
		#video-foreground{
		    opacity: 0.6;
		}
		#go_to_index:hover{
			background-color:#fff;
			color:rgb(0,0,0,0.5);
		}
    </style>
</head>
<body>
	<div class="video-background">
		<div id="video-foreground" class="mute"></div>
	</div>
	<div class="container">
		<div class="col-md-12 main-content">
			<div class="text-center">
                    <img src="/spring/resources/images/logo2.png" id="logo" alt="">
                    <h1>welcome to aligo!</h1>
                    <!-- <p>This is a fully responsive, auto-play, auto-loop YouTube Video Background. You can use any video, just edit the JavaScript file. Try the sound icon below to enable/disable sound. The video running is from channel Space Videos and you can check the original <a href="https://www.youtube.com/watch?v=ddFvjfvPnqk">here</a>.</p>
                    -->
                    <div id="go_to_index" style="cursor:pointer;" onclick="location.href='main.do'">go to aligo</div>
                    
            </div>
				<span class="fa-stack fa-lg sound">
				  <i class="fa fa-circle-o fa-stack-2x"></i>
				  <i class="fa fa-volume-off fa-stack-1x volume-icon"></i>
				</span>
				<a href="https://www.facebook.com/viewlike.us" target="_blank">
					<span class="fa-stack fa-lg">
				  		<i class="fa fa-circle-o fa-stack-2x"></i>
				  		<i class="fa fa-facebook fa-stack-1x"></i>
					</span>
				</a>
				<a href="https://www.viewlike.us" target="_blank">
					<span class="fa-stack fa-lg">
				  		<i class="fa fa-circle-o fa-stack-2x"></i>
				  		<i class="fa fa-link fa-stack-1x"></i>
					</span>								
				</a>
			</div>
		</div>
    <script>
        var player; 

		    function onYouTubeIframeAPIReady() {
		    player = new YT.Player('video-foreground', {
		    videoId: '-76cD-yP10E', // YouTube Video ID
		    playerVars: {
		      autoplay: 1,        // Auto-play the video on load
		      controls: 0,        // Show pause/play buttons in player
		      showinfo: 0,        // Hide the video title
		      modestbranding: 1,  // Hide the Youtube Logo
		      loop: 1,            // Run the video in a loop
		      fs: 0,              // Hide the full screen button
		      cc_load_policy: 0, // Hide closed captions
		      iv_load_policy: 3,  // Hide the Video Annotations
		      autohide: 0,         // Hide video controls when playing
		      playlist: '-76cD-yP10E'
		    },
		    events: {
		      onReady: function(e) {
		        e.target.mute();
		      }
		    }
		  });
		}
		
		
		$(document).ready(function(e) {   
		  $('.sound').on('click', function(){
		    $('#video-foreground').toggleClass('mute');
		    $('.volume-icon').toggleClass('fa-volume-up', 'fa-volume-off');
		    if($('#video-foreground').hasClass('mute')){
		      player.mute();
		    } else {
		      player.unMute();
		    }
		  });
		});

    </script>
</body>
</html>