package iring29;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import iring29.model.RestaurantDAO;
import iring29.model.Show_RView;

public class Test {
	private static ApplicationContext beans;

	public static void main(String[] args) {

		beans = new ClassPathXmlApplicationContext("springmvc.servlet.xml");

		RestaurantDAO rDao = beans.getBean("restaurantDAO", RestaurantDAO.class);
		
		List<Show_RView> result = rDao.totalRestaurant();
		for (Show_RView rView : result) {
			System.out.println(rView.getName());
		}
		
//		List<Show_RView> result = rDao.regionRestaurant("台中");
//		for (Show_RView rView : result) {
//		System.out.println(rView.getName());
//	}	

//		List<Show_RView> result = rDao.nameRestaurant("牛");
//		for (Show_RView rView : result) {
//			System.out.println(rView.getName());
//		}	
		
		//fail
//		List<Show_RView> result = rDao.userRestaurant("i");
//		for (Show_RView rView : result) {
//			System.out.println(rView.getR_sn());
//		}	
		
		((ConfigurableApplicationContext) beans).close();
	}

}
