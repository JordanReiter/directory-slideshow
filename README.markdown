directory-slideshow lets you easily and quickly add a slideshow that transitions between all .jpg files in a directory. It depends on jQuery and either ColdFusion or PHP. The script is based on "A Simply jQuery Slideshow" by Jon Raasch.[1]

Simply place the .jpg files in the directory slideshow and put the slideshow directory in the same directory where you want to include the slideshow.

Then, in the head of the file, insert:

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="slideshow/"></script>

You can actually insert at the end of the file too if you'd like the script to load after everything else on the page.

Where you want the slideshow itself, insert
    <div id="slideshow">
        <img src="firstimage.jpg" class="active" />
    </div>

You can control the appearance of the slideshow by editing the slideshow.css file in the slideshow folder.

This setup assumes you have either PHP **or** ColdFusion set up. If you are using both, get rid of one of the file types in slideshow for a reliable response.

The sample images were random images pulled from Google images that were listed as "Labeled for Reuse".[2] If you wish for me to remove one of the images, let me know.

  [1]: http://jonraasch.com/blog/a-simple-jquery-slideshow
  [2]: http://www.google.com/images?as_q=landscape&um=1&hl=en&biw=1280&bih=618&&as_epq=&as_oq=&as_eq=&as_sitesearch=&safe=off&as_st=y&tbs=isch:1,isz:ex,iszw:400,iszh:300,iur:f