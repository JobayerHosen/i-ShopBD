<div class="container-fluid">
<div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>Products</h1>
</div>
</div>

<div class="container-fluid">
    <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>
                                   All Products</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-reaponsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <td width="60px"><a href="#">Thumb</a></td>
                                            <td><a href="#">Product Id</a></td>
                                            <td><a href="#">Product Name</a></td>
                                            <td><a href="#">Price</a></td>
                                            <td><a href="#">Category</a></td>
                                            <td><a href="#">Brand</a></td>
                                            <td><a href="#">Stock</a></td>
                                            <td><a href="#">Action</a></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                            $limit = isset($_GET['limit'])?$_GET['limit']:10;
                                            $page = isset($_GET['page'])?$_GET['page']:1;
                                            $sql = "SELECT * FROM products ORDER BY product_id ASC";
                                            require "include/paginator.php";

                                            $datas = getData($limit, $page, $sql);
                                            foreach ($datas as $data) {
                                                echo "<tr>";
                                                echo '<td><img src="'.$data['product_thumb'].'" class="img-thumbnail"></td>';
                                                echo "<td>".$data['product_id']."</td>";
                                                echo "<td>".$data['product_name']."</td>";
                                                echo "<td>".$data['product_price']."</td>";


                                                $catId = $data['product_catagory_id'];
                                                $sq = "SELECT product_catagory_name FROM pruduct_catagory WHERE product_catagory_id = '$catId';";
                                                $result = $conn->query($sq);
                                                if ($result->num_rows > 0) {
                                                    $row = $result->fetch_assoc();
                                                    $cat = $row['product_catagory_name'];

                                                    echo "<td>".$cat."</td>";
                                                }

                                                $brandId = $data['product_brand_id'];
                                                $sq = "SELECT brand_name FROM brands WHERE brand_id = '$brandId';";
                                                $result = $conn->query($sq);
                                                if ($result->num_rows > 0) {
                                                    $row = $result->fetch_assoc();
                                                    $brand = $row['brand_name'];

                                                    echo "<td>".$brand."</td>";
                                                }
                                                echo "<td>".$data['product_stock']."</td>";
                                                echo '<td><a href="index.php?route=viewproduct&productId='.$data['product_id'].'" class="btn btn-info"><i class="fa fa-eye"></i></a></td>';
                                                echo "</tr>";
                                            }
                                        ?>

                                        </tbody>
                                    </table>
                                </div>

                                <?php
                                    $sql = "SELECT * FROM products";
                                    $links = getLinks($limit, $page, $sql, 'index.php?route=products&parent=collapse1');
                                    echo $links;
                                ?>
                            </div>
                        </div>

    
</div>