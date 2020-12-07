package a592070;

import a592070.pojo.TravelSetDO;
import a592070.service.TravelSetService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static a592070.service.TravelSetService.*;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringJUnitConfig(locations = {"classpath:springmvc.servlet.xml"})
public class TravelSetServiceTest {
    @Autowired(required = true)@Qualifier("sessionFactory")
    public SessionFactory sessionFactory;

    @Autowired@Qualifier("travelSetService")
    public TravelSetService service;

    @Test
    public void test(){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        session.getTransaction().rollback();
    }

    @Test
    public void getEle1(){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

//        TravelSetDO ele2 = service.getEle(1, false);
//        System.out.println(ele);

        System.out.println("=============================================");

        TravelSetDO ele = service.getEle(0, false, true);
        System.out.println(ele);

        session.getTransaction().rollback();
    }

    @Test
    public void getSize(){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        System.out.println(service.getSize());
        System.out.println(service.getSizeWithStatus(true));
        System.out.println(service.getSizeWithStatus(false));


        session.getTransaction().rollback();
    }

    @Test
    public void listByRownum(){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

//        System.out.println(service.listByRownum(1, 5));
//        System.out.println(service.listByRownum(1, 5, CREATED_TIME));
//        System.out.println(service.listByRownum(1, 5, UPDATE_TIME, true));
        System.out.println(service.listByRownumWithStatus(1, 5, true, CREATED_TIME));
        System.out.println(service.listByRownumWithStatus(1, 5, true, CREATED_TIME, true));
        session.getTransaction().rollback();
    }

}
