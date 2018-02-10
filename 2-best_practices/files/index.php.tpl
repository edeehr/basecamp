
 

    </body>
</html>

 <html>
    <head>
        <title>Test Page using httpd and php on AWS Linux instances</title>
    </head>

    <body>

        <h1> Welcome to <strong>2nd Watch Test Page for ${event} </strong> </h1>

            <p>This page is used to test the proper operation of httpd/php.  If you can read this page, it means that the web server installed at this site is working properly.</p>

            <p> Server Address: <?php echo $_SERVER['SERVER_NAME']; ?> </p>

    </body>
</html>