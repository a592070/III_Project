package global;

public class Constant {
    public static final String USER_SESSION = "user_session";	// CONSTANT.user

    public static final String TravelSetListCar_session = "travelSetListCar";
    public static final String TravelSetListHotel_session = "travelSetListHotel";
    public static final String TravelSetListRestaurant_session = "travelSetListRestaurant";
    public static final String TravelSetListAttraction_session = "travelSetListAttraction";
    public static final String TravelSetList_session = "travelSetList";
    public static final String TravelSetEdit_session = "travelSetEdit";

    public static final String CHATROOM_CLIENTS = "chatRoomClients";
    public static final String LOGIN = "Login";
    public static final String HISTORY_MESSAGE = "historyMsg";

    public String getUser(){
        return USER_SESSION;
    }

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
