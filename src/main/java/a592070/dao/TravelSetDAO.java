package a592070.dao;

import a592070.pojo.*;

import java.util.List;

public interface TravelSetDAO {
    List<TravelSetDO> listTravelSet(String created, Integer available);

    TravelSetDO getTravelSetByID(Integer id, Integer available);
    TravelSetDO getTravelSetByID(Integer id, boolean findFromPersistence);

    List<TravelEleAttractionDO> getAttractionSetByID(Integer id);

    List<TravelEleCarDO> getCarSetByID(Integer id);

    List<TravelEleHotelDO> getHotelSetByID(Integer id);

    List<TravelEleRestaurantDO> getRestaurantSetByID(Integer id);

    TravelSetDO addTravelSet(TravelSetDO travelSetDO);

    TravelSetDO updateTravelSet(TravelSetDO travelSetDO);

    boolean setTravelSetUnavailable(Integer sn);
}
