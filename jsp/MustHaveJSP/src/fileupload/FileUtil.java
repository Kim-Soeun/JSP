package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;


public class FileUtil {

	// 파일 업로드(multipart/form-data 요청) 처리
	public static MultipartRequest uploadFile(HttpServletRequest request, String saveDirectory, int maxPostSize) {
		
		try {
			System.out.println("FileUtil.java 파일 업로드 성공");
			return new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");
		
		
		} catch(Exception e) {
			System.out.println("FileUtil.java 파일 업로드 실패");
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	// 명시한 파일을 찾아 다운로드
	public static void download(HttpServletRequest request, HttpServletResponse response, String directory, String sfileName, String ofileName) {
		String sDirectory = request.getServletContext().getRealPath(directory);
		try {
			File file = new File(sDirectory, sfileName);
			// sDirectory 디렉토리에 위치한 sfileName 이름을 가진 파일을 나타내는 File 객체를 생성
			// 이렇게 생성된 File 객체를 사용하면 파일에 대한 여러 동작(읽기, 쓰기, 삭제 등)을 수행
			InputStream iStream = new FileInputStream(file);
			// file 변수에 저장된 파일을 읽어오기 위한 FileInputStream 객체 생성
			
			
			// 한글 파일명 깨짐 방지 처리
			// "User-Agent"를 통해 클라이언트의 웹 브라우저의 종류 알아옴
			String client = request.getHeader("User-Agent");
			// 인터넷 익스플로러일 때와 그 외의 경우를 구분하여 캐릭터셋을 설정
			if(client.indexOf("WOW64") == -1) {
				// 인터넷 익스플로러가 아닌 경우 (ex. 크롬) -> 인코딩 UTF-8로 설정
				ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				// 인터넷 익스플로러인 경우
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}
			
			
			// 파일 다운로드용 응답 헤더 설정
			response.reset();		// 응답 헤더 초기화
			response.setContentType("application/octet-stream");	// 8비트 스트림 설정
			response.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
			response.setHeader("Content-Length", "" + file.length());
			
			// response 내장 객체로부터 새로운 출력 스트림 생성
			OutputStream oStream = response.getOutputStream();
			
			// 출력 스트림에 읽어온 파일 내용 출력
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while((readBuffer = iStream.read(b)) > 0 ) {
			// 읽은 바이트 수가 0보다 큰 동안 계속해서 루프가 실행
					oStream.write(b, 0, readBuffer);
					// 읽어온 데이터를 oStream에 씀
					// 바이트 배열 b의 처음부터 readBuffer까지의 데이터를 출력 스트림에 기록 -> 파일 클라이언트로 전송
				}
			
			// 입출력 스트림 닫음
			iStream.close();
			oStream.close();
			System.out.println("파일 찾기 성공");
			
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일을 찾을 수 없습니다");
		}
	}
	
	
	// 저장된 위치의 파일 삭제
	public static void deleteFile(HttpServletRequest request, String directory, String filename) {
	
		// 파일이 저장된 디렉토리의 물리적 경로를 얻어온 다음
		String sDirectory = request.getServletContext().getRealPath(directory);
		// 경로와 파일명을 결합하여 파일 객체를 생성
		File file = new File(sDirectory + File.separator + filename);
		
		// 경로에 파일이 존재하면 삭제
		if(file.exists()) {
			file.delete();
		}
	}
}
