<div class="container-fluid">
<div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>Order</h1>
</div>
</div>

<div class="container-fluid">
                                        <?php
                                           if (isset($_GET['orderId'])) {
                                            $oid = $_GET['orderId'];
                                            $sqo = "SELECT * FROM `orders` WHERE order_id = '$oid'";
                                            $rso = $conn->query($sqo);
                                            if ($rso->num_rows > 0) {
                                                $order = $rso->fetch_assoc();
                                                $uid = $order['order_user_id'];
                                                $squ = "SELECT * FROM `users` WHERE user_id = '$uid'";
                                                $rsu = $conn->query($squ);
                                                $user = $rsu->fetch_assoc();
                                        ?>

                <div class="row">

                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-user"></i> Customer Details</h3>
                            </div>
                                <table class="table">
                                    <tbody>
                                        <tr>
                                        <td style="width: 1%;"><button  class="btn btn-info btn-xs" ><i class="fa fa-user fa-fw"></i></button></td>
                                        <td> <a href="" target="_blank"><?php echo $user['first_name'].' '.$user['last_name'] ?></a> </td>
                                        </tr>
                                        <tr>
                                        <td><button class="btn btn-info btn-xs" ><i class="fa fa-envelope-o fa-fw"></i></button></td>
                                        <td><a href="mailto:akshav2000p@gmail.com"><?php echo $user['email']; ?></a></td>
                                        </tr>
                                        <tr>
                                        <td><button class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
                                        <td><?php echo $user['phone']; ?></td>
                                        </tr>
                                        <tr>
                                        <td><button class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
                                        <td><?php echo $order['order_date']; ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-user"></i> Customer Details</h3>
                            </div>
                                <?php echo $user['address']; ?>
                        </div>                                                
                    </div>                    
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>
                            Order Items
                        </h3>
                    </div>
               
                    <div class="panel-body">
                        <table class="table table-bordered table-responsive table-hover">
                                        <thead>
                                        <tr>
                                            <td width="60px"><a href="#"><small>Thumb</small></a></td>
                                            <td><a href="#">Product Name</a></td>
                                            <td><a href="#"><small>Stock</small> </a></td>
                                            <td><a href="#"><small>Quantity</small></a></td>
                                            <td><a href="#">Unit Price </a></td>
                                            <td><a href="#">Total</a></td>
                                            <td><a href="#"><small>view</small> </a></td>
                                            
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                                $total = 0;
                                                $sq = "SELECT * FROM `order_items` WHERE orders_order_id = '$oid'";
                                                $rs = $conn->query($sq);
                                                if($rs->num_rows > 0) {
                                                    while ($item = $rs->fetch_assoc()) {
                                                        $pid = $item['products_product_id'];
                                                        $qntt = $item['product_quantity'];
                                                        $sql = "SELECT * FROM products WHERE product_id = '$pid'";
                                                        $rs2 = $conn->query($sql);
                                                        if ($rs2->num_rows > 0) {
                                                            while($data = $rs2->fetch_assoc()) {
                                                                $total += ($data['product_price'] * $qntt); 
                                                                echo "<tr>";
                                                                echo '<td><img src="'.$data['product_thumb'].'" class="img-thumbnail"></td>';
                                                                echo "<td>".$data['product_name']."</td>";
                                                                echo '<td>'.$data['product_stock'].'</td>';           
                                                                echo '<td>'.$qntt.'</td>';     
                                                                echo "<td>".$data['product_price']."<small>Tk.</small></td>";
                                                                echo "<td>".($data['product_price'] * $qntt)."<small>Tk.</small></td>";
                                                                echo '<td><a href="index.php?route=viewproduct&productId='.$data['product_id'].'" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a></td>';
                                                                echo "</tr>";

                                                            }

                                                        }
                                                    }
                                                            echo '<tr>';                                                        
                                                        echo '<td class="text-right" colspan="5">Sub Total</td>';
                                                        echo '<td colspan="2">'.$total.'<small>Tk.</small></td>';
                                                        echo '</tr>';
                                                        echo '<tr><td class="text-right" colspan="5">Shipping</td><td colspan="2">100<small>Tk</small></td></tr>';                                           }
                                                        echo '<tr>';                                                        
                                                        echo '<td class="text-right" colspan="5">Total</td>';
                                                        echo '<td colspan="2">'.($total + 100).'<small>Tk.</small></td>';
                                                        echo '</tr>';
                                            }
                                        }

                                        ?>

                                        </tbody>
                        </table>
                    </div>
                 </div>    
    
</div>