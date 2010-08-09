<cfset variables.SECONDS_BETWEEN_SLIDES=2>
<cfset variables.SECONDS_FOR_DISSOLVE=1>
<cfset variables.WIDTH=375>
<cfset variables.HEIGHT=250>

<cfif not isDefined("url.debug")><cfsetting showdebugoutput="false"><cfcontent type="text/javascript"></cfif>
$(document).ready(function (){
	stylesheet = document.createElement('link');stylesheet.rel = 'stylesheet';stylesheet.type = 'text/css';stylesheet.media = 'all';stylesheet.href='slideshow/slideshow.css';head = document.getElementsByTagName('head').item(0);head.appendChild(stylesheet);
	$("#slideshow").empty();
	<cfsetting enablecfoutputonly="true">
<cfset request.last_modified=0>
<cfdirectory action="list" directory="#ExpandPath('../slideshow')#" name="SlideshowImages" filter="*.jpg">
<cfloop query="SlideshowImages">
	<cfset request.last_modified=CreateODBCDateTime(Max(SlideshowImages.dateLastModified,request.last_modified))>
	<cfoutput>$("<img>").attr('src','slideshow/#SlideshowImages.name#').attr('width',#variables.WIDTH#).attr('height',#variables.HEIGHT#).appendTo('##slideshow');</cfoutput>
</cfloop>
<cfsetting enablecfoutputonly="false">
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
			.animate({opacity: 1.0}, <cfoutput>#(variables.SECONDS_FOR_DISSOLVE*1000)#</cfoutput>, function() {
				$active.removeClass('active last-active');
			});
	}
	
	setInterval(slideSwitch, <cfoutput>#(variables.SECONDS_BETWEEN_SLIDES*1000)#</cfoutput> );

});

<cfset request.mime_type="text/javascript">