package com.hicgv.main.util;

import java.util.ArrayList;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class GetMoiveID {
	//cgv에서 영화ID 가져오기
	
	private String movieIDURL = "http://www.cgv.co.kr/movies";
	Connection connection = Jsoup.connect(movieIDURL);
	//private String url = "www.cgv.co.kr/search/?query="+title_kor;
	
	public void getMoviesID() {
		ArrayList<String> idstr = new ArrayList<String>();
		ArrayList<Integer> idIntegers = new ArrayList<Integer>();
		try {
			Document document = connection.get();
			Elements elements = document.select("span.thumb-image");
			for (Element element : elements) {
				//span class = thumbs-image 이하의 값들을 가져옴
				//System.out.println("elements : " + element);
				for (Element e : element.children()) {
					//하나 밑의 자식들을 가져옴
					//System.out.println(e);
					//String absSrc =e.text;
					//System.out.println("000"+e.select("img"));
					//img태그만 선택하고 src가 있으면 리스트에 넣음(이미지 주소만 가져옴)
					if(e.select("img").hasAttr("src")) {
						idstr.add(e.attr("src"));
					}
				}
			}
			
			for (String element : idstr) {
				System.out.println(element);
				//이미지 주소에서 ID만 자름
				idIntegers.add(Integer.parseInt(element.substring(52,57)));
			}
			
			
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
	}
	
}
