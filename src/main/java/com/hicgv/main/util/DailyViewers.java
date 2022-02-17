package com.hicgv.main.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class DailyViewers {
	public static void main(String[] args) {
		
	}
	// 영화진흥위원회 Api 사용
	// 일일 관람객 URL
	private String apiURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
	public static final String KEY = "e65350d6dfb171753380a52de708b7a8"; // 발급받은 api키
	private String[] rank = {"","","","","","","","","",""};
	
	private String today;

	public DailyViewers(String today) {
		// 일별관람객을 가져오고싶은 날짜 입력
		this.today = today;
		String res = getTodayViewer(getApiUrl());
		parseData(res);

	}

	public String getApiUrl() {
		// 키값과 날짜를 주소에 넣어서 보내줌
		apiURL = apiURL + "?key=" + KEY + "&targetDt=" + today;
		return apiURL;
	}
	
	public String getTodayViewer(String apiURL) {
		String responseBody = null;
		try {
			URL url = new URL(apiURL);
			InputStream in = url.openStream();
			responseBody = readBody(in);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return responseBody;
	}

	private String readBody(InputStream body) {
		InputStreamReader reader = new InputStreamReader(body);
		try (BufferedReader lineReader = new BufferedReader(reader)) {

			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("API 불러오기 실패");
		}
	}

	private void parseData(String responseBody) {
		String title; // 영화제목
		String movieCd; // 영화 코드
		String audiCnt; // 당일 관람객
		JSONObject jsonObject = null;
		try {
			jsonObject = new JSONObject(responseBody.toString());
			JSONObject jsonObject1 = (JSONObject) jsonObject.get("boxOfficeResult");

			JSONArray jsonArray = jsonObject1.getJSONArray("dailyBoxOfficeList");

			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				title = item.getString("movieNm");
				movieCd = item.getString("movieCd");
				audiCnt = item.getString("audiCnt");
				rank[i] = item.getString("rank");
				System.out.println("rank : "+rank[i]+"movieCd : " + movieCd + " movieNm : " + title + " audiCnt : " + audiCnt);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
}
