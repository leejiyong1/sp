package util;


public class HangulSearcher {
	// 초성 리스트
    private static final char[] CHO_SUNG = {
        'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'
    };
    
    //초성검색
    public static String resultChosung(String s) {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (ch >= '가' && ch <= '힣') {
            	//ch-'가':ch에서 '가'까지의거리계산  (21*28):중성*종성 나눠서 '가'부터시작하는 초성목록 몇번째인지 확인
                int chosungIndex = (ch - '가') / (21 * 28);
                sb.append(CHO_SUNG[chosungIndex]);
            } else {
                sb.append(ch);
            }
        }

        return sb.toString();
    }
    //초성인지 아닌지 구분
    public static boolean checkChosung(char s) {
    	for(int i = 0; i<CHO_SUNG.length; i++) {
    		if(s == CHO_SUNG[i]) {
    			return false;
    		}
    	}
    	return true;
    }
    //리스트가 null이면 마지막글자의 초성,중성이랑 같은글자 찾는 메소드
    public static int[] getChosungJungsung(String s) {
        char ch = s.charAt(s.length()-1); // 첫 글자를 추출
        int[] result = new int[2]; // 초성, 중성 인덱스를 저장할 배열

        if (ch >= '가' && ch <= '힣') {
            int hanIndex = ch - '가';
            int chosungIndex = hanIndex / (21 * 28);
            int jungsungIndex = (hanIndex % (21 * 28)) / 28;

            result[0] = chosungIndex;
            result[1] = jungsungIndex;
        } else {
            // 한글이 아닌 경우
            result[0] = -1;
            result[1] = -1;
        }

        return result;
   }
    
    //첫글자검색했을때 값이null이면 초성중성 같은거 출력
    public static String composeHangul(String first) {
        StringBuilder newfirst = new StringBuilder();

        for (char ch : first.toCharArray()) {
            if (ch >= '가' && ch <= '힣') { // 한글 범위 확인
            	 int hanIndex = ch - '가';
                 int chosungIndex = hanIndex / (21 * 28);
                 int jungsungIndex = (hanIndex % (21 * 28)) / 28;

                int newUniVal = '가' + chosungIndex * (21 * 28) + jungsungIndex * 28;
                newfirst.append((char) newUniVal);
            } else {
            	newfirst.append(ch);
            }
        }

        return newfirst.toString();
    }
}
