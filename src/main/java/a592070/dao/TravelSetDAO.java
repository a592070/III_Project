package a592070.dao;

import a592070.pojo.*;

import java.util.List;

public interface TravelSetDAO {
    List<TravelSetDO> listTravelSet(String created, int available);

    TravelSetDO getTravelSetByID(int id, int available);

    List<TravelEleAttractionDO> getAttractionSetByID(int id);

    List<TravelEleCarDO> getCarSetByID(int id);

    List<TravelEleHotelDO> getHotelSetByID(int id);

    List<TravelEleRestaurantDO> getRestaurantSetByID(int id);

    TravelSetDO addTravelSet(TravelSetDO travelSetDO);

    TravelSetDO updateTravelSet(TravelSetDO travelSetDO);

    boolean setTravelSetUnavailable(int sn);
}
