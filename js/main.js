

function load(cat, brand, search) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState < 4) {
           
            document.getElementById('ph').classList.add('ph-show');
        }
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('ph').classList.remove('ph-show');
            document.getElementById("cards").innerHTML = this.responseText;
        }
    }
    var url = '/i-ShopBD/include/loadProduct.php?catId='+cat+'&brandId='+brand+'&search='+search;
    xhttp.open("GET", url ,true);
    xhttp.send();
}


function toggleNav() {
    var cls = document.getElementById('navmenu').classList;
    var bar = document.getElementById('bars').classList;
    var main = document.getElementById('maincontent').classList;
    if (cls.contains('show') ) {
      document.getElementById('navmenu').classList.remove('show');
      if (bar.contains('cross')) {
        document.getElementById('bars').classList.remove('cross');
      }
      if (main.contains('wide')) {
        document.getElementById('maincontent').classList.remove('wide');
      }
    } else {
      document.getElementById('navmenu').classList.add('show');
      document.getElementById('bars').classList.add('cross');
      document.getElementById('maincontent').classList.add('wide');
    }
}

function addToCart(elmnt) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
      if (this.readyState < 4) {
         
          elmnt.innerHTML = 'adding to cart'
      }
      if (this.readyState == 4 && this.status == 200) {
        console.log(this.responseText);
          elmnt.innerHTML = this.responseText;
          console.log(elmnt.id);
      }
  }
  xhttp.open("GET",'/i-ShopBD/include/addtocart.php?id='+elmnt.id,true);
  xhttp.send();
}
 function login() {
   alert('Please Login to Add to Cart.');
 }

