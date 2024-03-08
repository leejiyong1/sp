package beauty;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatIllegalArgumentException;

import org.junit.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Test1 {
	/*
	 * public static void main(String[] args) {
	 * System.loadLibrary(org.opencv.core.Core.NATIVE_LIBRARY_NAME); String
	 * imageLocation = "/resources/images/temp.png"; Mat imageRead =
	 * Imgcodecs.imread(imageLocation, Imgcodecs.CV_LOAD_IMAGE_UNCHANGED); Mat image
	 * = new Mat(); Imgproc.resize(imageRead, image, new Size(28, 28)); Mat data =
	 * new Mat(14, 14, CvType.CV_8UC3); System.out.println(image.row(14));
	 * System.out.println(image.col(14));
	 * 
	 * 
	 * }
	 */
	@Test
	public void exam() {
		String a = "a";
		assertThat(a).isEqualTo("a");
//		assertThatIllegalArgumentException().isThrownBy((e) -> {
//        
//        }
	}
}