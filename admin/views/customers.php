<div class="container-fluid">
<div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>Customers</h1>
</div>
</div>

<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Customers</h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <td><a href="#">Customer Id</a></td>
                            <td><a href="#">Customer Name</a></td>
                            <td><a href="#">Email</a></td>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                        $limit = isset($_GET['limit'])?$_GET['limit']:20;
                        $page = isset($_GET['page'])?$_GET['page']:1;
                        $sql = "SELECT * FROM users ORDER BY user_id ASC";
                        require "include/paginator.php";

                        $datas = getData($limit, $page, $sql);
                        foreach ($datas as $data) {
                            echo "<tr>";
                            echo "<td>".$data['user_id']."</td>";
                            echo "<td>".$data['first_name']." ".$data['last_name']."</td>";
                            echo "<td>".$data['email']."</td>";
                            echo "</tr>";
                        }
                    ?>
                    </tbody>
                </table>
            </div>

            <?php
                $sql = "SELECT * FROM users";
                $links = getLinks($limit, $page, $sql, 'index.php?route=customers');
                echo $links;
            ?>
        </div>
    </div>

</div>