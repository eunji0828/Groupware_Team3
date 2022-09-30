<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JaeHee Group</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../resources/css/styles.css">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../resources/css/board/board_write.css"> 
</head>

<body class="sb-nav-fixed">
<!-- 상단/왼쪽 메뉴 include -->
<%@ include file="/WEB-INF/views/intro.jsp" %>

         <div id="layoutSidenav_content">
            <div class="content_box">
                <i class="fa-regular fa-pen-to-square"></i>글쓰기
            </div>

            <!-- 전체 감싸는 container -->
            <div id="board_write_container">
                <form>
              
                <!-- 게시글작성 테이블 -->
                <div class="board_write_insert_info">
                    
                        <table class="board_write_table">
                            <tr>
                                <td class="board_td1">카테고리</td>
                                <td class="board_td2">
                                		<select name="" id="board_select">
                                        <option value="">공지사항</option>
                                        <option value="">일반게시판</option>
                                        <option value="">자료실</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td class="board_td1">제목<span><input type="checkbox" id="important">중요!</span></td>
                                <td class="board_td2"><input type="text" id="board_title" name="" placeholder="제목을 입력하세요"></td>
                            </tr>
                            <tr>
                                <td class="board_td1">작성자</td>
                                <td class="board_td2">${board_normal.emp_name}</td>
                            </tr>
                            <tr>
                                <td class="board_td1">첨부파일</td>
                                <td class="board_td2"><input type="file" value="파일선택"></td>
                            </tr>
                        </table>
                </div>

                <!-- 에디터 추가  -->
                <div class="board_write_editor">
                    <div id="ckeditor" name="ckeditor"></div>
                </div>

                <!-- 버튼 -->
                <div class="board_bottom_btn">
                    <button class="board_btn board_submit_btn">작성 완료</button>
                    <button class="board_btn board_cancel_btn">취소</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src = "resources/api/ckeditor4_full/ckeditor.js"></script>
    <script src="../../resources/js/board/board.js"></script>
     
    
</body>

</html>