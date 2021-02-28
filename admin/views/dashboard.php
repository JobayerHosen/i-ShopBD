<div class="container-fluid">
                <div class="page-header">
                        <div class="pull-right">
                            <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
                        </div>
                        <h1>Dashboard</h1>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="tile tile-indigo">
                            <div class="tile-heading">Total Orders 
                                <?php 
                                    
                                ?>
                            </div>
                            <div class="tile-body"><i class="fa fa-shopping-cart"></i>
                            <?php
                                $sql = "SELECT * FROM `orders`";
                                $result = $conn->query($sql);
                                    $orderCount = $result->num_rows;
                            ?>
                            <h3 class="pull-right"><?php echo $orderCount; ?></h3>
                            </div>
                            <div class="tile-footer">
                                <a href="index.php?route=orders">View more...</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="tile tile-success">
                            <div class="tile-heading">Pending Orders 
                            </div>
                            <div class="tile-body"><i class="fa fa-credit-card"></i>
                            <?php
                                $sql = "SELECT * FROM `orders` WHERE `order_shiped`= '0'";
                                $result = $conn->query($sql);
                                    $orderCount = $result->num_rows;
                            ?>
                            <h3 class="pull-right"><?php echo $orderCount; ?></h3>
                            </div>
                            <div class="tile-footer">
                                <a href="index.php?route=orders">View more...</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="tile tile-primary">
                            <div class="tile-heading">Total Customers 
                            </div>
                            <div class="tile-body"><i class="fa fa-user"></i>
                            <?php
                                $sql = "SELECT DISTINCT order_user_id FROM `orders`";
                                $result = $conn->query($sql);
                                    $customerCount = $result->num_rows;
                            ?>
                            <h3 class="pull-right"><?php echo $customerCount; ?></h3>
                            </div>
                            <div class="tile-footer">
                                <a href="index.php?route=customers">View more...</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="tile tile-danger">
                            <div class="tile-heading">Total Users
                            </div>
                            <div class="tile-body"><i class="fa fa-users"></i>
                            <?php
                                $sql = "SELECT * FROM `users`";
                                $result = $conn->query($sql);
                                    $userCount = $result->num_rows;
                            ?>
                            <h3 class="pull-right"><?php echo $userCount; ?></h3>
                            </div>
                            <div class="tile-footer">
                                <a href="">View more...</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>
                                   Latest Orders</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <td><a href="#">Order Id</a></td>
                                                <td><a href="#">Customer</a></td>
                                                <td><a href="#">Status</a></td>
                                                <td><a href="#">Order Date</a></td>
                                                <td><a href="#">Action</a></td>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                            $limit = isset($_GET['limit'])?$_GET['limit']:10;
                                            $page = isset($_GET['page'])?$_GET['page']:1;
                                            $sql = "SELECT * FROM orders ORDER BY order_date DESC ";
                                            require "include/paginator.php";

                                            $datas = getData($limit, $page, $sql);
                                            foreach ($datas as $data) {
                                                echo "<tr>";
                                                echo "<td>".$data['order_id']."</td>";

                                                $UId = $data['order_user_id'];
                                                $sq = "SELECT first_name,last_name FROM users WHERE user_id = '$UId';";
                                                $result = $conn->query($sq);
                                                if ($result->num_rows > 0) {
                                                    $row = $result->fetch_assoc();
                                                    $name = $row['first_name'].' '.$row['last_name'];

                                                    echo "<td>".$name."</td>";
                                                }
                                                $status = $data['order_shiped'] == 0?'Pending':'Completed';
                                                echo "<td>".$status."</td>";
                                                echo "<td>".$data['order_date']."</td>";
                                                echo '<td><a href="index.php?route=vieworder&orderId='.$data['order_id'].'" class="btn btn-info"><i class="fa fa-eye"></i></a></td>';
                                                echo "</tr>";
                                            }
                                        ?>
                                        </tbody>
                                    </table>
                                </div>

                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>