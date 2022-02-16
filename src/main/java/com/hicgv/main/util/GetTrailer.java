package com.hicgv.main.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import oracle.net.aso.e;

public class GetTrailer {
	//cgv 메인페이지 트레일러 주소 가져오기
	private String url = "https://www.cgv.co.kr/";
	Connection connection = Jsoup.connect(url);
	private Map<String, String> trailMap = new HashMap<String, String>();
	
	public Map<String, String> getTrailer() {
		String trailerUrl=null;
		String trailerTitle=null;
		String trailerScr=null;
		try {
			
			
			Document document = connection.get();
			Elements elements = document.select("div.video_wrap");
			
			for (Element element : elements) {
				System.out.println(element);
				
				trailMap.put("video", trailerUrl = element.select("source").attr("src"));
				trailMap.put("title", trailerTitle = element.select("strong").toString());
				trailMap.put("script",trailerScr = element.select("span").toString());
				
				//System.out.println(trailerUrl);
				
				System.out.println(trailerTitle);
				System.out.println(trailerScr);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}
		return trailMap;

	}
}
