<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="f_l">
            <div style="width: 248px; padding: 50px 0;">
                <div class="bbs_left_menu_title">커뮤니티</div>
                <div class="bbs_left_menu_link">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tbody>
                            <tr>
                                <td><a href="${contextPath }/news/">공지사항</a> <!-- { {BLIST.now_count} } -->
                                </td>
                            </tr>
                            <tr>
                                <td><a href="${contextPath }/forum/">자유게시판</a> <!-- { {BLIST.now_count} } -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
</div>
