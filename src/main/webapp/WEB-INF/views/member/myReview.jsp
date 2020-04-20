<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="KOR">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
    <link rel="stylesheet" href="resources/css/nice-select.css">
    <link rel="stylesheet" href="resources/css/price_rangs.css">
</head>

<body>
    <!--::header part start::-->
    <%@ include file="../common/menubar.jsp"%>
    <!-- Header part end-->

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Shop Category</h2>
                            <p>Home <span>-</span> Shop Category</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <%@ include file="../common/assideMyPage.jsp"%>
               
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center">                                
                                <div class="single_product_menu">
                                    <p><span>31 </span> Posting Found</p>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                    <div class="cart_inner">
		        <div class="table-responsive">
		          <table class="table">
		            <thead>
		              <tr>
		                <th scope="col">Title</th>
		                <th scope="col">Nickname</th>
		                <th scope="col">Hit</th>
		                <th scope="col">Liked</th>
		              </tr>
		            </thead>
		            <tbody>
		              <tr>
		                <td>
		                  <div class="media">
		                    <div class="d-flex" >
		                      <img src="" style="border-radius: 100%" alt="썸네일" />
		                    </div>
		                    <div class="media-body">
		                      <p>침대 올라갈땐 신발 좀 벗으세요~~~!!</p>
		                    </div>
		                  </div>
		                </td>
		                <td>
		                  <p>kimpro</p>
		                </td>
		                <td>
		                  <div class="product_count">
		                    <p>135</p>
		                  </div>
		                </td>
		                <td>
		                  <p>12</p>
		                </td>
		              </tr>
		              <tr>
		                <td>
		                  <div class="media">
		                    <div class="d-flex">
		                      <img src="img/product/single-product/cart-1.jpg" alt="썸네일" />
		                    </div>
		                    <div class="media-body">
		                      <p>데오드란트 바르고 여행하세요~~ 썩은 양파내</p>
		                    </div>
		                  </div>
		                </td>
		                <td>
		                  <p>mulba</p>
		                </td>
		                <td>
		                  <div class="product_count">		                    
		                    <p>135</p>
		                  </div>
		                </td>
		                <td>
		                  <p>24</p>
		                </td>
		              </tr>
		              <tr>
		                <td>
		                  <div class="media">
		                    <div class="d-flex">
		                      <img src="img/product/single-product/cart-1.jpg" alt="썸네일" />
		                    </div>
		                    <div class="media-body">
		                      <p>다들 명동에서 티라미수 아몬드 많이 사가세여</p>
		                    </div>
		                  </div>
		                </td>
		                <td>
		                  <p>hayonezz</p>
		                </td>
		                <td>
		                  <div class="product_count">
		                    <p>135</p>
		                  </div>
		                </td>
		                <td>
		                  <p>36</p>
		                </td>
		              </tr>
		            </tbody>
		          </table>		          
		        </div>
		      </div>
                    
                    
                    
                </div>
            </div>
        </div>
    </section>
    

    <!--::footer_part start::-->
    <%@ include file="../common/footer.jsp"%>
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="resources/js/stellar.js"></script>
    <script src="resources/js/price_rangs.js"></script>
     <script src="resources/js/custom.js"></script>
</body>

</html>