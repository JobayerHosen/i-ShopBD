<?php   
//THIS FUNCTION UPLOADS SINGLSE PICTURE.
//IT TAKES TWO PARAMETER: 
//FIRST ONE IS SUBMITED HTML FILE ARRAY e.g: $_FILES[''file]  AND 
//SECOND ONE IS THE DESTINATION FOLDER NAME.
//IT RETURNS AN ARRAY WITH ERROR OR UPLOADED FILE LINK.
        function picUpload($file_ary , $dest) {
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

            $file = $file_ary;
            $destFolder = $dest;

            $fileName = $file['name'];
            $fileType = $file['type'];
            $fileTmp = $file['tmp_name'];
            $error = $file['error'];
            $fileSize = $file['size'];

            $fileExt = explode(".",$fileName);
            $fileActualExt = strtolower(end($fileExt));
            $allowed = array('jpg', 'png', 'jpeg');

            $uploaded = array();

            if ($error === 0) {
                if (in_array($fileActualExt, $allowed)) {
                    if ($fileSize < (20 * 1024 *1024)) {
                        $newFileName = uniqid('pic', true).'.'.$fileActualExt;
                        $fileDestination = '../'.$destFolder.'/'.$newFileName;
                        move_uploaded_file($fileTmp, $fileDestination);
                        $uploaded['err'] = false;
                        $uploaded['name'] = $destFolder.'/'.$newFileName;
                    } else {
                        $uploaded['err'] = 'The file is too big';
                    }
                } else {
                    $uploaded['err'] = 'The file type is not allowed';
                }
            } else {
                $uploaded['err'] = $fileUploadError[$file['error']];
            }

            return $uploaded;
        }

        // $r = picUpload($_FILES['file'], 'pictures');
        // print_r($r);

?>