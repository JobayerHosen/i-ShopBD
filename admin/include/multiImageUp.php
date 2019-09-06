<?php 
//THIS FUNCTION UPLOADS MULTIPLE PICTURES.
//IT TAKES TWO PARAMETER: 
//FIRST ONE IS SUBMITED HTML FILE ARRAY e.g: $_FILES['file']  AND 
//SECOND ONE IS THE DESTINATION FOLDER NAME.
//IT RETURNS AN ARRAY WITH ERROR LIST OR UPLOADED FILE LINKS.
        function multipicupload($postedAry, $destDir) {
            $fileUploadError = array(
                0 => 'No Error',
                1 => 'Exceeds max file size in php.ini',
                2 => 'Exceeds max file size specified in html',
                3 => 'Partialy uploaded',
                4 => 'No file uploaded',
                6 => 'Missing temp folder',
                7 => 'Failed to write file to disc',
                8 => 'Wrong extension',
            );
            $result = array();
            // echo '<pre>';
            // print_r($postedAry);
            // echo '</pre>';

            if (isset($postedAry)) {
                $file_array = array();
                $file_count = count($postedAry['name']);
                $file_keys = array_keys($postedAry);
                for ($i=0; $i <( $file_count); $i++) {
                    foreach ($file_keys as $key) {
                        $file_array[$i][$key] = $postedAry[$key][$i]; 
                    }
                }
                // echo '<pre>';
                // print_r($file_array);
                // echo '</pre>';
                $result['error'] = false;
                

                for ($i=0; $i < count($file_array); $i++) {
                    if ($file_array[$i]['error'] > 0) {
                        $result['error'] = true; 
                        $result['errorList'][$i] = $file_array[$i]['name'].' - '.$fileUploadError[$file_array[$i]['error']];
                    } else {
                        $extension = array('jpg','png','jpeg','gif');
                        $ext = explode('.',$file_array[$i]['name']);
                        $ext = end($ext);

                        if (!in_array($ext,$extension)) {
                            $result['error'] = true; 
                            $result['errorList'][$i] = $file_array[$i]['name'].' - The file type is not allowed.';
                        }

                    }
                }
                if ($result['error'] == true) {
                    return $result;
                } else {
                    for ($i=0; $i < count($file_array); $i++) {

                        $uniName = uniqid('img-',false).'.'.$ext;
                        $dest = '../'.$destDir.'/'.$uniName;
                        move_uploaded_file($file_array[$i]['tmp_name'], $dest);
                        $result['error'] = false;
                        $result['links'][$i] = $destDir.'/'.$uniName;
                    }
                    return $result;
                }
    
              } else {
                echo "submit please";
            }


        }



      
    ?>