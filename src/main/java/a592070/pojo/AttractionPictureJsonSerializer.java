package a592070.pojo;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public class AttractionPictureJsonSerializer extends JsonSerializer<AttractionPictureDO> {
    @Override
    public void serialize(AttractionPictureDO value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeStartObject();
        gen.writeNumberField("id", value.getId());
        gen.writeStringField("picUrl", value.getPicUrl());
        gen.writeEndObject();
    }
}
