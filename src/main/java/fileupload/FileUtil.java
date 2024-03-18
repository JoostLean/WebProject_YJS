package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

//파일업로드와 관련된 기능을 메서드로 정의한 유틸리티 클래스
public class FileUtil {

	//파일업로드 처리(매개변수1:request내장객체, 매개변수2:디렉토리)
	public static String uploadFile(HttpServletRequest req, String sDirectory)
			throws ServletException, IOException {
		/*
		파일 첨부를 위한 <input> 태그의 name속성값을 이용해서 Part객체를
		생성한다. 해당 객체를 통해 파일을 서버에 저장할 수 있다. 
		*/
		Part part = req.getPart("ofile");
		
		/*
		Part객체에서 아래 헤더값을 읽어오면 전송된 파일명을 알 수 있다.
		(콘솔에서 확인할 것)
		*/
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader="+ partHeader);
		
		/*
		"filename="를 구분자로 헤더값을 split()하면 String형 배열로
		반환된다. 
		*/
		String[] phArr = partHeader.split("filename=");
		/*
		앞에서 split()한 결과중 인덱스 1은 파일명이 된다. 여기서
		더블쿼테이션을 제거하면 순수한 파일명만 남는다. replace()를 통해
		제거할 수 있다. 이때 이스케이프 시퀀스를 추가해야 에러가 발생하지
		않는다. 
		*/
		String originalFileName = phArr[1].trim().replace("\"", "");
		
		/*
		전송된 파일이 있는 경우라면 디렉토리에 파일을 저장한다.
		File.separator : 운영체제(OS)마다 경로를 표시하는 기호가
			다르므로 해당 OS에 맞는 것을 자동으로 기술해준다.
		*/
		if (!originalFileName.isEmpty()) {
			part.write(sDirectory+ File.separator +originalFileName);
		}
		
		//원본파일명을 반환한다.
		return originalFileName;
	}
	
	//서버에 저장된 파일명을 변경한다.
	public static String renameFile(String sDirectory,
			String fileName) {
		/*
		파일명에서 확장자를 잘라내기 위해 뒤에서 .이 있는 위치를 찾는다.
		파일명에는 2개 이상의 .을 사용할 수 있기 때문이다.
		*/
		String ext = fileName
				.substring(fileName.lastIndexOf("."));
		/*
		날짜와 시간을 이용해서 파일명으로 사용할 문자열을 생성한다.
		"년월일_시분초123"과 같은 형태가 된다. 
		*/
		String now = new SimpleDateFormat("yyyyMMdd_HmsS")
				.format(new Date());
		/*
		생성한 파일명과 확장자를 결합한다.
		*/
		String newFileName = now + ext;
		
		//원본파일명과 새로운파일명을 통해 File객체를 생성한다.
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		//파일명을 변경한다.
		oldFile.renameTo(newFile);
		//변경된 파일명을 반환한다.
		return newFileName;
	}
	
	public static ArrayList<String> multipleFile(HttpServletRequest req, 
		String sDirectory)
			throws ServletException, IOException {
		ArrayList<String> listFileName = new ArrayList<>();
	
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			if(!part.getName().equals("ofile"))
				continue;	
			
	        String partHeader = part.getHeader("content-disposition");
	        System.out.println("partHeader="+ partHeader);
	        
	        String[] phArr = partHeader.split("filename=");
	        String originalFileName = phArr[1].trim().replace("\"", "");
			
			if (!originalFileName.isEmpty()) {				
				part.write(sDirectory+ File.separator +originalFileName);
			}
			
			listFileName.add(originalFileName);
		}
	
		return listFileName;			
	}
	
	//파일삭제
	public static void deleteFile(HttpServletRequest req,
			String directory, String filename) {
		//업로드 디렉토리의 물리적경로 얻어오기
		String sDirectory = req.getServletContext()
				.getRealPath(directory);
		//디렉토리와 파일명을 조립해서 File객체 생성
		File file = new File(sDirectory + File.separator + filename);
		if (file.exists()) {
			//파일이 경로에 존재한다면 삭제
			file.delete();
		}
	}
	
	public static void download(HttpServletRequest req, HttpServletResponse resp,
            String directory, String sfileName, String ofileName) {
        String sDirectory = req.getServletContext().getRealPath(directory);
        try {
            // 파일을 찾아 입력 스트림 생성
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition",
                           "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length() );

            //out.clear();  // 출력 스트림 초기화

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte b[] = new byte[(int)file.length()];
            int readBuffer = 0;
            while ( (readBuffer = iStream.read(b)) > 0 ) {
                oStream.write(b, 0, readBuffer);
            }

            // 입/출력 스트림 닫음
            iStream.close();
            oStream.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        }
        catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }
}
