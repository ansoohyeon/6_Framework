<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<div id="commentArea">
    <!-- 댓글 목록 -->
    <div class="comment-list-area">
        
        <ul id="commentList">

            <c:forEach items="${board.commentList}" var="comment">
                <!-- 부모 댓글 -->
                <li class="comment-row">
                    <p class="comment-writer">

                        <!-- 프로필 이미지 -->
                        <c:if test="${empty comment.profileImage}">
                            <%-- 없을 경우 기본 이미지 --%>
                            <img src="/resources/images/user.png">
                        </c:if>

                        <c:if test="${!empty comment.profileImage}">
                            <%-- 있을 경우 기본 이미지 --%>
                            <img src="${comment.profileImage}">
                        </c:if>

                        <!-- 닉네임 -->
                        <span>${comment.memberNickname}</span>
                        
                        <!-- 작성일 -->
                        <span class="comment-date">${comment.commentCreateDate}</span>
                    </p>
                    
                    <!-- 댓글 내용 -->
                    <p class="comment-content">${comment.commentContent}</p>


                    <!-- 버튼 영역 -->
                    <div class="comment-btn-area">
                        <button>답글</button>   
                            
                        <c:if test="${loginMember.memberNo == comment.memberNo}">
                            <!-- 로그인 회원과 댓글 작성자가 같은 경우 -->  
                            <button>수정</button>     
                            <button>삭제</button>
                        </c:if>
                    </div>
                </li>
            </c:forEach>

            <!-- 자식 댓글 -->
            <li class="comment-row child-comment">
                <p class="comment-writer">

                    <!-- 프로필 이미지 -->
                    <img src="/resources/images/user.png">

                    <!-- 닉네임 -->
                    <span>닉네임</span>
                    
                    <!-- 작성일 -->
                    <span class="comment-date">2023년 05월 9일 12시 20분 10초</span>
                </p>
                
                <!-- 댓글 내용 -->
                <p class="comment-content">자식 댓글 입니다</p>


                <!-- 버튼 영역 -->
                <div class="comment-btn-area">
                    <button>답글</button>   
                        
                </div>
            </li>

        </ul>
    </div>
    

    <!-- 댓글 작성 부분 -->
    <div class="comment-write-area">
        <textarea id="commentContent"></textarea>
        <button id="addComment">
            댓글<br>
            등록
        </button>
 
    </div>

</div>