
<nav id="navmenu"class="nav-menu">
                <?php  
                    
                    if (isset($_SESSION['u_logedin']) && isset($_SESSION['u_email'])) {
                       
                        echo '<a class="btn" href="login.php" id="menu-site-name"><span class="fa fa-user"></span> '.$_SESSION['u_email'].'</a>';
                    } else {
                        echo '<a class="btn btn-primary" href="login.php" id="menu-site-name"><span class="fa fa-user"></span> Login</a>';
                    }
                ?>

                  
                  <ul id="menu">
                      <?php 
                        $sql0 = 'SELECT * FROM `pruduct_catagory` ORDER BY product_catagory_id';
                        $result0 = $conn->query($sql0);
                        if ($result0->num_rows > 0) {
                            while ($cats = $result0->fetch_assoc()) {
                            $catId =  $cats['product_catagory_id'];
                            $catName =  $cats['product_catagory_name'];

                      ?>
                      <li id="<?php echo $catName;?>">
                          <a href="<?php  echo '#'.$catName;?>-brand" data-toggle="collapse" role="button" area-controls="<?php echo $catName;?>-brand" class="parent collapsed"><?php echo $catName; ?></a> 
                              <ul id="<?php echo $catName;?>-brand" class="collapse" data-parent="#accordion">
                                <?php 
                                    $sql = "SELECT DISTINCT product_brand_id FROM `products` WHERE product_catagory_id = '$catId'";
                                    $result = $conn->query($sql);
                                    if ($result->num_rows > 0) {
                                        while ($row = $result->fetch_assoc()) {
                                            $id = $row['product_brand_id'];
                                            $sql2 = "SELECT * FROM `brands` WHERE brand_id = '$id'";
                                            $result2 = $conn->query($sql2);
                                            if ($result2->num_rows > 0) {
                                                while ($brands = $result2->fetch_assoc()) {
                                                    echo '<li id="'.$brands['brand_id'].'" ><a href="showproducts.php?catId='.$catId.'&brandId='.$brands['brand_id'].'">'.$brands['brand_name'].'</a> </li>';
                                                }
                                            }
                                        }

                                    }
                                ?> 
                                <li id="All <?php echo $catName;?>"><a href="showproducts.php?catId=<?php echo $catId;?>">All <?php echo $catName;?></a> </li>                           
                              </ul>                                        
                      </li>

                    <?php
                            }
                        }
                    ?>
                  </ul>
                  <?php 
                  if (isset($_SESSION['u_logedin']) && isset($_SESSION['u_email'])) {
                      echo '<a style="margin-left:70px;" href="include/logout.php" class="btn btn-xs btn-danger">Log Out</a>';
                  } else {
                      echo '';
                  }
                  ?>
                  
          </nav>    