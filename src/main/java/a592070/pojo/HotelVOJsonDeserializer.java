package a592070.pojo;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;

public class HotelVOJsonDeserializer extends JsonDeserializer {
    @Override
    public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = p.getCodec().readTree(p);
        HotelVO hotelVO = new HotelVO();
        hotelVO.setSn(node.get("sn").intValue());
        hotelVO.setName(node.get("name").textValue());
        hotelVO.setDescription(node.get("description").textValue());
        hotelVO.setDoubleRoomPrice(node.get("doubleRoomPrice").intValue());
        hotelVO.setQuadrupleRoomPrice(node.get("quadrupleRoomPrice").intValue());
        hotelVO.setRating(node.get("rating").decimalValue());
        hotelVO.setAddress(node.get("address").textValue());
        return hotelVO;
    }
}
