<?php
    function getData($limit, $page = 1, $query) {
        include "dbh.inc.php";
        $rs = $conn->query($query);
        if($rs->num_rows > $limit * ($page - 1)) {
            $query .= " LIMIT ".(($page - 1) * $limit).",".$limit; 
        }
    
        $rs = $conn->query($query);
        while ($row = $rs->fetch_assoc()) {
            $results[] = $row;
        }
        if ($rs->num_rows > 0) {
        return $results;            
        } else {
            return false;
        }

    }


    function getLinks($limit, $page, $query, $url) {
        include "dbh.inc.php";
        $rs = $conn->query($query);
        $row = $rs->num_rows;
        $last = ceil($row / $limit);
        $start = ($page - 4 > 0)?($page - 4):1;
        $end =  ($page + 4 < $last)?($page + 4):$last;
        $html = '<ul class="pagination">';
        $class = ($page == 1)?'disabled':'';
        $previous = ($page == 1)?
        '<li class="'.$class.'"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>':
        '<li class="'.$class.'"><a href="'.$url.'&limit='.$limit.'&page='.($page - 1).'"><span>&laquo;</span></a></li>';
        $html .= $previous;

        if ($start > 1) {
            $html .= '<li class=""><a href="'.$url.'&limit='.$limit.'&page=1"><span>1</span></a></li>';
            $html .= '<li class="disabled"><a href="#"><span">...</span></a></li>';
        }

        for ($i = $start; $i <= $end; $i++) {
            $class = $page == $i?'active':'';
            $html .=  '<li class="'.$class.'"><a href="'.$url.'&limit='.$limit.'&page='.$i.'"><span>'.$i.'</span></a></li>';
        }

        if ($end < $last) {
            $html .= '<li class="disabled"><a href="#"><span">...</span></a></li>';
            $html .= '<li class=""><a href="'.$url.'&limit='.$limit.'&page='.$last.'"><span>'.$last.'</span></a></li>';
        }
        $class = ($page == $last)?'disabled':'';
        $next = ($page == $last)?
        '<li class="'.$class.'"><a href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>':
        '<li class="'.$class.'"><a href="'.$url.'&limit='.$limit.'&page='.($page + 1).'"><span>&raquo;</span></a></li>';
        $html .= $next;
        $html .= '</ul>';
        return $html;

    }
?>