package com.ezen.demo.crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.ezen.demo.vo.Yes24VO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@PropertySource("classpath:env.properties")
public class Yes24Crawling {
	@Value("${yes24.url}")
	private String yes24Url;

	public List<Yes24VO> crawlYes24() {
		List<Yes24VO> yes24List = new ArrayList<>();
		for (int i = 1; i <= 5; i++) {
			try {
				Document document = Jsoup.connect(yes24Url + i).get();
				Elements els = document.select("#category_layout tr");
				for (Element el : els) {
					Element imgEl = el.selectFirst("td.image img"); // 이미지
					if (imgEl != null) {
//				log.debug("img src=>{}", imgEl.attr("src"));
						Element titleEl = el.selectFirst("td.goodsTxtInfo p a");// 책 제목
//				log.debug("title src=>{}", titleEl.text());
						Element pEl = el.selectFirst("td.goodsTxtInfo p"); // 서브 제목
//				log.debug("sub title=>{}", pEl.childNode(2));
						Element noEl = el.selectFirst("tr td.num"); // 넘버
//				log.debug("no src=>{}", noEl.text());
						Element authEl = el.selectFirst("tr td.goodsTxtInfo div.aupu a"); // 작가
//				log.debug("auther=>{}", authEl.text());
						Element publishingEl = el.selectFirst("td.goodsTxtInfo div.aupu a:nth-child(2)"); // 출판사
//				log.debug("publishing=>{}", publishingEl.text());
						Element secPEl = el.selectFirst("td.goodsTxtInfo p:nth-child(3)"); // 가격
//				log.debug("lastPel=>{}", secPEl.childNode(0).toString().replace(" →",""));
//				log.debug("url=>{}", "http://www.yes24.com" + titleEl.attr("href")); 
						Element publishingDateEl = el.selectFirst(".aupu");
						Yes24VO yes24VO = new Yes24VO();
						String num = noEl.text().replace(".", "").trim();
						yes24VO.setYsNum(Integer.parseInt(num));
						String img = imgEl.attr("src").trim();
						yes24VO.setYsImg(img);
						String title = titleEl.text().trim();
						yes24VO.setYsTitle(title);
						String subTitle = pEl.childNode(2).toString().trim();
						yes24VO.setYsSubtitle(subTitle);
						String auter = authEl.text().trim();
						yes24VO.setYsAuter(auter);
						String publisging = publishingEl.text().trim();
						yes24VO.setYsPublishing(publisging);
						String publishingDate = publishingDateEl.text().replace(" | ", "").trim();
						yes24VO.setYsPublishingDate(publishingDate);
						String price = secPEl.childNode(0).toString().replace(" →", "").replace("원", "")
								.replace(",", "").trim();
						yes24VO.setYsPrice(price);
						String url = "http://www.yes24.com" + titleEl.attr("href").trim();
						yes24VO.setYsUrl(url);
						yes24List.add(yes24VO);

					}

				}

			} catch (IOException e) {

				e.printStackTrace();
			}
		}
		return yes24List;

	}

}
