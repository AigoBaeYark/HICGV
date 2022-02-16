package com.hicgv.main.util;

import java.util.ArrayList;

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
	
	public String getTrailer() {
		String trailerUrl=null;
		try {
			
			ArrayList<String> arrayList = new ArrayList<String>();
			
			Document document = connection.get();
			Elements elements = document.select("video");
			
			for (Element element : elements) {
				System.out.println(element);
				element.children();
				trailerUrl = element.select("source").attr("src");
				//System.out.println(trailerUrl);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}
		return trailerUrl;

	}
}
