<head>
    <title>Autoservis FastCar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
 </head>

 <body style="padding-top: 90; background-color: whitesmoke">    
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top">
    <h1 class="navbar-brand">Autoservis FastCar</h1>
        <div class="container">
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <?php foreach($polozky as $p): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo base_url("stranka/".$p->idmenu)?>"><?= $p->categorie ?><span class="sr-only">(current)</span></a>
                        </li>
                        <?php endforeach; ?>
                    </ul>
                    </ul>
      <form action="<?php echo base_url("auth/login"); ?>">
            <button type="submit">Přihlásit se</button>
      </form>
  </div>
</nav>
    </body>
</html>
                </div>
        </div>
    </nav> 