package com.hicgv.movies.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class AAMovieApi {
	// 상수 설정
    // 요청(Request) 변수
	private final String MOVIEA_URL  = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
	private final String API_KEY  = "e65350d6dfb171753380a52de708b7a8";
	
	// 일자 포맷
    private final SimpleDateFormat DATE_FORM = new SimpleDateFormat("yyyyMMdd");//이거했는데 옛날일자로 나옴
    
    // Map -> QueryString
    public String makeQueryString(Map<String, String> paramMap) {
        final StringBuilder sb = new StringBuilder();
 
        paramMap.entrySet().forEach(( entry )->{
            if( sb.length() > 0 ) {
                sb.append('&'); //&로 (키밸류)(키밸류)연결
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        });
        
        
 
        //sb = "&key=e65350d6dfb171753380a52de708b7a8&targetDt=20220216&itemPerPage=10"
        return sb.toString();
    }
 
    // API요청
    public void requestAPI() {
        // 변수설정
        //   - 하루전 날짜 (오늘날짜는 안떠서)
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.DATE, -1);
 
        // 변수 설정
        //   - 요청(Request) 인터페이스 Map
        //   - 어제자 탑10영화조회
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("key"          , API_KEY);                        // 발급받은 인증키
        paramMap.put("targetDt"     , DATE_FORM.format(cal.getTime()));  // 조회하고자 하는 날짜
        paramMap.put("itemPerPage"  , "10");                            // 결과 ROW 의 개수( 최대 10개 )
        //paramMap.put("multiMovieYn", "Y");
        
        try {
            // Request URL 연결 객체 생성
            URL requestURL = new URL(MOVIEA_URL+"?"+makeQueryString(paramMap));
            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
 
            // GET 방식으로 요청
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
 
            // 응답(Response) 구조 작성
            //   - Stream -> JSONObject
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String readline = null;
            StringBuffer response = new StringBuffer();
            while ((readline = br.readLine()) != null) {
                response.append(readline);
            }
 
            // JSON 객체로  변환
            JSONObject responseBody = new JSONObject(response.toString());
 
            // 데이터 추출
            JSONObject boxOfficeResult = responseBody.getJSONObject("boxOfficeResult");
 
            // 박스오피스 주제 출력
            String boxofficeType = boxOfficeResult.getString("boxofficeType");
            System.out.println(boxofficeType);
 
            // 박스오피스 목록 출력
            JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("dailyBoxOfficeList");
            Iterator<Object> iter = dailyBoxOfficeList.iterator();
            while(iter.hasNext()) {
                JSONObject boxOffice = (JSONObject) iter.next();
                System.out.printf("  %s - %s\n", boxOffice.get("rnum"), boxOffice.get("movieNm"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
 
    public static void main(String[] args) {
        // API 객체 생성
    	AAMovieApi api = new AAMovieApi();
 
        // API 요청
        api.requestAPI();
    }
	
}