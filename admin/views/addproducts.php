<div class="container-fluid">
    <div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>Add Products</h1>
    </div>

</div>

<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> Add Product</h3>
        </div>
        <div class="panel-body">

            <form action="include/addproductexe.php" method="POST" enctype="multipart/form-data" class="form-horizontal" >
            
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name1">Product Name</label>
                    <div class="col-sm-10">
                        <input type="text" name="product_name" value="" placeholder="Product Name" id="input-name1" class="form-control">
                    </div>
                </div>

                <!-- <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-model">Model</label>
                    <div class="col-sm-10">
                        <input type="text" name="model" value="" placeholder="Model" id="input-model" class="form-control">
                    </div>
                </div> -->

                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-brand">Brand</label>
                    <div class="col-sm-4">
                        <select name="brand" id="input-brand" class="form-control" >
                        <?php   
                        $sql = "SELECT * FROM brands;";
                        $result = $conn->query($sql);
                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                ?>
                                <option><?php echo $row['brand_name'];?></option><?php
                                }            
                            }
                        ?>
                        </select>
                    </div>

                    <label class="col-sm-1 control-label" for="input-cat">Category</label>
                    <div class="col-sm-5">
                        <select name="category" id="input-cat" class="form-control" > 
                        <?php   
                        $sql = "SELECT * FROM pruduct_catagory;";
                        $result = $conn->query($sql);
                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                ?>
                                <option><?php echo $row['product_catagory_name'];?></option><?php
                                }            
                            }
                        ?>
                        </select>
                    </div>
                </div>

                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-price">Price</label>
                    <div class="col-sm-10">
                        <input type="text" name="price" value="" placeholder="price" id="input-price" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="input-desc" class="col-sm-2 control-label" for="desc" >Description</label>
                    <div class="col-sm-10">
                        <textarea name="desc"  id="desc" rows="12" class="form-control" ></textarea>
                    </div>
                </div>

                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-stock">Stock</label>
                    <div class="col-sm-10">
                        <input type="text" name="stock" value="" placeholder="stock" id="input-stock" class="form-control">
                    </div>
                </div>

                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-thumb">Thumbneil</label>
                    <div class="col-sm-10">
                        <input type="file" name="thumb" value="C:\fakepath\cpi.jpg" id="input-thumb" class="form-control">
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-images">Images</label>
                    <div class="col-sm-10">
                        <input type="file" name="images[]" multiple="" value="" id="input-images" class="form-control">
                    </div>
                </div>

                <div class="form-group required">
                    <div class="col-sm-10 col-sm-offset-2 ">
                        <input type="submit" name="submit" value="Add Product" class="btn btn-primary btn-block">
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
