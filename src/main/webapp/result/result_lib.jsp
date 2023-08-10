<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: lib 페이지
* @original author: SearchTool
*/
	thisCollection = "lib";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
			<div class="sectit">
				<h2><%=wnsearch.getCollectionKorName(thisCollection)%></h2>
				<p>| 검색결과 <%=numberFormat(thisTotalCount)%>건</p>
			</div>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String DATE                     = wnsearch.getField(thisCollection,"Date",idx,false);
                String TITLE                    = wnsearch.getField(thisCollection,"TITLE",idx,false);
                String CONTENT                  = wnsearch.getField(thisCollection,"CONTENT",idx,false);
                String WRITER                   = wnsearch.getField(thisCollection,"WRITER",idx,false);
                String PARAM1                   = wnsearch.getField(thisCollection,"PARAM1",idx,false);
                String PARAM2                   = wnsearch.getField(thisCollection,"PARAM2",idx,false);
                String PARAM3                   = wnsearch.getField(thisCollection,"PARAM3",idx,false);
                String FILEEXT                  = wnsearch.getField(thisCollection,"FILEEXT",idx,false);
                String FILENAME                 = wnsearch.getField(thisCollection,"FILENAME",idx,false);
                String FILECONTENT              = wnsearch.getField(thisCollection,"FILECONTENT",idx,false);
                String PUB_YEAR                 = wnsearch.getField(thisCollection,"PUB_YEAR",idx,false);
                String TITLE_ORDER              = wnsearch.getField(thisCollection,"TITLE_ORDER",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				TITLE= wnsearch.getKeywordHl(TITLE,"<font color=red>","</font>");
				CONTENT= wnsearch.getKeywordHl(CONTENT,"<font color=red>","</font>");
				WRITER= wnsearch.getKeywordHl(WRITER,"<font color=red>","</font>");
				FILENAME= wnsearch.getKeywordHl(FILENAME,"<font color=red>","</font>");
				FILECONTENT= wnsearch.getKeywordHl(FILECONTENT,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
				<dl class="resultsty1">
					<dt>
						<p class="date"><%=DATE%></p>
						<p class="fl"><a href="#"><%=TITLE%></a></p>
					</dt>
					<dd class="lh18"><%=CONTENT%></dd>
              <dd class="lh18"> DOCID : <%=DOCID%></dd>
              <dd class="lh18"> Date : <%=DATE%></dd>
              <dd class="lh18"> PARAM1 : <%=PARAM1%></dd>
              <dd class="lh18"> PARAM2 : <%=PARAM2%></dd>
              <dd class="lh18"> PARAM3 : <%=PARAM3%></dd>
              <dd class="lh18"> FILEEXT : <%=FILEEXT%></dd>
              <dd class="lh18"> FILENAME : <%=FILENAME%></dd>
              <dd class="lh18"> FILECONTENT : <%=FILECONTENT%></dd>
              <dd class="lh18"> PUB_YEAR : <%=PUB_YEAR%></dd>
              <dd class="lh18"> TITLE_ORDER : <%=TITLE_ORDER%></dd>
              <dd class="lh18"> ALIAS : <%=ALIAS%></dd>
				</dl>
 <%
			}

			if ( collection.equals("ALL") && thisTotalCount > TOTALVIEWCOUNT ) {
%>
				<div class="moreresult"><a href="#none" onClick="javascript:doCollection('<%=thisCollection%>');">더보기</a></div>
<%
			}
		}
	}
%>


<!-- 전자도서관 -->
 <!-- <div class="result_contents">
     <div class="result_top">
         <h3 class="title">
             전자도서관 [ <a href="search_09.html" class="result_count">55</a>건 ]
         </h3>
         <a href="search_09.html" class="btn_more">결과 더보기</a>
     </div>
     <div class="result_btm">
         <table class="result_type_table" border="0">
             <colgroup>
                   <col width="*">
                   <col width="25%">
                   <col width="10%">
             </colgroup>
             <tr>
                   <th>제목</th>
                   <th>저자</th>
                   <th>발행년도</th>
             </tr>
             <tr>
                   <td class="txt_l"><a href="#">한국 제0차 혁명 <b class="keyword">휴가</b> : 기술·경제·사회·청책 혁신의 통합적 접근</a></td>
                   <td class="txt_c">김연구, 이박사, 박저자, 최발행, 정논문</td>
                   <td class="txt_c">2023.01.01</td>
             </tr>
             <tr>
                   <td class="txt_l"><a href="#"><b class="keyword">휴가</b>의 순기능</a></td>
                   <td class="txt_c">최발행, 정논문</td>
                   <td class="txt_c">2023.01.01</td>
             </tr> 
             <tr>
                   <td class="txt_l"><a href="#"><b class="keyword">휴가</b> 잘 보내는 법</a></td>
                   <td class="txt_c">박저자</td>
                   <td class="txt_c">2023.01.01</td>
             </tr> 
         </table>
     </div>
 </div> -->