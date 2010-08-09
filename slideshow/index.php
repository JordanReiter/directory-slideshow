<?php
	$SECONDS_BETWEEN_SLIDES=2;
	$SECONDS_FOR_DISSOLVE=1;
	$WIDTH=375;
	$HEIGHT=250;
	header('Content-type: text/javascript');
?>

$(document).ready(function (){
	stylesheet = document.createElement('link');stylesheet.rel = 'stylesheet';stylesheet.type = 'text/css';stylesheet.media = 'all';stylesheet.href='slideshow/slideshow.css';head = document.getElementsByTagName('head').item(0);head.appendChild(stylesheet);
	$("#slideshow").empty();
	<?php
		$files = glob("./*.jpg");
		sort($files);
		foreach ($files as &$file)
		{
			print("$('<img>').attr('src','slideshow/$file').attr('width',$WIDTH).attr('height',$HEIGHT).appendTo('#slideshow');\n");
		}
	?>
	$("#slideshow IMG:first").addClass('active');
	function slideSwitch() {
		var $active = $('#slideshow IMG.active');
	
		if ( $active.length == 0 ) $active = $('#slideshow IMG:last');
	
		// use this to pull the imgs in the order they appear in the markup
		var $next =  $active.next().length ? $active.next()
			: $('#slideshow IMG:first');

		$active.addClass('last-active');
	
		$next.css({opacity: 0.0})
			.addClass('active')
			.animate({opacity: 1.0}, <?php echo ($SECONDS_FOR_DISSOLVE*1000); ?>, function() {
				$active.removeClass('active last-active');
			});
	}
	
	setInterval(slideSwitch, <?php echo ($SECONDS_BETWEEN_SLIDES*1000); ?> );

});