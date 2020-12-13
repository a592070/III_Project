package a592070.serializer;

import a592070.pojo.AttractionPictureDO;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;

public class AttractionPictureJsonDeserializer extends JsonDeserializer<AttractionPictureDO> {
    @Override
    public AttractionPictureDO deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = p.getCodec().readTree(p);

        AttractionPictureDO attractionPictureDO = new AttractionPictureDO();
        attractionPictureDO.setId(node.get("id").asInt());
        attractionPictureDO.setPicUrl(node.get("picUrl").asText());

        return attractionPictureDO;
    }
}
