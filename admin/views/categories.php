<div class="container-fluid">
<div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>Categories</h1>
</div>
</div>

<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Add Category</h3>
        </div>
        <div class="panel-body">
            <form action="include/addcat.php" method="Post" class="form-horizontal">
                <div class="form-group required">
                    <div class="col-sm-8">
                        <input type="text" name="addcat" placeholder="Add Category" class="form-control">
                    </div>
                    <div class="col-sm-4">
                        <input type="submit" name="submit" class="btn btn-primary btn-block">
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Categories</h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <td><a href="#">Category Id</a></td>
                            <td><a href="#">Category Name</a></td>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                        $limit = isset($_GET['limit'])?$_GET['limit']:10;
                        $page = isset($_GET['page'])?$_GET['page']:1;
                        $sql = "SELECT * FROM pruduct_catagory ORDER BY product_catagory_name ASC";
                        require "include/paginator.php";

                        $datas = getData($limit, $page, $sql);
                        foreach ($datas as $data) {
                            
                            echo "<tr>";
                            echo "<td>".$data['product_catagory_id']."</td>";
                            echo "<td>".$data['product_catagory_name']."</td>";
                            echo "</tr>";


                        }
                    ?>
                    </tbody>
                </table>
            </div>
            <?php
                 $sql = "SELECT * FROM pruduct_catagory";
                 $links = getLinks($limit, $page, $sql, 'index.php?route=categories&parent=collapse1');
                 echo $links;
            ?>


        </div>
    </div>
</div>