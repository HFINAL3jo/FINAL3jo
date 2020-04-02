<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <style>
    /* Containers */
html, body {
  min-height: 100%;
}

.rb-box {
    position: relative;
  width: 80%;
  max-width: 60%;
  margin: 50px auto;
  padding: 1.3em;
  border-radius: .75em;
  -webkit-filter: drop-shadow(1px 2px 5px rgba(0,0,0,.3));
  filter: alpha(opacity=50);
  box-shadow: 
    0 2px 2px rgba(122, 118, 128, 0.5),
    0 0px 5px rgba(122, 118, 128,.15),
    0 0px 4px rgba(0,0,0,.35),
    0 5px 20px rgba(122, 118, 128,.25),
    0 15px 50px rgba(122, 118, 128,.75),
    inset 0 0 15px rgba(255,255,255,.05);
}

/* Custom Radio Button */
p {
  font-size: 1.5em;
}

.rb {
  padding: 16px 0;
  text-align: center;
  background: rgba(255,255,255,.03);
  border-radius: .3em;
}

.rb-tab {
  display: inline-block;
  position: relative;
  width: 20%;
}

.rb-txt {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: .5em;
  color: #FFFFFF;
}

.rb-spot {
  position: absolute;
  width: 18px;
  height: 18px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: transparent;
  border: 2px solid rgba(255,255,255,.3);
  border-radius: 100%;
  cursor: pointer;
  transition: ease .5s;
}

.rb-tab-active .rb-spot {
  background: rgba(255, 0, 0, 0.35);
  border: 2px solid rgba(243,49,128,.6);
}

/* Submit Button */
.button-box {
  padding: 10px 0;
  text-align: center;
}
    .q-title{
        border-top: 1px solid rgba(0, 0, 0, 0.7);
        border-bottom: 1px solid rgba(0, 0, 0, 0.7);
        width: 100%;
        text-align: center;
        clear: both;
        padding: 30px 0;
    }

    .select_box>label{
        width: 100%;
        height: 100%;
        cursor: pointer;
    }

    .select_box{
        border: 1px solid black;
        width: 300px;
        height: 300px;
        text-align: center;
        margin: auto;
        margin-top: 15px;
    }
</style>
    <script src="resources/js/jquery-3.4.1.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

</head>
<body>
    <script>
        AOS.init();
    </script>


    <!--::header part start::-->
    
                                
    <%@ include file="../common/menubar.jsp" %>
    <!-- Header part end-->


    <!-- survey part start -->
    <section class="feature_part padding_top">
        <form action="">
            <div>
                <div class="area">
                    <div class="row justify-content-center" style="margin-top: 300px;">
                        <h1 data-aos="zoom-in" >Recommend</h1>
                    </div>
                    <div class="row justify-content-center" style="margin-top: 100px; margin-bottom: 20px;" data-aos="zoom-in" data-aos-duration="1000">
                        <i class="fas fa-angle-double-down fa-4x down" style="color: #FF4081; cursor: pointer;"></i>
                    </div>
                </div>
            </div>


            <!-- 질문 1번 -->
            <div style="display: none;">
                <div class="area">
                    <div class="row justify-content-center" style="width: 65%; margin: 100px auto;">
                        <h2 class="q-title">1. Visit counts</h2>
                    </div>
                    <div class="rb-box">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="vcLittle" name="ans1" value="vcLittle">
                                <label for="vcLittle">
                                    <div class="text-center">
                                        <h3>방문 횟수 적음</h3>
                                    </div>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" alt="" width="200" height="200">
                            <div class="select_box">
                                <input type="radio" id="vsMany" name="ans1" value="vsMany">
                                <label for="vsMany">
                                    <div class="text-center">
                                        <h3>방문 횟수 많음</h3>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center" style="margin-top: 100px; margin-bottom: 20px;">
                        <i class="fas fa-angle-double-down fa-4x down" style="color: #FF4081; cursor: pointer;"></i>
                    </div>
                </div>
            </div>



            <!-- 질문 2번 -->
            <div style="display: none;">
                <div class="area">
                    <div class="row justify-content-center" style="width: 65%; margin: 100px auto;">
                        <h2 class="q-title">2. Travle propensity</h2>
                    </div>
                    <div class="rb-box">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="tpFamily" name="ans2" value="tpFamily">
                                <label for="tpFamily">
                                    <div class="text-center">
                                        <h3>익숙함을 추구한다</h3>
                                    </div>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" alt="" width="200" height="200">
                            <div class="select_box">
                                <input type="radio" id="tpNew" name="ans2" value="tpNew">
                                <label for="tpNew">
                                    <div class="text-center">
                                        <h3>새로운 경험을 추구한다.</h3>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center" style="margin-top: 100px; margin-bottom: 20px;">
                        <i class="fas fa-angle-double-down fa-4x down" style="color: #FF4081; cursor: pointer;"></i>
                    </div>
                </div>
            </div>



            <!-- 질문 3 번 -->
            <div style="display: none;">
                <div class="area">
                    <div class="row justify-content-center" style="width: 65%; margin: 100px auto;">
                        <h2 class="q-title">3. Travle propensity 2</h2>
                    </div>
                    <div class="rb-box">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="tp2Famous" name="ans3" value="tp2Famous">
                                <label for="tp2Famous">
                                    <div class="text-center">
                                        <h3>유명한 곳</h3>
                                    </div>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" alt="" width="200" height="200">
                            <div class="select_box">
                                <input type="radio" id="tp2NotFamous" name="ans3" value="tp2NotFamous">
                                <label for="tp2NotFamous">
                                    <div class="text-center">
                                        <h3>유명하지 않은 곳</h3>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center" style="margin-top: 100px; margin-bottom: 20px;">
                        <i class="fas fa-angle-double-down fa-4x down" style="color: #FF4081; cursor: pointer;"></i>
                    </div>
                </div>
            </div>



            <!-- 질문 4번 -->
            <div style="display: none;">
                <div class="area">
                    <div class="row justify-content-center" style="width: 65%; margin: 100px auto;">
                        <h2 class="q-title">4. Purpose of Travle </h2>
                    </div>
                    <div class="rb-box">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="recreation" name="ans4" value="recreation">
                                <label for="recreation">
                                    <div class="text-center">
                                        <h3>휴양</h3>
                                    </div>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" alt="" width="200" height="200">
                            <div class="select_box">
                                <input type="radio" id="tourist" name="ans4" value="tourist">
                                <label for="tourist">
                                    <div class="text-center">
                                        <h3>관광</h3>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center" style="margin-top: 100px; margin-bottom: 20px;">
                        <i class="fas fa-angle-double-down fa-4x down" style="color: #FF4081; cursor: pointer;"></i>
                    </div>
                </div>
            </div>


            <!-- 질문 5번 -->
            <div style="display: none;">
                <div class="area">
                    <div class="row justify-content-center" style="width: 65%; margin: 100px auto;">
                        <h2 class="q-title">5. Travle sensibility</h2>
                    </div>
                    <div class="rb-box">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="calm" name="ans5" value="calm">
                                <label for="calm">
                                    <div class="text-center">
                                        <h3>차분함</h3>
                                    </div>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" alt="" width="200" height="200">
                            <div class="select_box">
                                <input type="radio" id="active" name="ans5" value="active">
                                <label for="active">
                                    <div class="text-center">
                                        <h3>활동적</h3>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center" style="margin-top: 100px; margin-bottom: 20px;">
                        <i class="fas fa-angle-double-down fa-4x down" style="color: #FF4081; cursor: pointer;"></i>
                    </div>
                </div>
            </div>


            <!-- 질문 6번 -->
            <div style="display: none;">
                <div class="area">
                    <div class="row justify-content-center" style="width: 65%; margin: 100px auto;">
                        <h2 class="q-title">6. Travle sensibility 2</h2>
                    </div>
                    <div class="rb-box">
                        <div class="row align-items-center justify-content-between">
                            <div class="select_box">
                                <input type="radio" id="urban" name="ans6" value="urban">
                                <label for="urban">
                                    <div class="text-center">
                                        <h3>도시적인</h3>
                                    </div>
                                </label>
                            </div>
                            <img src="resources/images/vs.png" alt="" width="200" height="200">
                            <div class="select_box">
                                <input type="radio" id="natural" name="ans6" value="natural">
                                <label for="natural">
                                    <div class="text-center">
                                        <h3>자연적인</h3>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center" style="margin-top: 100px; margin-bottom: 20px;">
                        <input type="submit" value="RESULT" class="genric-btn primary e-large" style="width: 300px; font-size: 15px;">
                    </div>
                </div>
            </div>
            

        </form>
    </section>
    
    




    
    <!--::footer_part start::-->
   	<%@ include file="../common/footer.jsp" %>
    <!--::footer_part end::-->

   
    
    <!-- custom js -->

    <script>
        $(function(){

            $('.down').on('click',function(){

                $(this).parent().parent().parent().next().slideDown(1500);

                
                var offset = $(this).parent().parent().parent().next().offset();
                
                $('html').animate({scrollTop : offset.top}, 1500);
            });
        });
    </script>

    
</body>
</html>