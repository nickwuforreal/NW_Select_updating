<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/format.css">
    <link rel="stylesheet" href="css/popup.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>N.W Select</title>
</head>

<body>
<!-- 圖片輪播 -->
    <div class="container">
		<div id="carouselarea" class="col-12 m-10 p-10 carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselarea" data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#carouselarea" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#carouselarea" data-bs-slide-to="2"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="img/img004.jfif" alt="Photo1">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/img005.jfif" alt="Photo2">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/img006.jfif" alt="Photo3">
				</div>
			</div>
			<button class="carousel-control-prev" data-bs-target="#carouselarea" type="button" data-bs-slide="prev" data-bs-target="#carouselarea">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" data-bs-target="#carouselarea" type="button" data-bs-slide="next" data-bs-target="#carouselarea">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
        <div class="spacer50"></div>
	</div>
<!-- 三欄優惠圖 -->
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <a href="#" target="_blank">
                    <img src="img/img010.jfif" width="100%" />
                </a>
            </div>
            <div class="col-lg-3">
                <a href="#" target="_blank">
                    <img src="img/img011.jfif"width="100%" />
                </a>
            </div>
            <div class="col-lg-3">
                <a href="#" target="_blank">
                    <img src="img/img012.jfif"width="100%" />
                </a>
            </div>
        </div>
    </div>

    <div class="spacer50"></div>
    
</body>

</html>