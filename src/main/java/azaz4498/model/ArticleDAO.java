package azaz4498.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import azaz4498.forum_constant;

@Lazy
public class ArticleDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Article> getRecentPost() {
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article WHERE ART_STATUS = 'enabled' Order by ART_CRE_TIME DESC",Article.class);
		query.setMaxResults(3);
		List<Article> recentArticles = query.list();
		return recentArticles;
	}
	
	public Map<String, Integer> getTypeCount(){
		Map<String, Integer> typeCount = new HashMap<String, Integer>();
		String hql = "select count(*) from Article WHERE ART_STATUS ='enabled' AND ART_TYPE_ID=?1";
		Query<Long>query = sessionFactory.getCurrentSession().createQuery(hql,Long.class);
		
		query.setParameter(1, forum_constant.TYPE_TRAVLE);
		Integer travel =query.uniqueResult().intValue();
		
		query.setParameter(1, forum_constant.TYPE_FOOD);
		Integer food = query.uniqueResult().intValue();
		
		query.setParameter(1, forum_constant.TYPE_ACCOMMODATION);
		Integer accommodation = query.uniqueResult().intValue();
		
		query.setParameter(1, forum_constant.TYPE_ITINERARY);
		Integer itinerary = query.uniqueResult().intValue();
		
		query.setParameter(1, forum_constant.TYPE_OTHERS);
		Integer others = query.uniqueResult().intValue();
		
		query.setParameter(1, forum_constant.TYPE_SCENERY);
		Integer scenery = query.uniqueResult().intValue();
		
		query.setParameter(1, forum_constant.TYPE_SHOPPING);
		Integer shooping = query.uniqueResult().intValue();
		
		query.setParameter(1, forum_constant.TYPE_TRAFFIC);
		Integer traffic = query.uniqueResult().intValue();
		
		typeCount.put("travel", travel);
		typeCount.put("food",food);
		typeCount.put("accommodation",accommodation);
		typeCount.put("itinerary",itinerary);
		typeCount.put("others",others);
		typeCount.put("scenery",scenery);
		typeCount.put("shooping",shooping);
		typeCount.put("traffic",traffic);
		return typeCount;
	}
	
	//找文章中圖片當封面
	public List<String> getCoverPicList(List<Article> artList){
		List<String> picList = new ArrayList<String>();
		String defaultImgPath = "direngine-master/images/article_default.jpg";
		for (Article article : artList) {
			String content = article.getArtContent();
			if (content != null && !content.equals("")) {// 判斷文章內容是否為空
				Document doc = Jsoup.parse(content);
				Element imgEle = doc.getElementsByTag("img").first();
				if (imgEle != null) {// 判斷img標籤是否存在
					if (imgEle.attr("stc").equals("")) {
						picList.add(defaultImgPath);
						
					} else {
						String coverImgPath = imgEle.attr("src");
						picList.add(coverImgPath);
					}
				} else {
					picList.add(defaultImgPath);
				}
			} else {
				picList.add(defaultImgPath);
			}
		}
		
		return picList;
		
	}
	
	//顯示總啟用筆數(前台)
	public Integer getRecords() {
		String query = "select count(ART_ID) from Article  WHERE ART_STATUS = 'enabled'";
		Integer totalRecords = sessionFactory.getCurrentSession().createQuery(query,Long.class).uniqueResult().intValue();
		
		return totalRecords;
	}
	//類別搜尋筆數(前台)
	public Integer getTypeSearchRecords(Integer articleType) {
		String hql = "select count(ART_ID) from Article where ART_TYPE_ID=?1";
		Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql,Long.class);
		query.setParameter(1, articleType);
		Integer totalRecords = query.uniqueResult().intValue();
		return totalRecords;
	}
	
	// 顯示搜尋文章筆數(前台)
		public Integer getSearchRecords(String keyword, Integer articleType) {
			if (articleType != null) {
				 String hql="select count(ART_ID) from Article where (ART_USERID LIKE ?1 OR ART_TITLE LIKE?2) AND ART_TYPE_ID LIKE ?3";
				 Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql,Long.class);
				 
						
				query.setParameter(1, "%" + keyword + "%");
				query.setParameter(2, "%" + keyword + "%");
				query.setParameter(3, articleType);
				int totalRecords = query.uniqueResult().intValue();
				return totalRecords;

			} else {
				String hql="select count(ART_ID) from Article where ART_USERID LIKE ?1 OR ART_TITLE LIKE?2";
				Query<Long> query = sessionFactory.getCurrentSession()
						.createQuery(hql,Long.class);
				query.setParameter(1, "%" + keyword + "%");
				query.setParameter(2, "%" + keyword + "%");
				int totalRecords = query.uniqueResult().intValue();
				return totalRecords;
			}

		}
	
	//顯示文章列表(非禁用)(前台)
	public List<Article> showAvailableArticles(Integer index,Integer records){
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article  WHERE ART_STATUS = 'enabled' Order by ART_ID",
				Article.class);
		//資料從index開始
		query.setFirstResult(index);
		//每頁幾筆
		query.setMaxResults(records);
		List<Article> list = query.list();
		return list;
	}
	
	
	// 搜尋文章(前台)
	public List<Article> searchArticleFrontend(String keyword, Integer articleType,Integer index,Integer records) {
		if (articleType != null) {
			Query<Article> query = sessionFactory.getCurrentSession().createQuery(
					"From Article where (ART_USERID LIKE ?1 OR ART_TITLE LIKE?2) AND ART_TYPE_ID LIKE ?3",
					Article.class);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");
			query.setParameter(3, articleType);
			//資料從index開始
			query.setFirstResult(index);
			//每頁幾筆
			query.setMaxResults(records);
			List<Article> list = query.list();
			return list;

		} else {
			Query<Article> query = sessionFactory.getCurrentSession()
					.createQuery("From Article where ART_USERID LIKE ?1 OR ART_TITLE LIKE?2", Article.class);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");
			//資料從index開始
			query.setFirstResult(index);
			//每頁幾筆
			query.setMaxResults(records);
			List<Article> list = query.list();
			return list;
		}

	}
	
	// 顯示文章列表
	public List<Article> showAllArticles() {
		
		
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article Order by ART_ID",
				Article.class);
		List<Article> list = query.list();
		return list;
	}

	// 顯示當前文章(by Id)
	public List<Article> showArticleById(Integer articleId) throws SQLException {
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_ID=?1",
				Article.class);
		query.setParameter(1, articleId);
		List<Article> list = query.list();
		return list;
	}

	// 依類型顯示文章(前台)
	public List<Article> showArticlesByType(Integer typeId,Integer index,Integer records) throws SQLException {

		Query<Article> query = sessionFactory.getCurrentSession()
				.createQuery("From Article where ART_TYPE_ID=?1 AND ART_STATUS = 'enabled'Order by ART_CRE_TIME", Article.class);
		query.setParameter(1, typeId);
		query.setMaxResults(records);
		query.setFirstResult(index);
		List<Article> list = query.list();
		return list;

	}

	// 新增文章
	public Article newArticle(String title, Integer typeId, String content, String userId) throws SQLException {
		Article article = new Article();
		ArticleType type = new ArticleType();
		article.setArtTitle(title);
		article.setArtContent(content);
		article.setArtUserId(userId);
		article.setArtCreTime(new java.sql.Timestamp(new java.util.Date().getTime()));
		article.setArtCommNum(0);
		article.setArtView(0);
		type.setTypeId(typeId);
		article.setArticleType(type);
		sessionFactory.getCurrentSession().save(article);
		System.out.println("New article created !");
		return article;

	}

	// 刪除文章
	public boolean deleteArticle(Integer articleId, String userid) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
			sessionFactory.getCurrentSession().delete(result);
			System.out.println("文章已刪除!");
			return true;
		}

		return false;

	}

	// 刪除文章(後台)
	public boolean deleteArticleByAdmin(Integer articleId) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		if (result != null) {
			sessionFactory.getCurrentSession().delete(result);
			System.out.println("文章已刪除!");
			return true;
		}

		return false;

	}

	// 編輯文章
	public Article articleEdit(String title, String content, Integer articleId, String userid, Integer typeId)
			throws SQLException {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
			ArticleType articleType = sessionFactory.getCurrentSession().get(ArticleType.class, typeId);
			result.setArtContent(content);
			result.setArtTitle(title);
			result.setArticleType(articleType);
			sessionFactory.getCurrentSession().update(result);
		}
		return result;
	}


	// 搜尋文章
	public List<Article> searchArticle(String keyword, Integer articleType) {
		if (articleType != null) {
			Query<Article> query = sessionFactory.getCurrentSession().createQuery(
					"From Article where (ART_USERID LIKE ?1 OR ART_TITLE LIKE?2) AND ART_TYPE_ID LIKE ?3",
					Article.class);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");
			query.setParameter(3, articleType);
			List<Article> list = query.list();
			return list;

		} else {
			Query<Article> query = sessionFactory.getCurrentSession()
					.createQuery("From Article where ART_USERID LIKE ?1 OR ART_TITLE LIKE?2", Article.class);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");
			List<Article> list = query.list();
			return list;
		}

	}

	// 改變文章status
	public Boolean switchStatus(Integer id) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, id);
		if (result != null) {
			String currStatus = result.getArtStatus();
			if (currStatus.equals("enabled")) {
				result.setArtStatus("disabled");
				sessionFactory.getCurrentSession().update(result);
				return true;
			} else {
				result.setArtStatus("enabled");
				sessionFactory.getCurrentSession().update(result);
				return true;
			}
		}
		return false;

	}
	//img upload
	public void imgUpload(int articleId, String filePath,String fileName) throws IOException {
		Picture picture = new Picture();
		FileInputStream fis = new FileInputStream(filePath);
		byte[] b= new byte[fis.available()];
		picture.setPicFileName(fileName);
		picture.setRefId(articleId);
		picture.setPicUrl(filePath);
		fis.read(b);
		fis.close();
		picture.setPicture(b);
		
		
	}
}