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
    <!-- 導覽列 -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid"> 
            <a class="navbar-brand" href="JavaScript:;">N.W Select</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
                <!-- 會員登入按鈕(含跳出視窗) -->
                    <li class="nav-item">
                    <a class="nav-link" href="JavaScript:;" type="button" data-bs-toggle="modal" data-bs-target="#loginModal"><span class="material-symbols-outlined">
                        login
                    </span>會員登入</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="JavaScript:;" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="material-symbols-outlined">
                                manage_accounts
                            </span>會員專區
                        </a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="order_history.jsp">訂單查詢</a></li>
                          <li><a class="dropdown-item" href="member_info.jsp">會員資料</a></li>
                        </ul>
                <li class="nav-item">
                    <a class="nav-link" href="JavaScript:;"><span class="material-symbols-outlined">
                        shopping_cart_checkout
                    </span>購物車</a>
                </li>
                </ul>
                <!-- 跳出視窗內容 -->
                <div class="modal fade" id="loginModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                    <!-- Header -->
                            <div class="modal-header">
                                <h3>會員登入</h3>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                    <!-- Body -->
                            <div class="modal-body">
                                <!-- 登入表單 -->
                                <form>
                                    <!-- email -->
                                    <div class="form-group">
                                        <input type="email" class="account form-control" placeholder="請輸入Email">
                                    </div>
                                    <!-- password -->
                                    <div class="form-group">
                                        <input type="password" class="password form-control" placeholder="請輸入密碼">
                                    </div>
                                    <!-- checkbox -->
                                    <div class="form-group">
                                        <input type="checkbox" class="remember">記住我的密碼
                                    </div>
                                    <!-- 送出按鈕 -->
                                    <button type="button" class="btn btn-info">登入</button>
                                </form>

                            </div>
                    <!-- Footer -->
                            <div class="modal-footer">
                                <div class="signup">
                                    <a href="JavaScript:;" type="button" class="member">註冊會員</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!-- 頁籤 -->
    <div class="container-fluid">
        <ul class="nav nav-tabs justify-content-center text-center">
            <li class="nav-item col-2 ">
                <a class="nav-link active" aria-current="page" href="#">首頁</a>
            </li>
            <li class="nav-item col-2">
                <a class="nav-link" href="#">上衣</a>
            </li>
            <li class="nav-item col-2">
                <a class="nav-link" href="#">褲子</a>
            </li>
            <li class="nav-item col-2">
                <a class="nav-link" href="#">配件</a>
            </li>
        </ul>
    </div>
    <div class="text-center" style="font-size:10px;color:red;padding:15px 15px 0 15px;">< 慎防詐騙 > N.W 不會利用電話要求會員ATM操作，切勿聽從電話通知，前往ATM匯款轉帳，如接到可疑電話，務必冷靜處理並且掛斷</div>

    <!-- 圖片輪播 -->
    <div class="container">
		<div id="carouselarea" class="col-12 m-10 p-10 carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselarea" data-bs-slide-to="0" class="active"></li>
				<button type="button" data-bs-target="#carouselarea" data-bs-slide-to="1"></li>
				<button type="button" data-bs-target="#carouselarea" data-bs-slide-to="2"></li>
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

    <!-- BEST ITEM + 商品欄 -->
    <div class="container">
        <div class="spacer50"></div>
        <h4 class="text-center">BEST ITEM</h4>
        <div class="spacer30"></div>

        <div class="row">
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="400g 立領 開叉圓弧長衫">
                        <img src="img/img013.jfif"
                            class="pdimg lazy img-responsive"
                            data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9UTDIyTDAyMy84YTNjNGUxYzNjNTU0OWY5OGQ1M2MxZGY4ZmEzMGMxNC5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                            style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">400g 立領 開叉圓弧長衫</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>880</del><span class='text-danger'>NTD. 750</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="580g 拼接車線 口袋衛衫">
                        <img src="img/img014.jfif"
                            class="pdimg lazy img-responsive"
                            data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9UTDIyTDAyMC9mY2EyZjM2YmJkMDkwODEzOWE0NmMxMDkxZTM0MDZkMC5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                            style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">580g 拼接車線 口袋衛衫</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,280</del><span class='text-danger'>NTD. 1,080</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="Denali 鴨絨羽絨 連帽夾克">
                    <img src="img/img015.jfif"
                        class="pdimg lazy img-responsive"
                        data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9PVTIyVTAxNC9kMTEwNTBiODljODY4MGU0ZjQ5MTI1YTU1MjE5ZTQwMS5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                        style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">Denali 鴨絨羽絨 連帽夾克</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,880</del><span class='text-danger'>NTD. 1,580</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="Ripstop 500g 拼接材質 連帽帽衫">
                        <img src="img/img016.jfif"
                            class="pdimg lazy img-responsive"
                            data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9UTDIyTDAyNy8xOTBkODcwZGExMWEzOTViZjNhNjM2MTFiNmJlM2ZkYi5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                            style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">Ripstop 500g 拼接材質 連帽帽衫</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,280</del><span class='text-danger'>NTD. 1,080</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="12oz 厚磅丹寧 牛仔夾克">
                        <img src="img/img017.jfif"
                            class="pdimg lazy img-responsive"
                            data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9PVTIyVTAxMy9iMzUwOGJhZGQ4NTAxY2NmN2NjMzczMTg2NjRmYjhkYy5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                            style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">12oz 厚磅丹寧 牛仔夾克</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,280</del><span class='text-danger'>NTD. 1,080</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="TAPERED 廓形水洗 工裝褲【附皮帶】">
                        <img src="img/img018.jfif"
                            class="pdimg lazy img-responsive"
                            data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9QTDIySjAxNC8wNTA5ZDEyOTQ3NWUwOWM3OTRmZmI3YjM2N2Q5Yzg2Zi5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                            style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">TAPERED 廓形水洗 工裝褲【附皮帶】</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,080</del><span class='text-danger'>NTD. 980</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="DENIM 14.5盎司 赤耳牛仔夾克">
                        <img src="img/img019.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9PVTIyVTAxMi80ZDk3MGIxOGUzNDlmYTg5ZTZlMmJkZDMwOGE3NTk2NC5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">DENIM 14.5盎司 赤耳牛仔夾克</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>2,480</del><span class='text-danger'>NTD. 2,280</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="Hoodie 450g 太空棉 厚磅彈力帽衫">
                        <img src="img/img020.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9UTDIyTDAyNC81YTA5ZWQyOGVmOGI0ZWJhOGQ4ODg4MzJmNGZhMDFiYS5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">Hoodie 450g 太空棉 厚磅彈力帽衫</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,080</del><span class='text-danger'>NTD. 880</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="Baseball JKT 美式拼接 棒球外套">
                        <img src="img/img021.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9PVTIyVTAxMS9hZGQzYjcwODA1NDc3OGIyMGM0ODlkOTE5ZTUxOWIyMy5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">Baseball JKT 美式拼接 棒球外套</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,480</del><span class='text-danger'>NTD. 1,280</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="Denim 打摺錐形 水洗牛仔褲">
                        <img src="img/img022.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9QTDIySjAxNS9lZjVkNzhkZGJiM2I1MWE0MjY1MTlmN2NiODZhODE5Mi5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">Denim 打摺錐形 水洗牛仔褲</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>880</del><span class='text-danger'>NTD. 780</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="320g 厚磅太空棉 高領長衫">
                        <img src="img/img023.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9UTDIyTDAyNS9iYTliOGZjNGFjNjM2M2MzNjc3Y2FkNjAyNzUwM2EzZC5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">320g 厚磅太空棉 高領長衫</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>780</del><span class='text-danger'>NTD. 580</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="faam®-Merino Wool Crew 美麗諾羊毛高筒襪">
                        <img src="img/img024.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9BUzIyUzAwNC84MDI5YWMyMzA0NmQ1YjZkOGI4YmEwYjg1NDIxYTdlNy5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">faam®-Merino Wool Crew 美麗諾羊毛高筒襪</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>680</del><span class='text-danger'>NTD. 590</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="Rifare_co Logo TABI Crew - 分趾高筒襪">
                        <img src="img/img025.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9BUzIyUzAwNS8wZGRjNDcyNTk3MzQ5YzQyMWJmMjBiNTJjZWFlODA5Yi5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">Rifare_co Logo TABI Crew - 分趾高筒襪</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>580</del><span class='text-danger'>NTD. 450</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="420g 厚實華夫格 口袋長衫">
                        <img src="img/img026.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9UTDIyTDAxNS8zZDk2ZDQ1ZTBjYTc1NGY1NTVlNzg3Y2Y0Nzc3Mzc2NS5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">420g 厚實華夫格 口袋長衫</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>880</del><span class='text-danger'>NTD. 780</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="Nylon Caoch 美式教練 防風夾克">
                        <img src="img/img027.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9PVTIyVTAwOS9iYmIwZDgyNTczNDlhMTBlNjI2N2FjODQyMmU0YWJhYS5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;"/>
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">Nylon Caoch 美式教練 防風夾克</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>780</del><span class='text-danger'>NTD. 650</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
            <div class="col-xs-6 col-sm-3 pd-item">
                <div class="prod-img">
                    <a href="JavaScript:;" title="14oz 重磅黑牛王 牛仔直筒褲">
                        <img src="img/img028.jfif"
                                class="pdimg lazy img-responsive"
                                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9QTDIyQjAxMy8zNDNmYzM3ODcyYTA3NDk4Njg4NDkxOGIzOGFmNjYzMS5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
                                style="width:100%;" />
                    </a>
                </div>
                <div class="spacer15"></div>
                <div class="text-center">14oz 重磅黑牛王 牛仔直筒褲</div>
                <div class="spacer15"></div>
                <div class="text-center"><del>1,280</del><span class='text-danger'>NTD. 1,080</span></div>
                <div class="spacer50"></div>
                <div class="spacer20"></div>
            </div>
        </div>
            <div class="col-xs-6 col-sm-3 pd-item"></div>
        <div class="spacer15"></div>
    </div>
    
    <!-- 頁尾 -->
    <div class="container">
        <div class="row" id="footer">
            <div class="sqs-block html-block sqs-block-html" data-block-type="2" >
                <div class="sqs-block-content">
                    <p style="text-align:center">
                        <strong>N.W Select</strong><br>
                        地址│桃園市中壢區<br>
                        電話│(03)1234-5566<br>
                        時間│週二至週四 11:00-21:00、週五至週日 11:00-22:00
                    </p> 
                </div>
            </div>  
        </div>
    </div>

    <!-- goTop按鈕 -->
            <button class="Btn" id="gotop2">
                <span class="material-symbols-outlined" >
                    arrow_upward
                </span>
            </button>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- <script src="js/plugins.js"></script> -->
    <script src="./js/active.js"></script>
</body>
</html>