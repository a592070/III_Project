package a592070.pojo;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;

public class AttractionVOJsonDeserializer extends JsonDeserializer<AttractionVO> {
    @Override
    public AttractionVO deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = p.getCodec().readTree(p);

        AttractionVO attraction = new AttractionVO();

        attraction.setSn(node.get("sn").intValue());

        attraction.setName(node.get("name").textValue());
        attraction.setDescription(node.get("description").textValue());
        attraction.setAddress(node.get("address").textValue());

        attraction.setPicture(node.get("picture").textValue());
        attraction.setTicketInfo(node.get("ticketInfo").textValue());

        return attraction;
    }
}
