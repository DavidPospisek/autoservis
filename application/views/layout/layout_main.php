
    
 <nav class="navbar navbar-static-top navbar-inverse">
                <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="<?php echo base_url(); ?>">Hlavní nadpis</a>
                
                </div>
                
               
        <?php
            $this->load->view('layout/menu');
        ?>
               
                  </div>
 </nav>
    <article>
        <div class="container">
                <?php
            echo $content;
                ?>
                
        </div>
 </article>
<script src='<?php echo base_url('resources/jquery/jquery.js');?>' type="text/javascript"></script>
<script src='<?php echo base_url('resources/boostrap/js/bootstrap.min.js');?>' type="text/javascript"></script>
</body>
</html>