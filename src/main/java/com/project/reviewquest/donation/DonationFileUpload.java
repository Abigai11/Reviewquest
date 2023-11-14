package com.project.reviewquest.donation;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class DonationFileUpload {
	public void fileUpload(DonationDTO donationDTO, HttpServletRequest request, MultipartFile file) {
		// 이전 파일 경로 및 파일 이름 가져오기
	    String filePath = donationDTO.getFilePath();
	    System.out.println(file);
	    System.out.println(filePath);
	    String path = request.getServletContext().getRealPath("/resources/images/doUpload");
        File previous = new File(path+ File.separator + filePath);
        System.out.println(previous.exists());
	    
	    // 이전 파일 삭제
	    if (filePath != null && !filePath.isEmpty()) {
	        String realPath = request.getServletContext().getRealPath("/resources/images/doUpload");
	        File previousFile = new File(realPath + File.separator + filePath);
	        
	        if (previousFile.exists()) {
	            try {
	                if (previousFile.delete()) {
	                    System.out.println("이전 파일 삭제 성공");
	                } else {
	                    System.out.println("이전 파일 삭제 실패");
	                }
	            } catch (SecurityException e) {
	                System.err.println("파일 삭제 중 보안 예외 발생: " + e.getMessage());
	            }
	        } else {
	            System.out.println("이전 파일이 존재하지 않습니다.");
	        }
	    }

        // 파일 저장 로직
        String realPath = request.getServletContext().getRealPath("/resources/images/doUpload");
        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = realPath + File.separator + today;
        System.out.println(saveFolder);

        File folder = new File(saveFolder);
        if (!folder.exists())
            folder.mkdirs();
        String originFileName = file.getOriginalFilename();
        if (originFileName != null && !originFileName.isEmpty()) {
            String ext = originFileName.substring(originFileName.lastIndexOf("."));
            String ranFileName = UUID.randomUUID().toString() + ext;

            File changeFile = new File(saveFolder + File.separator + ranFileName);

            try {
                file.transferTo(changeFile);
                System.out.println("파일 업로드 성공");
            } catch (IllegalStateException | IOException e) {
                System.out.println("파일 업로드 실패");
                changeFile.delete();
                e.printStackTrace();
            }
            donationDTO.setFileName(originFileName);
            donationDTO.setFilePath(today + File.separator + ranFileName);

        }
    }
}
