package a592070.pojo;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;

public class RestaurantVOJsonDeserializer extends JsonDeserializer {
    @Override
    public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = p.getCodec().readTree(p);
        RestaurantVO rVO = new RestaurantVO();
        rVO.setSn(node.get("sn").intValue());
        rVO.setName(node.get("name").textValue());
        rVO.setDescription(node.get("description").textValue());
        rVO.setPicture(node.get("picture").textValue());
        rVO.setRegion(node.get("region").textValue());
        rVO.setRating(node.get("rating").decimalValue());
        rVO.setAddress(node.get("address").textValue());
        rVO.setType(node.get("type").textValue());
        return rVO;
    }
}
