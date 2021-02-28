<nav class="navbar">
        <div class="mb-auto nav-left">
            <button class="navbar-toggler" type="button" onclick="toggleNav()" >
              <div id="bars" class="bars">
                <div class="top"></div>
                <div class="mid"></div>
                <div class="bottom"></div>
              </div>
            </button>
        </div>
     
        <div class="row nav-center">
            <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12">
                <a href="index.php" class="site-name"><img style="height:40px;" src="icons/ishopbd.png" alt="i-shop bd"> </a> 
            </div>
            <div class="col-lg-8 col-md-7 col-sm-12 col-xs-12">
                <form action="showproducts.php" method="GET" class="search">
                    <div class="input-group">
                        <input type="text" id="search" name="search" class="form-control" autocomplete="off" placeholder="Search" aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <input class="btn" name="submit" type="submit" value="Search">
                                    <!-- <i class="fa fa-search"></i> -->
                            <!-- </button> -->
                        </div>
                    </div>
                </form>    
            </div>
                
        </div>
        <div class="mb-auto nav-right">
            <a href="cart.php" class="btn btn-light cart">
                <i class="fa fa-shopping-cart"></i>
            </a>
        </div>


    </nav>