package com.hicgv.store.service;

import org.jsoup.Connection;
import org.jsoup.Connection.KeyVal;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CrawlStore {
	private String storeURL = "http://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=";
	private String idx=null;	//주소값 끝에 들어갈 숫자
	//2=영화관람권
	//3=기프티콘
	//4=콤보
	//5=팝콘
	//6=음료
	//7=스낵
	
	
	
	public CrawlStore(String idx) {
		this.idx = idx;			//카테고리 가져옴
		storeURL = storeURL+idx;//카테고리 번호 넣음 주소ㄴ
		System.out.println(storeURL);
		getStoreData(storeURL);
	}
	
	public void getStoreData(String url) {
		
		try {
			Document document = Jsoup.connect("http://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx/GetCategoryProductList")
					.header("Origin", "http://www.cgv.co.kr")
					.header("Referer","http://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5")
					.data("idx","5").post();
					
			//String json = document.select("body").text();
			
			System.out.println(document);
			/*Elements elements = document.select("strong");
			for (Element element : elements) {
				System.out.println(element);
			}*/
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
	
	
	
}
