<div class="container-fluid">
<div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>Orders</h1>
</div>
</div>

<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Orders</h3>
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
                        $limit = isset($_GET['limit'])?$_GET['limit']:20;
                        $page = isset($_GET['page'])?$_GET['page']:1;
                        $sql = "SELECT * FROM orders ORDER BY order_date ASC";
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

            <?php
                $sql = "SELECT * FROM orders";
                $links = getLinks($limit, $page, $sql, 'index.php?route=orders');
                echo $links;
            ?>
        </div>
    </div>

</div>