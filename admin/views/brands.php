<div class="container-fluid">
<div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>Brands</h1>
</div>
</div>

<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Add Brand</h3>
        </div>
        <div class="panel-body">
            <form action="include/addbrand.php" method="Post" class="form-horizontal">
                <div class="form-group required">
                    <div class="col-sm-8">
                        <input type="text" name="addbrand" placeholder="Add Brand" class="form-control">
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
            <h3 class="panel-title">Brands</h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <td><a href="#">Brand Id</a></td>
                            <td><a href="#">Brand Name</a></td>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                        $limit = isset($_GET['limit'])?$_GET['limit']:10;
                        $page = isset($_GET['page'])?$_GET['page']:1;
                        $sql = "SELECT * FROM brands ORDER BY brand_name ASC";
                        require "include/paginator.php";

                        $datas = getData($limit, $page, $sql);
                        foreach ($datas as $data) {
                            
                            echo "<tr>";
                            echo "<td>".$data['brand_id']."</td>";
                            echo "<td>".$data['brand_name']."</td>";
                            echo "</tr>";


                        }

                    ?>
                    
                    </tbody>
                </table>
            </div>

            <?php
                 $sql = "SELECT * FROM brands";
                 $links = getLinks($limit, $page, $sql, 'index.php?route=brands&parent=collapse1');
                 echo $links;
            ?>


        </div>
    </div>

    
</div>