<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Odeme Sayfasi</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<style>

@charset "UTF-8";
body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-color: #EF5350;
    background-repeat: no-repeat
}

.card {
    padding: 30px 25px 35px 50px;
    border-radius: 30px;
    box-shadow: 0px 4px 8px 0px #B71C1C;
    margin-top: 50px;
    margin-bottom: 50px
}

.border-line {
    border-right: 1px solid #BDBDBD
}

.text-sm {
    font-size: 13px
}

.text-md {
    font-size: 18px
}

.image {
    width: 60px;
    height: 30px
}

::placeholder {
    color: grey;
    opacity: 1
}

:-ms-input-placeholder {
    color: grey
}

::-ms-input-placeholder {
    color: grey
}

input {
    padding: 2px 0px;
    border: none;
    border-bottom: 1px solid lightgrey;
    margin-bottom: 5px;
    margin-top: 2px;
    box-sizing: border-box;
    color: #000;
    font-size: 16px;
    letter-spacing: 1px;
    font-weight: 500
}

input:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border-bottom: 1px solid #EF5350;
    outline-width: 0
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0
}

.btn-red {
    background-color: #EF5350;
    color: #fff;
    padding: 8px 25px;
    border-radius: 50px;
    font-size: 18px;
    letter-spacing: 2px;
    border: 2px solid #fff
}

.btn-red:hover {
    box-shadow: 0 0 0 2px #EF5350
}

.btn-red:focus {
    box-shadow: 0 0 0 2px #EF5350 !important
}

.custom-checkbox .custom-control-input:checked~.custom-control-label::before {
    background-color: #EF5350
}

@media screen and (max-width: 575px) {
    .border-line {
        border-right: none;
        border-bottom: 1px solid #EEEEEE
    }
}


</style>
   </head>
<body>
<% String miktar=request.getParameter("miktar");%>

<div class="container-fluid px-1 px-md-2 px-lg-4 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-sm-11">
            <div class="card border-0">
                <div class="row justify-content-center">
                    <h3 class="mb-4">Credit Card Checkout</h3>
                </div>
                <div class="row">
                    <div class="col-sm-7 border-line pb-3">
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">Name on the card</p> <input type="text" name="name" placeholder="Name" size="15">
                        </div>
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">Card Number</p>
                            <div class="row px-3"> <input type="text" name="card-num" placeholder="0000 0000 0000 0000" size="18" id="cr_no" minlength="19" maxlength="19">
                                <p class="mb-0 ml-3">/</p> <img class="image ml-1" src="https://i.imgur.com/WIAP9Ku.jpg">
                            </div>
                        </div>
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">Expiry date</p> <input type="text" name="exp" placeholder="MM/YY" size="6" id="exp" minlength="5" maxlength="5">
                        </div>
                        <div class="form-group">
                            <p class="text-muted text-sm mb-0">CVV/CVC</p> <input type="password" name="cvv" placeholder="000" size="1" minlength="3" maxlength="3">
                        </div>
                        <div class="form-group mb-0">
                            <div class="custom-control custom-checkbox custom-control-inline"> <input id="chk1" type="checkbox" name="chk" class="custom-control-input" checked> <label for="chk1" class="custom-control-label text-muted text-sm">save my card for future payment</label> </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-5 text-sm-center justify-content-center pt-4 pb-4"> <small class="text-sm text-muted">Order number</small>
                        <h5 class="mb-5">12345678</h5> <small class="text-sm text-muted">Payment amount</small>
                        <div class="row px-3 justify-content-sm-center">
                            <h2 class=""><span class="text-md font-weight-bold mr-2">TL </span><span class="text-danger"><%=miktar %></span></h2>
                        </div> <a class="cart_quantity_delete" href="odemecontrol.jsp"><i class="fa fa-times">ÖDEME</i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

$(document).ready(function(){

	//For Card Number formatted input
	var cardNum = document.getElementById('cr_no');
	cardNum.onkeyup = function (e) {
	if (this.value == this.lastValue) return;
	var caretPosition = this.selectionStart;
	var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
	var parts = [];

	for (var i = 0, len = sanitizedValue.length; i < len; i +=4) { parts.push(sanitizedValue.substring(i, i + 4)); } for (var i=caretPosition - 1; i>= 0; i--) {
	    var c = this.value[i];
	    if (c < '0' || c> '9') {
	        caretPosition--;
	        }
	        }
	        caretPosition += Math.floor(caretPosition / 4);

	        this.value = this.lastValue = parts.join(' ');
	        this.selectionStart = this.selectionEnd = caretPosition;
	        }

	        //For Date formatted input
	        var expDate = document.getElementById('exp');
	        expDate.onkeyup = function (e) {
	        if (this.value == this.lastValue) return;
	        var caretPosition = this.selectionStart;
	        var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
	        var parts = [];

	        for (var i = 0, len = sanitizedValue.length; i < len; i +=2) { parts.push(sanitizedValue.substring(i, i + 2)); } for (var i=caretPosition - 1; i>= 0; i--) {
	            var c = this.value[i];
	            if (c < '0' || c> '9') {
	                caretPosition--;
	                }
	                }
	                caretPosition += Math.floor(caretPosition / 2);

	                this.value = this.lastValue = parts.join('/');
	                this.selectionStart = this.selectionEnd = caretPosition;
	                }

	                });
</script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

    </script>

</body>
</html>