package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ColorController {

//	private static String changedImageName(String originName) {
//		String random = UUID.randomUUID().toString();
//		return random + originName;
//	}
//
//	@AllArgsConstructor
//	@Getter
//	public class Image {
//		// 요청을 하면 클라이언트에게 originName을 보여주고
//		// storedImagePath에 저장된 경로에서 불러오면 됨
//		private String originName;
//		private String storedImagePath;
//	}
//
//	private static String createDirPath(String changedName) {
//		return "c:\\images\\" + changedName;
//		// 이미지가 저장될 경로. 필요에 따라 경로 조정
//	}
//
//	public static Image uploadImage(MultipartFile image) {
//		String originName = image.getOriginalFilename();
//		String changedName = changedImageName(originName);
//		String storedImagePath = createDirPath(changedName);
//		System.out.println("storedImagePath = " + storedImagePath);
//
//		try {
//			image.transferTo(new File(storedImagePath));
//		} catch (IOException e) {
//			// 내가 만든 커스텀 예외.
//			// 직접 만든 예외라서 적절히 변경하여 사용.
//		}
//		return new Image(originName, storedImagePath);
//	}

	@RequestMapping("/color")
	public String findColor() {
		
		return "/WEB-INF/views/tone/mytone.jsp";
	}

	@ResponseBody
	@RequestMapping("/mytone")
	public String find() {
		int res = -1;
		log.info("내색깔 찾기");

		String colorReturn = "#ffffff";
		if (res == -1) {
			log.info("색깔 찾기 실패");
			return colorReturn;
		}
		return colorReturn;
	}
}
