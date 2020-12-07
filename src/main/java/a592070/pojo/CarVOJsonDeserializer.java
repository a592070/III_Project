package a592070.pojo;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;

public class CarVOJsonDeserializer extends JsonDeserializer {
    @Override
    public CarVO deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = p.getCodec().readTree(p);
        CarVO carVO = new CarVO();
        carVO.setSn(node.get("sn").intValue());
        carVO.setCarType(node.get("name").textValue());
        if(node.get("company") != null) carVO.setCompany(node.get("company").textValue());
        if(node.get("price") != null) carVO.setPrice(node.get("price").intValue());
        return carVO;
    }
}
