
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><php echo $title; ?></title>
        <link rel="stylesheet" tpye="text/css" href="Styles/Stylesheet.css" />
    </head>
    <body>
         <div id="wrapper"> 
             <div id="banner"> 
                 
             </div>
             
             <nav id="navigation">
                 <ul id="nav"> 
                     <li><a href="index.php">Kezdőlap</a></li>
                     <li><a href="#">ÚjSzervíz</a></li>
                     <li><a href="#">KészSzervíz</a></li>
                     <li><a href="#">Számla</a></li>
                 </ul>
             </nav>
             
             <div id="content_area">
                 <?php echo $content ?>    
             </div>

             <div id="sidebar"
                  
             </div>
             
             <footer> 
                 <p>All rights reserved</p> 
             </footer>
        </div> 
    </body>
</html>