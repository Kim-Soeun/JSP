package common;

public class BoardPage {
	
	public static String pagingStr(int totalCount, int pageSize, int blockSize, int pageNum, int totalPage) {
		
		String pagingStr = "";
		
		// pageTemp 결과는 -> 1, 11, 21, 31, 41, 51 등등
		int pageTemp = (((pageNum - 1) / blockSize) * blockSize) + 1;
		
		// 처음 페이지, 이전 페이지 출력
		pagingStr += "<a href='boardmain.jsp?pageNum=1'>[처음으로]</a>";
		pagingStr += "&nbsp;";
		pagingStr += "<a href='boardmain.jsp?pageNum=" + (pageNum-1) + "'>[이전]</a>";
	

		// 각 페이지 번호 출력
		int block = 1;
		while(block <= blockSize && pageTemp <= totalPage) {
			if(pageTemp == pageNum) {
				pagingStr += "&nbsp;<a style='color:red' href='boardmain.jsp?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			} else {
				pagingStr += "&nbsp;<a href='boardmain.jsp?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			block++;
		}
		
		
		
		// 마지막 페이지, 다음 페이지 출력
		pagingStr += "<a href='boardmain.jsp?pageNum=" + (pageNum+1) + "'>[다음]</a>";
		pagingStr += "&nbsp;";
		pagingStr += "<a href='boardmain.jsp?pageNum=" + totalPage + "'>[마지막으로]</a>";
		
		
		
		return pagingStr;
	}
	
	
}
