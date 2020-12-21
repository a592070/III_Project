package global;

public class Constant {
//    public static final String USER_SESSION = "user_session";	// CONSTANT.user
    public static final String USER_LOGIN_SESSION = "userBean";
    public static final String ADMIN_LOGIN_SESSION = "adminBean";

    public static final String STOMP_USERS = "stompUsers";


    public static final String TravelSetListCar_session = "travelSetListCar";
    public static final String TravelSetListHotel_session = "travelSetListHotel";
    public static final String TravelSetListRestaurant_session = "travelSetListRestaurant";
    public static final String TravelSetListAttraction_session = "travelSetListAttraction";
    public static final String TravelSetList_session = "travelSetList";
    public static final String TravelSetEdit_session = "travelSetEdit";


    public static final int TRAVEL_SET_TYPE_ATTRACTION = 0;
    public static final int TRAVEL_SET_TYPE_RESTAURANT = 1;
    public static final int TRAVEL_SET_TYPE_HOTEL = 2;


    public static final String WEB_INF_PATH = "/WEB-INF";

    public static final String ASSETS_URL = "/assets";
    public static final String ASSETS_PATH = WEB_INF_PATH+ASSETS_URL;

    public static final String ATTRACTION_PIC_URL = ASSETS_URL+"/attraction";
    public static final String ATTRACTION_PIC_PATH = WEB_INF_PATH + ATTRACTION_PIC_URL;

    public static final String TRAVEL_SET_RESTAURANT_PIC = "/travelSet/pic/1/";
    public static final String TRAVEL_SET_HOTEL_PIC = "/travelSet/pic/2/";


    public static final String CHATROOM_CLIENTS = "chatRoomClients";
    public static final String HISTORY_MESSAGE = "historyMsg";


    public static String getTravelSetListCar_session() {
        return TravelSetListCar_session;
    }

    public static String getTravelSetListHotel_session() {
        return TravelSetListHotel_session;
    }

    public static String getTravelSetListRestaurant_session() {
        return TravelSetListRestaurant_session;
    }

    public static String getTravelSetListAttraction_session() {
        return TravelSetListAttraction_session;
    }
}
